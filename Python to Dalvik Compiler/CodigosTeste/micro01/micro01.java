import java.util.Scanner;

public class micro01
{
	public static void main(String[] args)
	{
		Scanner s = new Scanner(System.in);
		float cel , far ;
		System.out.println("		Tabela de conversao: Celsius -> Fahrenheit");
		System.out.print("Digite a temperatura em Celsius: ");
		cel = s.nextFloat();
		far = (9*cel+160)/5;
		System.out.println("A nova temperatura é:"+far+"F");
	}
}