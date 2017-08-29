package com.example.gabrielm.appalunos.Model.Classes;

import android.app.Activity;
import android.content.Context;
import android.graphics.Bitmap;
import android.graphics.drawable.BitmapDrawable;
import android.graphics.drawable.Drawable;
import android.support.v7.app.AppCompatActivity;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ArrayAdapter;
import android.widget.BaseAdapter;
import android.widget.ImageView;
import android.widget.TextView;
import android.widget.Toast;

import com.example.gabrielm.appalunos.Model.Classes.Contato;
import com.example.gabrielm.appalunos.R;

import java.util.List;


/**
 * Created by gabrielm on 01/07/17.
 */

public class ContatoAdapter extends ArrayAdapter<Contato>{

    Context context;
    int layoutResourceId;
    List<Contato> data = null;

    public ContatoAdapter(Context context, int layoutResourceId, List<Contato> data) {
        super(context, layoutResourceId, data);
        this.layoutResourceId = layoutResourceId;
        this.context = context;
        this.data = data;
    }

    @Override
    public View getView(int position, View convertView, ViewGroup parent) {
        View row = convertView;
        ContatoHolder holder = null;

        if(row == null)
        {
            LayoutInflater inflater = ((Activity)context).getLayoutInflater();
            row = inflater.inflate(layoutResourceId, parent, false);

            holder = new ContatoHolder();
            holder.imgIcon = (ImageView)row.findViewById(R.id.imgIcon);
            holder.txtTitle = (TextView)row.findViewById(R.id.txtTitle);

            row.setTag(holder);
        }
        else
        {
            holder = (ContatoHolder)row.getTag();
        }

        Contato contato = data.get(position);
        holder.txtTitle.setText(contato.getNome());


        this.chooseImage(holder,contato);


        return row;
    }


    private void chooseImage(ContatoHolder holder, Contato contato){

        if (contato.getImage().length == 0){
            holder.imgIcon.setImageResource(R.drawable.ic_action_user);
        }
        else
        {
            Bitmap image = contato.getBitmapImage();
            holder.imgIcon.setImageBitmap(image);
        }
    }

    private static class ContatoHolder
    {
        ImageView imgIcon;
        TextView txtTitle;
    }
}