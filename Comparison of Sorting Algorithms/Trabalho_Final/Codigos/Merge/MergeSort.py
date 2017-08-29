import math
import sys
import gc

#sys.path.append('/home/gmarson/Git/AnaliseDeAlgoritmos/Trabalho_Final')
#from memoria import *

#@profile
def intercala(A,p,q,r):
	#print("antes: ",  memory_usage_resource())
	B = [0] *len(A)
	for i in range(p,(q+1)):
		B[i] = A[i]
	for j in range(q+1,(r+1)):
		B[r+q+1-j] = A[j]

	i = p
	j = r
	#print("depois", memory_usage_resource())

	for k in range (p,(r+1)):
		if(B[i] <= B[j]):
			A[k] = B[i]
			i = i+1
		else:
			A[k] = B[j]
			j = j-1

@profile
def merge(A):
	mergeSort(A,0,len(A)-1)

	#return A


#@profile
def mergeSort(A,esquerda,direita):
	if(esquerda<direita):
		meio = math.floor((esquerda+direita)/2)
		mergeSort(A,esquerda,meio)
		mergeSort(A,meio+1,direita)
		intercala(A,esquerda,meio,direita)



#if __name__ == '__main__':
#	gc.disable()
#	A = [i for i in range(10000)]
#	merge(A)
#	print(merge(A))
#	gc.enable()

#A = [i for i in range(10000)]
#merge(A)
#Para criar uma lista preenchida com 0's e que possua tamanho de A basta
#print(merge(A))
