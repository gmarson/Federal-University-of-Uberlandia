def micro08():
	numero =1
	while numero < 0 or numero >0:
		print("Digite o numero",end="")
		numero = int(input())
		if numero > 10:
			print("O numero "+str(numero)+" e maior que 10")
		else:
			print("O numero "+str(numero)+" e menor que 10")


micro08()