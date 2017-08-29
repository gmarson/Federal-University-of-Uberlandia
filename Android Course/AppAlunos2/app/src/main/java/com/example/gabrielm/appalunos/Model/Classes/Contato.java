package com.example.gabrielm.appalunos.Model.Classes;

import android.graphics.Bitmap;
import android.graphics.BitmapFactory;

import java.io.ByteArrayOutputStream;
import java.io.Serializable;

/**
 * Created by gabrielm on 24/06/17.
 */

public class Contato implements Serializable {
    private Long id;
    private String nome;
    private String endereco;
    private String telefone;
    private String site;
    private String email;
    private String cep;



    private double latitude;
    private double longitude;
    private byte[] image = new byte[0];

    public void setBitmapToByteArray(Bitmap bitmap){
        ByteArrayOutputStream stream = new ByteArrayOutputStream();
        bitmap.compress(Bitmap.CompressFormat.PNG, 100, stream);
        image =  stream.toByteArray();
    }

    public Bitmap getBitmapImage() {
        return image.length > 0 ?  BitmapFactory.decodeByteArray(image, 0, image.length) : null;
    }

    public byte[] getImage() {return image;}

    public void setImage(byte[] image) {this.image = image;}

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public String getEndereco() {
        return endereco;
    }

    public void setEndereco(String endereco) {
        this.endereco = endereco;
    }

    public String getTelefone() {
        return telefone;
    }

    public void setTelefone(String telefone) {
        this.telefone = telefone;
    }

    public String getSite() {
        return site;
    }

    public void setSite(String site) {
        this.site = site;
    }

    public String getEmail() {return email;}

    public void setEmail(String email) {this.email = email;}

    public double getLatitude() {return latitude;}

    public void setLatitude(double latitude) {this.latitude = latitude;}

    public double getLongitude() {return longitude;}

    public void setLongitude(double longitude) {this.longitude = longitude;}

    public String getCep() {return cep;}

    public void setCep(String cep) {this.cep = cep;}

    @Override
    public String toString(){return this.nome;}


}
