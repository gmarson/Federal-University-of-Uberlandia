import java.util.ArrayList;
import java.util.Random;

/**
 * Created by gmarson on 08/05/16.
 */
public class Neuron
{

    public double tileWeight[];
    public double tileOutput [];
    public double bias = 1.0;

    public Neuron() {}

    // o array terá pesos aleatórios entre -1 e 1 ou vai começar os pesos com 0 em tudo
    public Neuron(String option, int sizeTileWeight)
    {
        tileWeight = new double[sizeTileWeight];
        tileOutput = new double[sizeTileWeight];
        if(option.equals("Sorted"))
        {
            Random r = new Random();
            int rangeMin = -1;
            int rangeMax = 1;
            for(int i=0;i<tileWeight.length;i++)
            {
                tileWeight[i] = rangeMin + (rangeMax - rangeMin) * r.nextDouble();
                //System.out.println(tileWeight[i]);
            }
        }
        else
        {
            for(int i =0;i<tileWeight.length;i++)
            {
                tileWeight[i] = 0.0;
            }
        }

    }

    public int stepFunction(double result)
    {

        if(result <= 0.0) return 0;
        return 1;
    }

    public void printTileWeight()
    {
        System.out.println("Tiles Weight");
        for(int i=0; i<tileWeight.length;i++)
        {
            System.out.print(tileWeight[i]+" ");
            if(i % 5 ==0) System.out.println("");
        }
    }



}
