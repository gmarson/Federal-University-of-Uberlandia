package com.example.gabrielm.listacontatos.Controller;

import android.content.Intent;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.view.Menu;
import android.view.MenuInflater;
import android.view.MenuItem;
import android.widget.Toast;

import com.example.gabrielm.listacontatos.DAO.ContatoDAO;
import com.example.gabrielm.listacontatos.Model.Contato;
import com.example.gabrielm.listacontatos.R;

public class FormActivity extends AppCompatActivity {

    private FormHelper formHelper;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_form);

        formHelper = new FormHelper(this);

        Intent intent = getIntent();
        Contato contato = (Contato) intent.getSerializableExtra("contato");

        if (contato != null){
            formHelper.fillForm(contato);
        }

    }

    @Override
    public boolean onCreateOptionsMenu(Menu menu) {
        MenuInflater inflater = getMenuInflater();
        inflater.inflate(R.menu.menu_form, menu);
        return super.onCreateOptionsMenu(menu);
    }

    @Override
    public boolean onOptionsItemSelected(MenuItem item) {
        switch (item.getItemId()){
            case R.id.menu_formulario_ok:
                Contato contato = formHelper.getContato();
                ContatoDAO contatoDAO = new ContatoDAO(this);

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
                break;
        }


        return super.onOptionsItemSelected(item);
    }
}
