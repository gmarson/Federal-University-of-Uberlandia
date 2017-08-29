def main() -> None:
	numero =0
	fat = 0
	print("Digite um numero: ")
	inputi(numero)
	fat = fatorial(numero)

	print("O fatorial eh ")
	print(fat)

def fatorial(n: int) -> int:
	if n <= 0:
		return 1
	else:
		return n * fatorial(n - 1)

main()