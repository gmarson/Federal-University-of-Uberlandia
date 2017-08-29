package com.example.gabrielm.imc;

import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.widget.ImageView;
import android.widget.TextView;

import java.text.DecimalFormat;

public class ShowDataActivity extends AppCompatActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_show_data);

        double value = 0.0;
        Bundle extras = getIntent().getExtras();
        if (extras != null) {
            value = extras.getDouble("imcResult");
        }




        TextView textView = (TextView) findViewById(R.id.result);
        DecimalFormat df = new DecimalFormat("#.##");
        String formattedValue =df.format(value);
        textView.setText("O seu resultado foi:  " + formattedValue);
        handleImage(value);
    }


    public void handleImage(Double value){
        ImageView imageView = (ImageView) findViewById(R.id.display_gif);

        if (value < 18.4) {
            imageView.setImageResource(R.mipmap.thin);
        }
        else if (value < 24.9){
            imageView.setImageResource(R.mipmap.ok);
        }
        else if(value < 29.9){
            imageView.setBackgroundResource(R.mipmap.sobrepeso);
        }
        else{
            imageView.setImageResource(R.mipmap.fat_guy);
        }

    }

    public void handleGifImage(){
        /*ImageView imageView = (ImageView) findViewById(R.id.display_gif);
        GlideDrawableImageViewTarget imageViewTarget = new GlideDrawableImageViewTarget(imageView);
        Glide.with(this).load(R.drawable.fat).into(imageViewTarget);
        */
    }
}
