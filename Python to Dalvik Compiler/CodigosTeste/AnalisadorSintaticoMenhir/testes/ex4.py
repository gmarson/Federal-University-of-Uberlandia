def fib(n:int) -> int:
    if n <= 1:
        return 1
    else:
        return fib( n - 1 ) + fib( n - 2 )

def fat(n:int) -> int:
    if n <= 1:
        return 1
    else:
        return n * fat( n - 1)


def main() -> None:
    op = 1
    while op != 0:
        print("| 1 - fib\n| 2 - fat\n| 0 - sair\n-> ")
        inputi(op)
        if op == 1:
            print("Digite um numero para calcular o fibonacci: ")
            inputi(f)
            print(" fibonacci :")
            print(fib(f))
        elif op == 2:
            print("Digite um numero para calcular o fatorial: ")
            inputi(f)
            print(" fatorial :")
            print(fat(f))
        else:
            op =0
        print("\n")