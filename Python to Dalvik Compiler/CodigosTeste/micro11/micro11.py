def micro11():
	numero,x =0,0
	print("Digite um numero: ",end="")
	numero = int(input())
	x = verifica(numero)
	if x ==1:
		print("Numero Positivo")
	elif x ==0:
		print("Zero")
	else:
		print("Negativo")

def verifica(n):
	res = 0
	if n>0:
		res = 1
	elif n<0:
		res = -1
	else:
		res = 0

	return res
	
micro11()