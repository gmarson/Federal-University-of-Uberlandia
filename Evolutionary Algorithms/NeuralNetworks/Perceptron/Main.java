import java.lang.reflect.Array;
import java.util.ArrayList;
import java.util.Scanner;

public class Main {


    public static void main(String[] args)
    {
        //Main.Exercise1();
        //Main.Exercise2();
        Main.Exercise3();
    }

    public static void Exercise1()
    {
        String PATH = "/home/gmarson/GIT/Artificial-Inteligence/NeuralNetworks/Perceptron/Inputs/";
        System.out.println("Initializing Perceptron ...");

        Perceptron p = new Perceptron("Sorted");
        p.addMatrix(PATH+"input0.txt",0);
        p.addMatrix(PATH+"input1.txt",1);

        p.trainingProcess();

        p.neuron.printTileWeight();

        for(Integer i=1;i<=10;i++)
        {
            p.addTestMatrix(PATH+"Distorted0/input0"+i.toString()+".txt" ,0);
        }
        for(Integer i=1;i<=10;i++)
        {
            p.addTestMatrix(PATH+"Distorted1/input1"+i.toString()+".txt" ,1);
        }

        p.multipleTest();

        p.matrixDatabaseTest.clear();

        p.addTestMatrix(PATH+"input2.txt",2);
        p.addTestMatrix(PATH+"input3.txt",3);
        p.addTestMatrix(PATH+"input4.txt",4);
        p.addTestMatrix(PATH+"input5.txt",5);

        p.multipleTest();


    }

    public static void Exercise2()
    {


        String PATH = "/home/gmarson/GIT/Artificial-Inteligence/NeuralNetworks/Perceptron/Inputs/";

        System.out.println("Initializing Perceptron ...");

        Perceptron y2 = new Perceptron("Sorted");
        Perceptron y1 = new Perceptron("Sorted");
        y2.addMatrix(PATH+"input0.txt",0);
        y2.addMatrix(PATH+"input1.txt",1);

        y1.addMatrix(PATH+"input0.txt",1);
        y1.addMatrix(PATH+"input1.txt",0);

        y1.trainingProcess();
        y2.trainingProcess();

        y2.neuron.printTileWeight();
        y1.neuron.printTileWeight();

        for(Integer i=1;i<=10;i++)
        {
            y2.addTestMatrix(PATH+"Distorted0/input0"+i.toString()+".txt" ,0);
            y1.addTestMatrix(PATH+"Distorted0/input0"+i.toString()+".txt" ,1);
        }
        for(Integer i=1;i<=10;i++)
        {
            y2.addTestMatrix(PATH+"Distorted1/input1"+i.toString()+".txt" ,1);
            y1.addTestMatrix(PATH+"Distorted1/input1"+i.toString()+".txt" ,0);
        }


        Main.checkResult(y1,y2);

        y1.matrixDatabaseTest.clear();
        y2.matrixDatabaseTest.clear();

        y1.addTestMatrix(PATH+"input2.txt",2);
        y1.addTestMatrix(PATH+"input3.txt",3);
        y1.addTestMatrix(PATH+"input4.txt",4);
        y1.addTestMatrix(PATH+"input5.txt",5);

        y2.addTestMatrix(PATH+"input2.txt",2);
        y2.addTestMatrix(PATH+"input3.txt",3);
        y2.addTestMatrix(PATH+"input4.txt",4);
        y2.addTestMatrix(PATH+"input5.txt",5);

        Main.checkResult(y1,y2);


    }

    public static void checkResult(Perceptron y1, Perceptron y2)
    {
        int r1,r2;
        int right=0,wrong=0;
        for(int i=0; i<y2.matrixDatabaseTest.size();i++)
        {
            r2 = y2.testInDatabaseTest(i,1);
            r1 = y1.testInDatabaseTest(i,1);

            if((r2 == 0 && r1 ==1) && y2.matrixDatabaseTest.get(i).matrixExpectedValue == r2 && y1.matrixDatabaseTest.get(i).matrixExpectedValue ==r1)
            {
                System.out.println("Got right matrix:\n" + y1.matrixDatabaseTest.get(i).matrixString + "\nfor result " + r1 +" and "+r2+
                        "\nShould be "+ y1.matrixDatabaseTest.get(i).matrixExpectedValue +" and "+y2.matrixDatabaseTest.get(i).matrixExpectedValue +" \n\n");
                right++;
            }
            else if((r2 == 1 && r1 == 0) && y2.matrixDatabaseTest.get(i).matrixExpectedValue == r2 && y1.matrixDatabaseTest.get(i).matrixExpectedValue ==r1)
            {
                System.out.println("Got right matrix:\n" + y1.matrixDatabaseTest.get(i).matrixString + "\nfor result " + r1 +" and "+r2+
                        "\nShould be "+ y1.matrixDatabaseTest.get(i).matrixExpectedValue +" and "+y2.matrixDatabaseTest.get(i).matrixExpectedValue +" \n\n");
                right++;
            }
            else
            {
                if((r1 ==0 && r2 ==1) || (r1==1 && r2==0))
                {
                    System.out.println("Got wrong matrix:\n" + y1.matrixDatabaseTest.get(i).matrixString + "\nfor result " + r1 +" and "+r2+
                            "\nShould be "+ y1.matrixDatabaseTest.get(i).matrixExpectedValue +" and "+y2.matrixDatabaseTest.get(i).matrixExpectedValue +" \n\n");
                    wrong++;
                }
                else
                {
                    System.out.println("Got wrong matrix:\n" + y1.matrixDatabaseTest.get(i).matrixString + "\nfor result " + r1 +" and "+r2+
                            "\nShould be "+ y1.matrixDatabaseTest.get(i).matrixExpectedValue +" and "+y2.matrixDatabaseTest.get(i).matrixExpectedValue +" \n\n");
                    System.out.println("I DON'T KNOW WHAT IS THIS!!");
                    wrong++;
                }

            }


        }

        double accurracy = (double)right /(double)y2.matrixDatabaseTest.size() * 100;
        System.out.println("Accuracy = "+accurracy);
    }

