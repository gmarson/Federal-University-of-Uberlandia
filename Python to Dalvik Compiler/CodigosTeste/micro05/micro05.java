import java.util.Scanner;

public class micro05
{
	public static void main(String[] args)
	{
		Scanner s = new Scanner(System.in);
		int x=0,h=0,m =0;
		String nome, sexo;

		for (x=0;x<5;x++){
			System.out.print("Digite o nome: ");
			nome = s.nextLine();
			System.out.print("H - Homem ou M - Mulher");
			sexo = s.nextLine();
			
			switch(sexo){
				case "H":
					h = h +1;
					break;
				case "M":
					m = m +1;
					break;
				default:
					System.out.println("Sexo so pode ser H ou M!");
			}	
		}
		
		System.out.println("Foram inseridos "+h+" Homens");
		System.out.println("Foram inseridas "+m+" Mulheres");
	}
}