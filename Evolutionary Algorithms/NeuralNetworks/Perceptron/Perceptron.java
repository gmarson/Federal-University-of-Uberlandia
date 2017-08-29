import java.util.ArrayList;
import java.util.Scanner;
import java.lang.Math;
/**
 * Created by gmarson on 08/05/16.
 */
public class Perceptron   // eu vou instanciar só o perceptron na main
{
    private int sizeList= 31; // um a mais por conta do bias
    public ArrayList<Matrix> matrixDatabase = new ArrayList<Matrix>();
    public ArrayList<Matrix> matrixDatabaseTest = new ArrayList<Matrix>();
    public Neuron neuron;
    public double learningRate =1.0;
    public int epoch = 1000;


    public Perceptron(String option)
    {
        this.neuron = new Neuron(option,this.sizeList);
    }

    public void addMatrix(String filename,int value)
    {
        this.matrixDatabase.add(new Matrix(filename,value));
    }

    public void addTestMatrix(String filename,int value)
    {
        this.matrixDatabaseTest.add(new Matrix(filename,value));
    }

    public void trainingProcess()
    {

        Scanner s = new Scanner(System.in);
        int result;
        int i,time=0;
        int totalError=0;
        double erro;
        while(time < this.epoch)
        {

            for(i=0; i<this.matrixDatabase.size();i++)
            {
                //System.out.println("\n-----------------------------------------------------\n"+this.matrixDatabase.get(i).getMatrixString());
                //System.out.println("tamanho do tileWeights: "+this.neuron.tileWeight.length);

                result = test(i);
                //System.out.println("Matrix nº: "+i+"\nExpected Output: "+this.matrixDatabase.get(i).matrixExpectedValue+"\nReal Value: "+ result+"\nAfterFunctionValue: "+this.matrixDatabase.get(i).matrixCurrentValue);
                //erro = result - this.matrixDatabase.get(i).matrixExpectedValue;
                //System.out.println("ERROR: "+erro);
                totalError += Math.abs(result - this.matrixDatabase.get(i).matrixExpectedValue);
                //s.nextLine();

                if(result != this.matrixDatabase.get(i).matrixExpectedValue)
                {
                    //System.out.println("Vamos mudar os pesos !");
                    this.changeWeight(i); // mudo todos os pesos e vou testar a mudança para as proximas
                }
                else
                {

                    //System.out.println("Passei pela matriz de cima e não mudei os pesos");
                }
            }
            time++;
            if(totalError == 0) break;
            totalError=0;
        }

        System.out.println("Foram necessárioas "+time+" epocas");


    }

    public int test(int matrixPosition)
    {
        int tile;
        double tileWeight, result= 0;

        result = this.neuron.tileWeight[0] * this.neuron.bias;
        for(int i=1; i<sizeList;i++)
        {
            tile = this.matrixDatabase.get(matrixPosition).matrixVector[i];
            tileWeight = this.neuron.tileWeight[i];
            result += (tileWeight *  tile );
        }
        this.matrixDatabase.get(matrixPosition).matrixCurrentValue = result;
        return  this.neuron.stepFunction(result);
    }

    public int testInDatabaseTest(int matrixPosition, int op)
    {
        int tile;
        double tileWeight, result= 0;

        result = this.neuron.tileWeight[0] * this.neuron.bias;
        for(int i=1; i<sizeList;i++)
        {
            tile = this.matrixDatabaseTest.get(matrixPosition).matrixVector[i];
            tileWeight = this.neuron.tileWeight[i];
            result += (tileWeight *  tile );
        }
        this.matrixDatabaseTest.get(matrixPosition).matrixCurrentValue = result;
        return  this.neuron.stepFunction(result);
    }

    public void multipleTest()
    {
        int right=0,wrong=0,result;
        for(int i =0 ; i< this.matrixDatabaseTest.size();i++)
        {
            if((result = testInDatabaseTest(i,1)) == this.matrixDatabaseTest.get(i).matrixExpectedValue)
            {
                System.out.println("Got right matrix:\n" + this.matrixDatabaseTest.get(i).matrixString + "\nfor result " + result + "\nShould be "+ this.matrixDatabaseTest.get(i).matrixExpectedValue +"\n\n");
                right++;
            }
            else
            {
                System.out.println("Got wrong matrix:\n" + this.matrixDatabaseTest.get(i).matrixString + "\nfor result " + result + "\nShould be "+ this.matrixDatabaseTest.get(i).matrixExpectedValue +"\n\n");
                wrong++;
            }
        }
        System.out.println("Number of correct answers: "+right);
        //System.out.println(this.matrixDatabaseTest.size());
        System.out.println("Accuracy: "+ ((double)right/(double)this.matrixDatabase.size()) * 100 );
    }



    public int getError(int matrixPosition)
    {
        int error  = (int)(this.matrixDatabase.get(matrixPosition).matrixExpectedValue - this.neuron.stepFunction(this.matrixDatabase.get(matrixPosition).matrixCurrentValue));
        return  error;
    }

    public void changeWeight(int matrixPosition)
    {
        double error = getError(matrixPosition);

        this.neuron.tileWeight[0] += learningRate * error * this.neuron.bias;
        for(int i=1 ; i<this.sizeList;i++)
        {
            this.neuron.tileWeight[i] += learningRate * error * this.matrixDatabase.get(matrixPosition).matrixVector[i];

        }
    }

}
