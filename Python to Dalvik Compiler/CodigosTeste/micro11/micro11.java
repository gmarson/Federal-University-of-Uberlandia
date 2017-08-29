import java.util.Scanner;

public class micro11
{
	public static void main(String[] args)
	{
		Scanner s = new Scanner(System.in);
		int numero=0, x;
		System.out.print("Digite um numero: ");
		numero = s.nextInt();
		x = verifica(numero);
		if(x ==1) System.out.println("Numero Positivo");
		else if (x==0) System.out.println("Zero");
		else System.out.println("Numero Negativo");

	}

	public static int verifica(int n){
		int res;
		if(n>0) res =1;
		else if(n<0) res = -1;
		else res = 0;


		return res;
	}


}