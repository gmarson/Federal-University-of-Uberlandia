def micro10():
	numero =0
	fat = 0
	print("Digite um numero: ",end="")
	numero = int(input())
	fat = fatorial(numero)

	print("O fatorial de "+str(numero)+" e "+str(fat),end="")



def fatorial(n):
	if n <=0:
		return 1
	else:
		return (n * fatorial(n-1))

micro10()