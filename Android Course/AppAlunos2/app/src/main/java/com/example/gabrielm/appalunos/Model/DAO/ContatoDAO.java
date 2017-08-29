package com.example.gabrielm.appalunos.Model.DAO;

import android.content.ContentValues;
import android.content.Context;
import android.database.Cursor;
import android.database.sqlite.SQLiteDatabase;
import android.database.sqlite.SQLiteOpenHelper;
import android.support.annotation.NonNull;

import com.example.gabrielm.appalunos.Model.Classes.Contato;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by gabrielm on 24/06/17.
 */

public class ContatoDAO extends SQLiteOpenHelper {


    private static final String ID = "id";
    private static final String NAME = "nome";
    private static final String ADDRESS = "endereco";
    private static final String PHONE_NUMBER = "telefone";
    private static final String LATITUDE = "latitude";
    private static final String LONGITUDE = "longitude";
    private static final String SITE = "site";
    private static final String EMAIL = "email";
    private static final String CEP = "cep";
    private static final String USER_IMAGE = "image";
    private static final String TABLE_NAME = "Contatos";
    private static final String CREATE_TABLE = "CREATE TABLE "+TABLE_NAME+" ( "+ID+" INTEGER PRIMARY KEY, "
            +NAME+" TEXT NOT NULL, "
            +ADDRESS+" TEXT, "
            +CEP+" TEXT, "
            +PHONE_NUMBER+" TEXT, "
            +SITE+" TEXT, "
            +EMAIL+" TEXT, "
            +USER_IMAGE+ " BLOB, "
            +LATITUDE+ " REAL, "
            +LONGITUDE+ " REAL "
            + " );";
    private static final String DROP_TABLE = "DROP TABLE IF EXISTS "+TABLE_NAME+";";
    private static final String FETCH_TABLE = "SELECT * FROM " +TABLE_NAME+ ";";

    private static int DATABASE_VERSION = 7;

    public ContatoDAO(Context context) {
        super(context, TABLE_NAME, null, DATABASE_VERSION);
    }

    @Override
    public void onCreate(SQLiteDatabase db) {
        db.execSQL(DROP_TABLE);
        db.execSQL(CREATE_TABLE);
    }

    @Override
    public void onUpgrade(SQLiteDatabase db, int oldVersion, int newVersion) {
        db.execSQL(DROP_TABLE);
        onCreate(db);
    }

    @NonNull
    private ContentValues getContentValues(Contato contato) {
        ContentValues data = new ContentValues();

        data.put(NAME,contato.getNome());
        data.put(ADDRESS,contato.getEndereco());
        data.put(CEP,contato.getCep());
        data.put(PHONE_NUMBER,contato.getTelefone());
        data.put(SITE,contato.getSite());
        data.put(EMAIL,contato.getEmail());
        data.put(LATITUDE,contato.getLatitude());
        data.put(LONGITUDE,contato.getLongitude());
        data.put(USER_IMAGE,contato.getImage());


        return data;
    }

    public void add(Contato contato){
        SQLiteDatabase sqLiteDatabase = getWritableDatabase();
        ContentValues data = getContentValues(contato);
        sqLiteDatabase.insert(TABLE_NAME,null,data);
    }

    public List<Contato> fetchContato(){
        SQLiteDatabase sqLiteDatabase = getReadableDatabase();
        Cursor cursor = sqLiteDatabase.rawQuery(FETCH_TABLE,null);

        List<Contato> contatos = new ArrayList<>();
        while (cursor.moveToNext())
        {
            Contato c = new Contato();
            c.setId(cursor.getLong(cursor.getColumnIndex(ID)));
            c.setNome(cursor.getString(cursor.getColumnIndex(NAME)));
            c.setEndereco(cursor.getString(cursor.getColumnIndex(ADDRESS)));
            c.setCep(cursor.getString(cursor.getColumnIndex(CEP)));
            c.setTelefone(cursor.getString(cursor.getColumnIndex(PHONE_NUMBER)));
            c.setSite(cursor.getString(cursor.getColumnIndex(SITE)));
            c.setEmail(cursor.getString(cursor.getColumnIndex(EMAIL)));
            c.setLatitude(cursor.getDouble(cursor.getColumnIndex(LATITUDE)));
            c.setLongitude(cursor.getDouble(cursor.getColumnIndex(LONGITUDE)));
            c.setImage(cursor.getBlob(cursor.getColumnIndex(USER_IMAGE)));
            contatos.add(c);
        }
        cursor.close();
        return contatos;
    }


    public void remove(Contato contato)
    {
        SQLiteDatabase sqLiteDatabase = getWritableDatabase();
        String[] params = {contato.getId().toString()};
        sqLiteDatabase.delete(TABLE_NAME,"id = ?",params);
    }

    public void update(Contato contato)
    {
        SQLiteDatabase sqLiteDatabase = getWritableDatabase();
        ContentValues data = getContentValues(contato);
        String[] params = {contato.getId().toString()};
        sqLiteDatabase.update(TABLE_NAME,data,"id = ?",params);
    }


}
