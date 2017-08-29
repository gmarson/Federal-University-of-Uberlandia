import java.util.Scanner;

public class micro06
{
	public static void main(String[] args)
	{
		Scanner s = new Scanner(System.in);
		int numero=0;
		System.out.print("Digite um numero de 1 a 5: ");
		numero = s.nextInt();
		switch(numero)
		{
			case 1:
				System.out.println("Um");
				break;
			case 2:
				System.out.println("Dois");
				break;
			case 3:
				System.out.println("Tres");
				break;
			case 4:
				System.out.println("Quatro");
				break;
			case 5:
				System.out.println("Cinco");
				break;
			default:
				System.out.println("Numero Invalido");
		}
		
	}
}