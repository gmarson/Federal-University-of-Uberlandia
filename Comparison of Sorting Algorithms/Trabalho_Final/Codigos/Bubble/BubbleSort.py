import numpy as np

@profile
def bubble_sort(a):
    """ Implementação do método da bolha """
    for i in range(len(a)):
        for j in range(len(a)-1-i):
            if a[j] > a[j+1]:
                t = a[j]
                a[j] = a[j+1]
                a[j+1] = t

#    print(a)  O PRINT BUGA O TESTDRIVER
