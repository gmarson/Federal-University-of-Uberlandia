package com.example.gabrielm.listacontatos.DAO;

import android.content.ContentValues;
import android.content.Context;
import android.database.Cursor;
import android.database.sqlite.SQLiteDatabase;
import android.database.sqlite.SQLiteOpenHelper;
import android.support.annotation.NonNull;

import com.example.gabrielm.listacontatos.Model.Contato;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by gabrielm on 20/05/17.
 */

public class ContatoDAO extends SQLiteOpenHelper {


    private static final String ID = "id";
    private static final String NAME = "nome";
    private static final String ADDRESS = "endereco";
    private static final String PHONE_NUMBER = "telefone";
    private static final String SITE = "site";
    private static final String TABLE_NAME = "Contatos";
    private static final String CREATE_TABLE = "CREATE TABLE "+TABLE_NAME+" ( "+ID+" INTEGER PRIMARY KEY, "+NAME+" TEXT NOT NULL, "+ADDRESS+" TEXT, "+PHONE_NUMBER+" TEXT, "+SITE+" TEXT);";
    private static final String DROP_TABLE = "DROP TABLE IF EXISTS "+TABLE_NAME+";";
    private static final String NOVO_CONTATO = "VALUES (1, Novo Contato , empty, empty, empty);";
    private static final String INSERT_FIXED_OPTION = "INSERT INTO "+TABLE_NAME+" ("+ID+","+NAME+","+ADDRESS+","+PHONE_NUMBER+","+SITE+")\n" + NOVO_CONTATO;
    private static final String FETCH_TABLE = "SELECT * FROM " +TABLE_NAME+ ";";



    private static int DATABASE_VERSION = 2;

    public ContatoDAO(Context context) {
        super(context, TABLE_NAME, null, DATABASE_VERSION);
    }

    @Override
    public void onCreate(SQLiteDatabase db) {
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

        data.put("nome",contato.getNome());
        data.put("endereco",contato.getEndereco());
        data.put("telefone",contato.getTelefone());
        data.put("site",contato.getSite());

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
            c.setTelefone(cursor.getString(cursor.getColumnIndex(PHONE_NUMBER)));
            c.setSite(cursor.getString(cursor.getColumnIndex(SITE)));

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
