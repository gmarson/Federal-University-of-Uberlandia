import java.util.Scanner;

public class micro10
{
	public static void main(String[] args)
	{
		Scanner s = new Scanner(System.in);
		int numero=0, fat;
		System.out.print("Digite um numero: ");
		numero = s.nextInt();
		fat = fatorial(numero);
		System.out.println("O fatorial de "+numero+" e "+fat);


	}

	public static int fatorial(int n){
		if(n <= 0) return 1;
		else return n* fatorial(n-1);
	}


}