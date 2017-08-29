import java.util.Scanner;

public class micro09
{
	public static void main(String[] args)
	{
		Scanner s = new Scanner(System.in);
		double preco, venda, novopreco=0 ;

		System.out.print("Digite o preco: ");
		preco = s.nextDouble();
		System.out.print("Digite a venda: ");
		venda = s.nextDouble();

		if (venda < 500.0 || preco <30.0){
			novopreco = preco + 10.0/100.0 *preco;
		}
		else if ((venda >= 500.0 && venda <1200.0) || (preco >= 30.0 && preco <80.0)){
			novopreco = preco + 15.0/100.0 * preco;
		}
		else if (venda >=1200.0 || preco >=80.0){
			novopreco = preco - 20.0/100.0 * preco;
		}


		System.out.println("O novo preco e: "+novopreco);
	}
}