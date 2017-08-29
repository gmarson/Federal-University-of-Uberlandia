def main() -> None:
	numero =1
	while numero < 0 or numero >0:
		print("\n Digite um numero: ")
		inputi(numero)
		if numero > 10:
			print("\n Numero maior que 10")
		else:
			print("\n Numero menor que 10")


main()