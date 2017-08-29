package com.example.gabrielm.appalunos.Model.Manager;

import android.os.AsyncTask;
import android.widget.Toast;

import com.android.volley.*;
import com.android.volley.toolbox.Volley;

import org.json.JSONException;
import org.json.JSONObject;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import com.loopj.android.http.*;

/**
 * Created by gabrielm on 30/06/17.
 */

public  class CorreiosManager extends AsyncTask<String, Void, String> {

    private static final String BASE_URL = "https://viacep.com.br/ws/";
    private static final String RETURN_TYPE = "/json/";

    private static final String REQUEST_METHOD = "GET";
    private static final int READ_TIMEOUT = 10000;
    private static final int CONNECTION_TIMEOUT = 10000;

    @Override
    protected void onPostExecute(String result){
        super.onPostExecute(result);
    }

    @Override
    protected String doInBackground(String... params){
        String stringUrl = params[0];
        String result;
        String inputLine;

        try {
            //Create a URL object holding our url
            URL myUrl = new URL(stringUrl);
            //Create a connection
            HttpURLConnection connection =(HttpURLConnection)
                    myUrl.openConnection();

            connection.setRequestMethod(REQUEST_METHOD);
            connection.setReadTimeout(READ_TIMEOUT);
            connection.setConnectTimeout(CONNECTION_TIMEOUT);

            //Connect to our url
            connection.connect();

            //Create a new InputStreamReader
            InputStreamReader streamReader = new
                    InputStreamReader(connection.getInputStream());

            //Create a new buffered reader and String Builder
            BufferedReader reader = new BufferedReader(streamReader);
            StringBuilder stringBuilder = new StringBuilder();

            //Check if the line we are reading is not null
            while((inputLine = reader.readLine()) != null){
                stringBuilder.append(inputLine);
            }
            //Close our InputStream and Buffered reader
            reader.close();
            streamReader.close();
            //Set our result equal to our stringBuilder
            result = stringBuilder.toString();
        }
        catch(IOException e){
            e.printStackTrace();
            result = null;
        }

        return result;
    }

    public static String getFullUrl(String cep){
        return BASE_URL + cep + RETURN_TYPE;
    }


    private static JSONObject getJsonFromString(String string){
        try {
             return new JSONObject(string);
        } catch (JSONException e) {
            e.printStackTrace();
        }
        return  null;
    }

    public static String getPrettyAddress(String result){
        JSONObject jsonFromString = getJsonFromString(result);
        String address;
        if (jsonFromString != null){
            try {
                address = jsonFromString.getString("logradouro") + " - "+ jsonFromString.getString("localidade");
                return address;
            } catch (JSONException e) {
                e.printStackTrace();
            }
        }
        else
        {
            return  "";
        }

        return "";
    }

}
