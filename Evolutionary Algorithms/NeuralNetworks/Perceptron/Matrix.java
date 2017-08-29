import java.io.File;
import java.io.FileReader;
import java.io.IOException;
import java.util.Scanner;

/**
 * Created by gmarson on 08/05/16.
 */
public class Matrix
{
    public int matrixRow = 6;
    public int matrixCol = 5;

    public double matrixExpectedValue; /// eu to treinando pra ver qual numero. esse numero vai no wright response . Esse numero corresponde ao numero que a rede deve acertar na matriz
    public double matrixCurrentValue;
    public String matrixString;
    public int matrixVector[] = new int[matrixRow * matrixCol + 1];
    public char matrixChar[][] = new char[matrixRow][matrixCol];

    public Matrix(String filename,int value) {
        this.matrixExpectedValue = value;
        /// leio do arquivo e passo para a matriz
        try {
            this.matrixString = readMapFromFile(filename);
            Scanner s = new Scanner(this.matrixString);
            int i = 0, k = 0;
            while (s.hasNextLine()) {
                String line = s.nextLine();
                line = line.replaceAll("\\s+", "");
                //System.out.println(line);
                for (int j = 0; j < line.length(); j++) {

                    char tmp = line.charAt(j);
                    this.matrixChar[i][j] = tmp;
                    this.matrixVector[k + 1] = Character.getNumericValue(tmp);
                    k++;
                }
                i++;
            }
            Neuron n = new Neuron();
            this.matrixVector[0] = (int) n.bias; //bias
            n = null;
        } catch (IOException e) {
            System.out.println(e);
        }

    }
    private String readMapFromFile(String filename) throws IOException
    {
        String content = null;
        File file = new File(filename); //for ex foo.txt
        FileReader reader = null;

        try
        {
            reader = new FileReader(file);
            char[] chars = new char[(int) file.length()];
            reader.read(chars);
            content = new String(chars);
            reader.close();
        }

        catch (IOException e)
        {
            e.printStackTrace();
        }

        finally
        {
            if(reader !=null) {reader.close();}
        }

        return content;
    }

    public String getMatrixString()
    {
        return this.matrixString;
    }

    public void printMatrixChar()
    {
        for(int i=0;i<this.matrixRow;i++)
        {
            for(int j=0; j<this.matrixCol; j++)
            {
                System.out.print(matrixChar[i][j]);
            }
            System.out.println();
        }
    }

    public void printMatrixVector()
    {
        for(int i=0;i<this.matrixVector.length;i++)
        {
            System.out.println(matrixVector[i]);
        }
    }

    public char getValue(int x, int y)
    {
        //System.out.print(matrixChar[x][y]);
        return this.matrixChar[x][y];
    }


}