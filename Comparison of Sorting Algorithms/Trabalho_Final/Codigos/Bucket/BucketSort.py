
@profile
def bucket_sort(floats):
    buckets = [ [] for _ in range(len(floats)) ]
    for num in floats:
        i = int(len(floats) * num)
        #print(buckets)
        buckets[i].append(num)

    result = []
    for bucket in buckets:
        _insertion_sort(bucket)# INSERTION_SORT(bucket)
        result += bucket
    return result


# colocamos a mesma versão do Insertion Sort, que já havíamos feito, aqui apenas
# para facilitar a análise de complexidade do Bucket Sort

def _insertion_sort(lista):
	for j in range(1,len(lista)):
		chave = lista[j]
		i = j
		while (i>0 and lista[i-1]>chave):
			lista[i] = lista[i-1]
			i = i-1
		lista[i] = chave


#print(bucket_sort([0.112, 0.3, 0.008, 0.07, 0.9, 0.8, 0.43, 0.29]))
