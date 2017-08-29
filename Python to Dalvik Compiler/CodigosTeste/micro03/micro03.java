import java.util.Scanner;

public class micro03
{
	public static void main(String[] args)
	{
		Scanner s = new Scanner(System.in);
		int numero;
		System.out.print("Digite um numero: ");
		numero = s.nextInt();

		if(numero >= 100)
		{
			if(numero <=200)
				System.out.println("O numero esta no intervalo entre 100 e 200");
			else
				System.out.println("O numero nao esta no intervalo entre 100 e 200");
		}
		else
			System.out.println("O numero nao esta no intervalo entre 100 e 200");
	}
}