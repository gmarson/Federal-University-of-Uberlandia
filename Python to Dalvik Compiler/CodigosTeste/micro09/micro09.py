def micro09():
	preco, venda, novopreco = 0.0,0.0,0.0

	print("Digite o preco: ",end="")
	preco = int(input())
	print("Digite a venda: ",end="")
	venda = int(input())
	if venda < 500 or preco <30:
		novopreco = preco + 10/100 *preco
	elif (venda >= 500 and venda <1200) or (preco >= 30 and preco <80):
		novopreco = preco + 15/100 * preco
	elif venda >=1200 or preco >=80:
		novopreco = preco - 20/100 * preco


	print("O novo preco e: "+str(novopreco))

micro09()