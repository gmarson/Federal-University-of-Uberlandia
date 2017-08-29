package com.example.gabrielm.appalunos.Controller.Activity;

import android.app.Activity;
import android.content.Intent;
import android.graphics.Bitmap;
import android.graphics.drawable.BitmapDrawable;
import android.graphics.drawable.Drawable;
import android.os.Build;
import android.os.Bundle;
import android.support.design.widget.AppBarLayout;
import android.support.design.widget.FloatingActionButton;
import android.support.v7.app.AppCompatActivity;
import android.support.v7.widget.Toolbar;
import android.view.View;

import com.example.gabrielm.appalunos.Controller.Helper.ContactDisplayHelper;
import com.example.gabrielm.appalunos.Model.DAO.ContatoDAO;
import com.example.gabrielm.appalunos.Model.Classes.Contato;
import com.example.gabrielm.appalunos.R;

public class ContactDisplayActivity extends AppCompatActivity {

    private static final int CAMERA_REQUEST = 1888;
    private ContactDisplayHelper contactDisplayHelper;
    Contato contato;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_contact_display);
        Toolbar toolbar = (Toolbar) findViewById(R.id.toolbar);

        contactDisplayHelper = new ContactDisplayHelper(this);

        Intent intent = getIntent();
        this.contato = (Contato) intent.getSerializableExtra("contato");

        if (this.contato != null){

            contactDisplayHelper.fillForm(this.contato);
            toolbar.setTitle(this.contato.getNome());
            AppBarLayout toolbarLayout = (AppBarLayout) findViewById(R.id.app_bar);
            Drawable d = new BitmapDrawable(getResources(), this.contato.getBitmapImage());

            if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.JELLY_BEAN) {
                if (contato.getImage().length > 0)
                    toolbarLayout.setBackground(d);
            }
        }

        FloatingActionButton fab = (FloatingActionButton) findViewById(R.id.fab);
        fab.setImageResource(R.drawable.ic_action_camera);

        fab.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                Intent cameraIntent = new Intent(android.provider.MediaStore.ACTION_IMAGE_CAPTURE);
                startActivityForResult(cameraIntent, CAMERA_REQUEST);
            }
        });

        setSupportActionBar(toolbar);
    }

    protected void onActivityResult(int requestCode, int resultCode, Intent data) {
        if (requestCode == CAMERA_REQUEST && resultCode == Activity.RESULT_OK) {
            Bitmap photo = (Bitmap) data.getExtras().get("data");

            AppBarLayout toolbarLayout = (AppBarLayout) findViewById(R.id.app_bar);
            Drawable d = new BitmapDrawable(getResources(), photo);

            if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.JELLY_BEAN) {
                ContatoDAO contatoDAO = new ContatoDAO(this);

                contato.setBitmapToByteArray(photo);
                contatoDAO.update(contato);
                toolbarLayout.setBackground(d);

            }
        }
    }



}
