package com.example.gabrielm.appalunos.Controller.Activity;

import android.content.Context;
import android.content.DialogInterface;
import android.content.Intent;
import android.content.SharedPreferences;
import android.content.pm.PackageManager;
import android.content.pm.ResolveInfo;
import android.net.Uri;
import android.os.Bundle;
import android.support.design.widget.FloatingActionButton;
import android.support.v7.app.AlertDialog;
import android.support.v7.app.AppCompatActivity;
import android.support.v7.widget.Toolbar;
import android.view.ContextMenu;
import android.view.View;
import android.view.MenuItem;
import android.widget.AdapterView;
import android.widget.ArrayAdapter;
import android.widget.ListView;
import android.widget.Toast;

import com.example.gabrielm.appalunos.Model.Classes.ContatoAdapter;
import com.example.gabrielm.appalunos.Model.DAO.ContatoDAO;
import com.example.gabrielm.appalunos.Model.Classes.Contato;
import com.example.gabrielm.appalunos.R;

import java.util.List;

public class MainActivity extends AppCompatActivity {

    private final String MESSAGE = "Bem Vindo ao App!\n" +
            "Nele você tem o controle de todos os seus Alunos!";
    private ListView listaContatos;


    @Override
    protected void onResume() {
        super.onResume();
        loadContacts();
        showWelcomeMessage();
    }



    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
        Toolbar toolbar = (Toolbar) findViewById(R.id.toolbar);
        setSupportActionBar(toolbar);

        listaContatos = (ListView) findViewById(R.id.lista_contatos);

        listaContatos.setOnItemClickListener(new AdapterView.OnItemClickListener() {
            @Override
            public void onItemClick(AdapterView<?> parent, View view, int position, long id) {

                Contato contato = (Contato) listaContatos.getItemAtPosition(position);

                Intent gotToContactActivity = new Intent(MainActivity.this,ContactDisplayActivity.class);

                gotToContactActivity.putExtra("contato",contato);

                startActivity(gotToContactActivity);
            }
        });

        registerForContextMenu(listaContatos);

