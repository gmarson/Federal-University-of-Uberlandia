package com.example.gabrielm.imc;

import android.content.Intent;
import android.os.Bundle;
import android.support.design.widget.FloatingActionButton;
import android.support.design.widget.Snackbar;
import android.support.v7.app.AppCompatActivity;
import android.support.v7.widget.Toolbar;
import android.view.View;
import android.view.Menu;
import android.view.MenuItem;
import android.widget.Button;
import android.widget.EditText;
import android.widget.Toast;

public class ImcActivity extends AppCompatActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_imc);
        Toolbar toolbar = (Toolbar) findViewById(R.id.toolbar);
        setSupportActionBar(toolbar);
        configButton();

    }

    public void configButton(){
        Button btn = (Button) findViewById(R.id.calculate_button);
        final EditText peso = (EditText) findViewById(R.id.peso) ;
        final EditText altura = (EditText) findViewById(R.id.altura);

        btn.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Intent intent  = new Intent(ImcActivity.this, ShowDataActivity.class);

                if (!peso.getText().toString().equals("")  &&  !altura.getText().toString().equals(""))
                {
                    double pesoDouble = Double.valueOf(peso.getText().toString());
                    double alturaDouble = Double.valueOf(altura.getText().toString());
                    double result = pesoDouble / (alturaDouble *  alturaDouble);

                    intent.putExtra("imcResult", result);
                    startActivity(intent);
                }
                else
                {
                    Toast.makeText(ImcActivity.this, "Insira os dados corretamente!",
                            Toast.LENGTH_LONG).show();
                }

            }
        });
    }

}
