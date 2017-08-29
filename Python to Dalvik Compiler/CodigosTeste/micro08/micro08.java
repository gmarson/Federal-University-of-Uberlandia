import java.util.Scanner;

public class micro08
{
	public static void main(String[] args)
	{
		Scanner s = new Scanner(System.in);
		int numero =1;
		while (numero < 0 || numero >0){
			System.out.print("Digite o numero");
			numero = s.nextInt();
			if (numero > 10)
				System.out.println("O numero "+numero+" e maior que 10");
			else
				System.out.println("O numero "+numero+" e menor que 10");
		}
	}
}