
@profile
def radix(A):
    A = [ int(x) for x in A ]
    n = len(A)
    maior = max(A)
    d = _contaDigitos(maior)
    radixSort(A, n, d)

#@profile
def radixSort(A, n, d):
    exp = 1
    maior = max(A)
    while exp < maior:
        _countingSort(A, exp)
        exp *= 10


#@profile# função countingsort adaptada
def _countingSort(A, k):
    contador = [0] * 10  # Contador é o histograma
    B = [0] * len(A)
    n = len(A)
    for i in range(0, n):
        contador[(A[i] // k) % 10] += 1

    for i in range(1, len(contador)):
        contador[i] += contador[i - 1]

    for j in range((n - 1), -1, -1):
        B[contador[(A[j] // k) % 10] - 1] = A[j]
        contador[(A[j] // k) % 10] -= 1

    for i in range(0, n):
        A[i] = B[i]

#@profile
def _contaDigitos(valor):
    digitos = 0
    while (valor != 0):
        digitos += 1
        valor //= 10
    return digitos








#lista = [170, 45, 75, 90, 802, 24, 2, 66]
#radix(lista)
#print(lista)
