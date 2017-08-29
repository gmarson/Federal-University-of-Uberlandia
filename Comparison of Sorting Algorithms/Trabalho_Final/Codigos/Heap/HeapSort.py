#@profile
def trocaElementos(A,x,y):
    aux = A[y]
    A[y] = A[x]
    A[x] = aux

#@profile
def maxHeapify(A,n,i):
    esquerda = 2*i + 1 #Pq o indice começa de 0
    direita = 2*i +2 #Pq o indice começa de 0

    if esquerda < n and A[esquerda] > A[i]:
        maior = esquerda
    else:
        maior = i
    if direita < n and A[direita] > A[maior]:
        maior = direita
    if maior!=i:
        trocaElementos(A,i,maior)
        maxHeapify(A,n,maior)

#@profile
def constroiMaxHeap(A,n):
    for i in range(n // 2, -1, -1):
        maxHeapify(A,n,i)


@profile
def heapSort(A):
    n = len(A)
    constroiMaxHeap(A,n)
    m = n
    for i in range((n-1), 0, -1):
        trocaElementos(A,0,i)
        m = m - 1
        maxHeapify(A,m,0)

#lista = [13,46,17,34,41,15,14,23,30,21,10,12,21]
#heapSort(lista, 13)
#print(lista)


#heapSort([i for i in range(524288)])
