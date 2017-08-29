import java.util.Scanner;

public class micro04
{
	public static void main(String[] args)
	{
		Scanner s = new Scanner(System.in);
		int x=0,num=0,intervalo =0;

		for (x=0;x<5;x++){
			System.out.print("Digite o numero: ");
			num = s.nextInt();
			if( num >=10)
				if (num <=150)
					intervalo = intervalo +1;
		}
		
		System.out.println("Ao total, foram digitados "+intervalo+" numeros no intervalo entre 10 e 150");
	}
}