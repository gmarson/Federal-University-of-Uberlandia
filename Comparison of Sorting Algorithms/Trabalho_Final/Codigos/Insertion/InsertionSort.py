
@profile
def insertionSort(lista):
	for j in range(1,len(lista)):
		chave = lista[j]
		i = j
		while (i>0 and lista[i-1]>chave):
			lista[i] = lista[i-1]
			i = i-1
		lista[i] = chave

#lista = [60,20,30,12,1,2,3,39,45,10]
#insertionSort(lista)
#print(lista)
