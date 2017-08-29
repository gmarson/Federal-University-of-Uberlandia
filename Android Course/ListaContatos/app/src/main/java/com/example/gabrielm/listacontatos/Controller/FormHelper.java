package com.example.gabrielm.listacontatos.Controller;

import android.widget.EditText;
import android.widget.FrameLayout;

import com.example.gabrielm.listacontatos.Model.Contato;
import com.example.gabrielm.listacontatos.R;

/**
 * Created by gabrielm on 20/05/17.
 */

public class FormHelper {
    private Contato contato;
    private EditText nameField;
    private EditText addressField;
    private EditText phoneNumberField;
    private EditText siteField;

    public FormHelper(FormActivity activity){
        nameField = (EditText) activity.findViewById(R.id.form_name);
        addressField = (EditText) activity.findViewById(R.id.form_address);
        phoneNumberField = (EditText) activity.findViewById(R.id.form_phone_nmber);
        siteField = (EditText) activity.findViewById(R.id.form_site);
        contato = new Contato();
    }

    public Contato getContato(){
        contato.setNome(nameField.getText().toString());
        contato.setEndereco(addressField.getText().toString());
        contato.setTelefone(phoneNumberField.getText().toString());
        contato.setSite(siteField.getText().toString());

        return contato;
    }

    public void fillForm(Contato contato){
        nameField.setText(contato.getNome());
        addressField.setText(contato.getEndereco());
        phoneNumberField.setText(contato.getTelefone());
        siteField.setText(contato.getSite());
        this.contato = contato;
    }

}
