import java.util.Scanner;

public class micro02
{
	public static void main(String[] args)
	{
		Scanner s = new Scanner(System.in);
		int num1 , num2 ;
		System.out.print("Digite o primeiro numero: ");
		num1 = s.nextInt();
		System.out.print("Digite o segundo numero: ");
		num2 = s.nextInt();
		if(num1 >num2)
			System.out.print("O primeiro numero "+num1+" e maior que o segundo "+num2);
		else
			System.out.print("O segundo numero "+num2+" e maior que o primeiro "+num1);
		
	}
}