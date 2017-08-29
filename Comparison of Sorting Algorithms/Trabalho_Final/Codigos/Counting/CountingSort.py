@profile
def countingSort(A):
	A = [ int(x) for x in A ]
	k = max(A)
	contador = [0] * (k+1) #Contador é o histograma
	B = [0] * len(A)
	n = len(A)
	for i in range(0, n):
	    contador[A[i]] = contador[A[i]] + 1

	for i in range(1, len(contador)):
	    contador[i] = contador[i] + contador[i-1]

	for j in range((n-1), -1, -1):
	    B[contador[A[j]]-1] = A[j]
	    contador[A[j]] = contador[A[j]]-1

	return B

	#lista = [2,5,3,0,2,3,0,3]
	#print (countingSort(lista,5))
