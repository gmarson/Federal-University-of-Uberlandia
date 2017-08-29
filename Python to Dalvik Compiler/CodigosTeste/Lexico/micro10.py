def micro10(): -> void :
	numero =0
	fat = 0
	print("Digite um numero: ")
	numero = int(input())
	fat = fatorial(numero)

	print("O fatorial de "+str(numero)+" e "+str(fat))



def fatorial(n:int): -> int :
	if n <=0:
		return 1
	else:
		return (n * fatorial(n-1))

micro10()