    public static void checkResult(ArrayList<Perceptron> perceptrons)
    {

        Scanner s = new Scanner(System.in);
        /*
        for(Perceptron p: perceptrons)
        {
            for(int i=0;i<p.matrixDatabase.size();i++)
            {
                System.out.println("Matrix nº"+i);
                System.out.print(p.matrixDatabase.get(i).getMatrixString());
                if(i%5==0) System.out.println("");
            }
            //s.nextLine();
        }

    */


        Integer i=0,correct=0;
        boolean gotCorrect = false;
        ArrayList<String> possibleResults=new ArrayList<String>();
        possibleResults.add("100000");
        possibleResults.add("010000");
        possibleResults.add("001000");
        possibleResults.add("000100");
        possibleResults.add("000010");
        possibleResults.add("000001");

        int number;
        String result = "",expectedResult;



        while(i < perceptrons.get(0).matrixDatabaseTest.size())
        {
            System.out.println("");
            result ="";
            expectedResult="";
            gotCorrect = false;
            for (Perceptron p : perceptrons)
            {

                number = p.testInDatabaseTest(i, 1);

                if(number ==0) result+="0";
                else result +="1";

                if(p.matrixDatabaseTest.get(i).matrixExpectedValue ==0) expectedResult+="0";
                else expectedResult+="1";

            }

            for(String ps :possibleResults)
            {
                //System.out.println("String: "+ps+"\nResult: "+result);
                if(ps.equals(result) && expectedResult.equals(result))
                {
                    System.out.print("Got correct for matrix\n"+perceptrons.get(0).matrixDatabaseTest.get(i).getMatrixString());
                    correct++;
                    gotCorrect = true;
                    break;
                }
            }
            if(!gotCorrect)
            {
                System.out.print("Got wrong for matrix\n"+perceptrons.get(0).matrixDatabaseTest.get(i).getMatrixString());
            }
            System.out.println("Result "+result);
            System.out.println("Should be "+expectedResult);
            i++;
        }

        double accurracy = correct/60.0 *100.0;
        System.out.println("Accuracy: "+accurracy);
    }

    public static void Exercise3()
    {
        int i1=0,i2=0,i3=0,i4=0,i5=0,i6=0;
        int value;
        String PATH = "/home/gmarson/GIT/Artificial-Inteligence/NeuralNetworks/Perceptron/Inputs/";
        ArrayList<Perceptron> perceptrons = new ArrayList<Perceptron>();
        for(int i=0;i<6;i++)
        {
            perceptrons.add(new Perceptron("Sorted"));
            for(Integer k=0;k<6;k++)
            {
                if(k == i) value = 1;
                else value = 0;
                perceptrons.get(i).addMatrix(PATH + "input"+k.toString()+".txt", value);
            }

            perceptrons.get(i).trainingProcess();
            perceptrons.get(i).neuron.printTileWeight();
            // um neuronio tem todas as 60 matrizes de teste

            for(Integer k=0;k<6;k++)
            {
                if(k == i) value = 1;
                else value = 0;
                for (Integer j = 1; j <= 10; j++)
                {
                    perceptrons.get(i).addTestMatrix(PATH + "Distorted"+k.toString()+"/input"+k.toString()+""+  j.toString() + ".txt", value);

                }

            }
        }

        Main.checkResult(perceptrons);

        for(Perceptron p:perceptrons)
        {
            p.matrixDatabaseTest.clear();

        }

        for(int i=0;i<6;i++)
        {
            perceptrons.get(i).addTestMatrix(PATH + "/Letters/C.txt", 0); // letter have no answer
            perceptrons.get(i).addTestMatrix(PATH + "/Letters/E.txt", 0);
            perceptrons.get(i).addTestMatrix(PATH + "/Letters/H.txt", 0);
            perceptrons.get(i).addTestMatrix(PATH + "/Letters/N.txt", 0);
            perceptrons.get(i).addTestMatrix(PATH + "/Letters/T.txt", 0);
        }
        Main.checkResult(perceptrons);


    }


}