        FloatingActionButton fab = (FloatingActionButton) findViewById(R.id.fab);
        fab.setImageResource(R.drawable.ic_action_add);
        fab.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {

                Intent goToFormActivity = new Intent(MainActivity.this,FormActivity.class);
                startActivity(goToFormActivity);

            }
        });
    }




    public void loadContacts(){
        ContatoDAO contatoDAO = new ContatoDAO(this);
        List<Contato> contatos = contatoDAO.fetchContato();
        contatoDAO.close();

        ContatoAdapter contatoAdapter = new ContatoAdapter(this,R.layout.listview_item_row,contatos);


        ArrayAdapter<Contato> adapter = new ArrayAdapter<>(this, android.R.layout.simple_list_item_1, contatos);
        listaContatos.setAdapter(contatoAdapter);

    }

    @Override
    public void onCreateContextMenu(ContextMenu menu, View v, final ContextMenu.ContextMenuInfo menuInfo) {

        final MenuItem call = menu.add("Ligar");
        MenuItem sendSMS = menu.add("Enviar SMS");
        MenuItem findOnMap = menu.add("Achar no Mapa");
        MenuItem website = menu.add("Navegar no site");
        MenuItem email = menu.add("Enviar Email");
        MenuItem edit = menu.add("Alterar");
        MenuItem delete = menu.add("Deletar");


        delete.setOnMenuItemClickListener(new MenuItem.OnMenuItemClickListener() {
            @Override
            public boolean onMenuItemClick(MenuItem item) {
                AdapterView.AdapterContextMenuInfo info = (AdapterView.AdapterContextMenuInfo) menuInfo;
                Contato contato = (Contato) listaContatos.getItemAtPosition(info.position);

                ContatoDAO contatoDAO = new ContatoDAO(MainActivity.this);
                contatoDAO.remove(contato);
                contatoDAO.close();
                loadContacts();


                return false;
            }
        });

        sendSMS.setOnMenuItemClickListener(new MenuItem.OnMenuItemClickListener() {
            @Override
            public boolean onMenuItemClick(MenuItem item) {
                AdapterView.AdapterContextMenuInfo info = (AdapterView.AdapterContextMenuInfo) menuInfo;
                Contato contato = (Contato) listaContatos.getItemAtPosition(info.position);

                String phoneNumber = contato.getTelefone();
                String message = "default body message";

                Intent intent = new Intent(Intent.ACTION_VIEW, Uri.parse("sms:" + phoneNumber));
                intent.putExtra("sms_body", message);
                startActivity(intent);

                return false;
            }
        });

        call.setOnMenuItemClickListener(new MenuItem.OnMenuItemClickListener() {
            @Override
            public boolean onMenuItemClick(MenuItem item) {
                AdapterView.AdapterContextMenuInfo info = (AdapterView.AdapterContextMenuInfo) menuInfo;
                Contato contato = (Contato) listaContatos.getItemAtPosition(info.position);

                String phoneNumber = contato.getTelefone();
                startActivity(new Intent(Intent.ACTION_DIAL, Uri.fromParts("tel", phoneNumber, null)));

                return false;
            }
        });


        findOnMap.setOnMenuItemClickListener(new MenuItem.OnMenuItemClickListener(){
            @Override
            public boolean onMenuItemClick(MenuItem item) {
                AdapterView.AdapterContextMenuInfo info = (AdapterView.AdapterContextMenuInfo) menuInfo;
                Contato contato = (Contato) listaContatos.getItemAtPosition(info.position);

                String address = contato.getEndereco();
                String latitude = String.valueOf(contato.getLatitude());
                String longitude = String.valueOf(contato.getLongitude());
                Uri uri = Uri.parse("geo:"+latitude+","+longitude+"?q=" + Uri.encode(address));


                Intent searchAddress = new  Intent(Intent.ACTION_VIEW,uri);
                startActivity(searchAddress);


                return false;
            }
        });

        edit.setOnMenuItemClickListener(new MenuItem.OnMenuItemClickListener(){
            @Override
            public boolean onMenuItemClick(MenuItem item) {
                AdapterView.AdapterContextMenuInfo info = (AdapterView.AdapterContextMenuInfo) menuInfo;
                Contato contato = (Contato) listaContatos.getItemAtPosition(info.position);
                Intent goToFormActivity = new Intent(MainActivity.this,FormActivity.class);

                goToFormActivity.putExtra("contato",contato);

                startActivity(goToFormActivity);


                return false;
            }
        });

        website.setOnMenuItemClickListener(new MenuItem.OnMenuItemClickListener(){
            @Override
            public boolean onMenuItemClick(MenuItem item) {
                AdapterView.AdapterContextMenuInfo info = (AdapterView.AdapterContextMenuInfo) menuInfo;
                Contato contato = (Contato) listaContatos.getItemAtPosition(info.position);

                String url = contato.getSite();
                if (!url.startsWith("http://") && !url.startsWith("https://"))
                    url = "http://" + url;

                Intent browserIntent = new Intent(Intent.ACTION_VIEW, Uri.parse(url));
                startActivity(browserIntent);

                return false;
            }
        });

        email.setOnMenuItemClickListener(new MenuItem.OnMenuItemClickListener(){
            @Override
            public boolean onMenuItemClick(MenuItem item) {
                AdapterView.AdapterContextMenuInfo info = (AdapterView.AdapterContextMenuInfo) menuInfo;
                Contato contato = (Contato) listaContatos.getItemAtPosition(info.position);

                Intent emailIntent = new Intent(Intent.ACTION_SEND);
                emailIntent.setType("message/rfc822");
                emailIntent.putExtra(Intent.EXTRA_EMAIL  , new String[]{contato.getEmail()});
                emailIntent.putExtra(Intent.EXTRA_SUBJECT, "Assunto do email");
                emailIntent.putExtra(Intent.EXTRA_TEXT   , "Corpo do email");

                if (isMailClientPresent(MainActivity.this,emailIntent)){
                    try {
                        startActivity(Intent.createChooser(emailIntent, "Eviar email usando..."));
                    } catch (android.content.ActivityNotFoundException ex) {
                        Toast.makeText(MainActivity.this, "Ocorreu um erro!", Toast.LENGTH_SHORT).show();
                    }
                }
                else
                {
                    redirectToPlayStore();
                    Toast.makeText(MainActivity.this, "Baixe um cliente de email", Toast.LENGTH_SHORT).show();
                }

                return false;
            }
        });
    }

    @Override
    public boolean onContextItemSelected(MenuItem item) {
        return super.onContextItemSelected(item);
    }


    private static boolean isMailClientPresent(Context context, Intent emailIntent){

        final PackageManager packageManager = context.getPackageManager();
        List<ResolveInfo> list = packageManager.queryIntentActivities(emailIntent, 0);

        return list.size() != 0;
    }

    private void redirectToPlayStore(){
        Intent intent = new Intent(Intent.ACTION_VIEW);
        Uri uri = Uri.parse("https://play.google.com/store/apps/");
        intent.setData(uri);
        startActivity(intent);
    }

    private void showWelcomeMessage(){
        final String PREF = "MyPref";
        final String KEY = "firstTime";
        final String VALUE = "no";
        SharedPreferences shared = getApplicationContext().getSharedPreferences(PREF, 0);
        String firstTime = shared.getString(KEY,null);
        if (firstTime == null) {

            AlertDialog alertDialog = new AlertDialog.Builder(MainActivity.this).create();
            alertDialog.setTitle("Olá!");
            alertDialog.setMessage(MESSAGE);
            alertDialog.setButton(AlertDialog.BUTTON_NEUTRAL, "OK",
                    new DialogInterface.OnClickListener() {
                        public void onClick(DialogInterface dialog, int which) {
                            dialog.dismiss();
                        }
                    });
            alertDialog.show();

            SharedPreferences.Editor editor = shared.edit();
            editor.putString(KEY,VALUE);
            editor.commit();

        }
    }

}
