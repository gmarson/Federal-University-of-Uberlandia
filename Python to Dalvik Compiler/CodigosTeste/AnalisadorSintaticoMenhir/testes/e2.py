def main() -> None: 
	print("Digite um numero:  ")
	inputi(numero)
	if numero>= 100:
		if numero<= 200:
			print("\n numero entre 100 e 200")
		else:
			print("\nnumero maior que 200")
	else:
		print("\nnumero menor que 100")

	return
main()