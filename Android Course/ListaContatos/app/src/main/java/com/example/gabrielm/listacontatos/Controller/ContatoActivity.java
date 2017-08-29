package com.example.gabrielm.listacontatos.Controller;

import android.content.Intent;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.view.ContextMenu;
import android.view.MenuItem;
import android.view.View;
import android.widget.AdapterView;
import android.widget.ArrayAdapter;
import android.widget.ListView;
import android.widget.Toast;

import com.example.gabrielm.listacontatos.DAO.ContatoDAO;
import com.example.gabrielm.listacontatos.Model.Contato;
import com.example.gabrielm.listacontatos.R;

import java.util.List;

public class ContatoActivity extends AppCompatActivity {

    private ListView listaContatos;


    @Override
    protected void onResume() {
        super.onResume();
        loadContacts();


    }

    @Override
    protected void onCreate(final Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_contact);
        listaContatos = (ListView) findViewById(R.id.lista_contatos);



        listaContatos.setOnItemClickListener(new AdapterView.OnItemClickListener() {
            @Override
            public void onItemClick(AdapterView<?> parent, View view, int position, long id) {

                Contato contato = (Contato) listaContatos.getItemAtPosition(position);


                Intent goToFormActivity = new Intent(ContatoActivity.this,FormActivity.class);

                if(position != 0){
                    goToFormActivity.putExtra("contato",contato);
                }

                startActivity(goToFormActivity);
            }
        });

        registerForContextMenu(listaContatos);


    }



    public void loadContacts(){
        ContatoDAO contatoDAO = new ContatoDAO(this);
        List<Contato> contatos = contatoDAO.fetchContato();
        contatoDAO.close();

        ArrayAdapter<Contato> adapter = new ArrayAdapter<>(this, android.R.layout.simple_list_item_1, contatos);
        listaContatos.setAdapter(adapter);

        if (contatos.isEmpty())
        {
            Contato empty = new Contato();
            empty.setNome("Novo Contato");

            contatoDAO.add(empty);
            loadContacts();
        }

    }

    @Override
    public void onCreateContextMenu(ContextMenu menu, View v, final ContextMenu.ContextMenuInfo menuInfo) {
        MenuItem delete = menu.add("Deletar");
        delete.setOnMenuItemClickListener(new MenuItem.OnMenuItemClickListener() {
            @Override
            public boolean onMenuItemClick(MenuItem item) {
                AdapterView.AdapterContextMenuInfo info = (AdapterView.AdapterContextMenuInfo) menuInfo;
                Contato contato = (Contato) listaContatos.getItemAtPosition(info.position);

                if (info.position ==0)
                {
                    Toast.makeText(ContatoActivity.this,"Essa posição não pode ser removida!",Toast.LENGTH_LONG).show();
                }
                else
                {
                    ContatoDAO contatoDAO = new ContatoDAO(ContatoActivity.this);
                    contatoDAO.remove(contato);
                    contatoDAO.close();
                    loadContacts();
                }

                return false;
            }
        });

    }

    @Override
    public boolean onContextItemSelected(MenuItem item) {
        return super.onContextItemSelected(item);
    }

}
