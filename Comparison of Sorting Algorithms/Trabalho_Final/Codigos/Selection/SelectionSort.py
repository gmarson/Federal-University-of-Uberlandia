import sys

#sys.path.append('/home/gmarson/Git/AnaliseDeAlgoritmos/Trabalho_Final')

#from memoria import *

@profile
def selectionSort(A):
	for i in range(0,(len(A)-1)):
		minimo = i
		for j in range(i+1, len(A)):
			if A[j] < A[minimo]:
				minimo = j
		aux = A[i]
		A[i] = A[minimo]
		A[minimo] = aux


#A = [40, 12, 34, 1, 3, 5, 80]
#selectionSort(A)
#print(A)
