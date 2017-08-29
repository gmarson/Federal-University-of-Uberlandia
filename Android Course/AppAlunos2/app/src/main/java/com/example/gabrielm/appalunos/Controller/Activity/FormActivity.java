package com.example.gabrielm.appalunos.Controller.Activity;

import android.content.DialogInterface;
import android.content.Intent;
import android.content.SharedPreferences;
import android.location.Address;
import android.location.Geocoder;
import android.support.v7.app.AlertDialog;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.text.Editable;
import android.text.TextWatcher;
import android.util.Log;
import android.view.Menu;
import android.view.MenuInflater;
import android.view.MenuItem;
import android.view.View;
import android.widget.EditText;
import android.widget.ProgressBar;
import android.widget.Toast;

import com.android.volley.Request;
import com.android.volley.RequestQueue;
import com.android.volley.Response;
import com.android.volley.VolleyError;
import com.android.volley.toolbox.JsonObjectRequest;
import com.android.volley.toolbox.Volley;
import com.example.gabrielm.appalunos.Controller.Helper.FormHelper;
import com.example.gabrielm.appalunos.Model.DAO.ContatoDAO;
import com.example.gabrielm.appalunos.Model.Classes.Contato;
import com.example.gabrielm.appalunos.Model.Manager.CorreiosManager;
import com.example.gabrielm.appalunos.R;
import com.loopj.android.http.AsyncHttpResponseHandler;
import com.loopj.android.http.JsonHttpResponseHandler;
import com.loopj.android.http.RequestParams;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.ExecutionException;

import cz.msebera.android.httpclient.entity.mime.Header;

import static com.example.gabrielm.appalunos.R.id.form_name;

public class FormActivity extends AppCompatActivity {

    private int CEP_LENGTH = 8;
    private FormHelper formHelper;
    ProgressBar progressBar;

    private TextWatcher cepTextWatcher = new TextWatcher() {

        @Override
        public void onTextChanged(CharSequence s, int start, int before, int count) {
            getCep();
        }

        @Override
        public void beforeTextChanged(CharSequence s, int start, int count,
                                      int after) {
        }

        @Override
        public void afterTextChanged(Editable s) {

        }
    };

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_form);
        this.setTextWatchers();
        this.setupScreen();

    }

    @Override
    public boolean onCreateOptionsMenu(Menu menu) {
        MenuInflater inflater = getMenuInflater();
        inflater.inflate(R.menu.menu_form_ok, menu);
        return super.onCreateOptionsMenu(menu);
    }

    @Override
    public boolean onOptionsItemSelected(MenuItem item) {
        switch (item.getItemId()){
            case R.id.menu_formulario_ok:
                Contato contato = formHelper.getContato();
                ContatoDAO contatoDAO = new ContatoDAO(this);

                if (shouldAddContact()){

                    setCoordinatesBasedOnAddress(contato);

                    if(contato.getId() != null){
                        contatoDAO.update(contato);
                    }
                    else
                    {
                        contatoDAO.add(contato);
                    }
                    contatoDAO.close();

                    Toast.makeText(FormActivity.this, "Contato "+contato.getNome()+" Salvo!",Toast.LENGTH_SHORT).show();
                    finish();
                }
                else
                {
                    Toast.makeText(FormActivity.this, "Você não pode deixar o campo nome em branco!",Toast.LENGTH_LONG).show();

                }


                break;
        }


        return super.onOptionsItemSelected(item);
    }


    private void setupScreen(){
        formHelper = new FormHelper(this);

        Intent intent = getIntent();
        Contato contato = (Contato) intent.getSerializableExtra("contato");

        if (contato != null){
            formHelper.fillForm(contato);
        }

        progressBar = (ProgressBar) findViewById(R.id.progressBar1);
        progressBar.setVisibility(View.INVISIBLE);


    }

    private boolean shouldAddContact() {
        EditText contactName = (EditText) findViewById(form_name);
        return !contactName.getText().toString().equals("");
    }

    private void setCoordinatesBasedOnAddress(Contato contato){
        Geocoder geocoder = new Geocoder(FormActivity.this);
        List<Address> addresses = new ArrayList<>();

        try {
            addresses = geocoder.getFromLocationName(contato.getEndereco(),1);
        } catch (IOException e) {
            e.printStackTrace();
        }

        if(addresses.size() > 0) {
            contato.setLatitude(addresses.get(0).getLatitude());
            contato.setLongitude(addresses.get(0).getLongitude());

        }
    }

    private void setTextWatchers(){
        EditText cepField = (EditText) findViewById(R.id.form_cep);
        cepField.addTextChangedListener(cepTextWatcher);
    }


    private void getCep(){
        EditText cepField = (EditText) findViewById(R.id.form_cep);
        String cep = cepField.getText().toString();

        if(cep.length() == CEP_LENGTH){

            //String to place our result in
            String result = "Failed";

            //Instantiate new instance of our class
            CorreiosManager getRequest = new CorreiosManager();

            //Perform the doInBackground method, passing in our url
            try {
                progressBar.setVisibility(View.VISIBLE);
                result = getRequest.execute(CorreiosManager.getFullUrl(cep)).get();
            } catch (InterruptedException | ExecutionException e) {
                e.printStackTrace();
            }

            if (result != null){
                this.fillAddressEditText(result);
            }
            else
            {
                Toast.makeText(FormActivity.this, "Servico Falhou", Toast.LENGTH_SHORT).show();
            }

            progressBar.setVisibility(View.GONE);

        }



    }

    private void fillAddressEditText(String result) {
        String prettyAddress = CorreiosManager.getPrettyAddress(result);
        EditText address  = (EditText) findViewById(R.id.form_address);
        address.setText(prettyAddress);
    }



}
