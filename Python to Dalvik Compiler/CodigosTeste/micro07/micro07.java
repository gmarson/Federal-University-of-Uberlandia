import java.util.Scanner;

public class micro07
{
	public static void main(String[] args)
	{
		Scanner s = new Scanner(System.in);
		int numero=0, programa=1;
		char opc;
		while( programa ==1){
			System.out.print("Digite um número: ");
			numero = s.nextInt();

			if (numero>0)
				System.out.println("Positivo");
			else
			{
				if (numero==0)
					System.out.println("O numero e igual a 0");
				if (numero <0)
					System.out.println("Negativo");
			}
			System.out.print("Deseja Finalizar? (S/N) ");
			opc = s.next().charAt(0);
			if (opc == 'S')
				programa = 0;
		}
	}
}