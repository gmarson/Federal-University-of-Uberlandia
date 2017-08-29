def micro03():
	numero =0
	print("Digite um numero: ",end="")
	numero = int(input())
	if numero>= 100:
		if numero<= 200:
			print("O numero esta no intervalo entre 100 e 200")
		else:
			print("O numero nao esta no intervalo entre 100 e 200")
	else:
		print("O numero nao esta no intervalo entre 100 e 200")

micro03()