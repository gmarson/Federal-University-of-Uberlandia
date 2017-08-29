package com.example.gabrielm.appalunos.Controller.Helper;

import android.widget.EditText;

import com.example.gabrielm.appalunos.Controller.Activity.FormActivity;
import com.example.gabrielm.appalunos.Model.Classes.Contato;
import com.example.gabrielm.appalunos.R;

/**
 * Created by gabrielm on 24/06/17.
 */

public class FormHelper {
    private Contato contato;
    private EditText nameField;
    private EditText addressField;
    private EditText phoneNumberField;
    private EditText siteField;
    private EditText emailField;
    private EditText cepField;

    public FormHelper(FormActivity activity){
        nameField = (EditText) activity.findViewById(R.id.form_name);
        addressField = (EditText) activity.findViewById(R.id.form_address);
        phoneNumberField = (EditText) activity.findViewById(R.id.form_phone_nmber);
        siteField = (EditText) activity.findViewById(R.id.form_site);
        emailField = (EditText) activity.findViewById(R.id.form_email);
        cepField = (EditText) activity.findViewById(R.id.form_cep);
        contato = new Contato();
    }

    public Contato getContato(){
        contato.setNome(nameField.getText().toString());
        contato.setEndereco(addressField.getText().toString());
        contato.setTelefone(phoneNumberField.getText().toString());
        contato.setSite(siteField.getText().toString());
        contato.setEmail(emailField.getText().toString());
        contato.setCep(cepField.getText().toString());

        return contato;
    }

    public void fillForm(Contato contato){
        nameField.setText(contato.getNome());
        addressField.setText(contato.getEndereco());
        phoneNumberField.setText(contato.getTelefone());
        siteField.setText(contato.getSite());
        emailField.setText(contato.getEmail());
        cepField.setText(contato.getCep());
        this.contato = contato;
    }
}
