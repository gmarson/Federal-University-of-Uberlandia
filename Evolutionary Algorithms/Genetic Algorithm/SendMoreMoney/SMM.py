#!/usr/bin/env python
# -*- coding: utf-8 -*-
from math import ceil
from random import *
import time
import sys
#Roleta


sys.setrecursionlimit(1500)
SIZE_SEND = 4
Tp = 100
Tcross = int(Tp * 0.8)
Tmut = int(Tp *0.1)
filhos_gerados = Tcross
tour = 3
Nger = 50
Nexec = 100
Telit = int(Tp * 0.2) #20% de Tp
#MONEY = 10652
# [          None               ,               []                         ,        None      ,         None]
#      aptidao de cada ind          valores de send e more                    valor do money   ,      Probabilidade de sorteio na roleta
#seed(0)



class sendMore:
    def __init__(self,Tpop=None):
        if Tpop == None:
            self.individuos = [ [None,[],None,None] for i in range(Tp) ]
        else:
            self.individuos = [ [None,[],None,None] for i in range(Tpop) ]

    def imprime(self,f):
        #print("Nota          -      individuo      -     Money")
        for i in range(len(self.individuos)):
            print(" " + str(self.individuos[i]))
            #f.write("" + str(self.individuos[i])+"\n")

    def populate(self):
        lista = [0,1,2,3,4,5,6,7,8,9]
        for tupla in self.individuos:
            tupla[1] = sample(lista,len(lista))


    def aptidao(self,f,filhos=None):
        if filhos != None:
            for i in range(Tcross):
                self.individuos.append([None,filhos[i],None,None])


        for tupla in self.individuos:
            tupla[2] = (int(str(tupla[1][4]) + str(tupla[1][5]) + str(tupla[1][2]) + str(tupla[1][1]) + str(tupla[1][7]) ) )
            send = int(''.join(str(num) for num in tupla[1][:4]))
            more = ''.join(str(num) for num in tupla[1][4:7])
            more = more + str(tupla[1][1])
            more = int(more)
            send = int(send)
            tupla[0] = 100000 - abs( (send+more) - tupla[2])
            #print("Send: "+str(send)+"\nMore: "+str(more)+"\n"+"MONEY: "+str(tupla[2]) +"\nNota:"+str(tupla[0])+"\n" )


        if Tp != len(self.individuos):
            #print("entrou")
            self.quickSort(0,len(self.individuos)-1)
            indi_aux = self.individuos
            self.individuos = [[None, [] , None, None] for i in range(Tp)]

            for i in range(Tp):
                self.individuos[len(self.individuos) -1 - i] = indi_aux[len(indi_aux) - 1 - i]

    def aptidao_elitismo(self,f,filhos=None):
        if filhos != None:
            temp = sendMore(Tcross)

            for i in range(Tcross):
                temp.individuos[i] = [None,filhos[i],None,None]

            for tupla in temp.individuos:
                tupla[2] = (int(str(tupla[1][4]) + str(tupla[1][5]) + str(tupla[1][2]) + str(tupla[1][1]) + str(tupla[1][7]) ) )
                send = int(''.join(str(num) for num in tupla[1][:4]))
                more = ''.join(str(num) for num in tupla[1][4:7])
                more = more + str(tupla[1][1])
                more = int(more)
                send = int(send)
                tupla[0] = 100000 - abs( (send+more) - tupla[2])
            temp.quickSort(0,len(temp.individuos) -1)

        if filhos == None:
            for tupla in self.individuos:
                tupla[2] = (int(str(tupla[1][4]) + str(tupla[1][5]) + str(tupla[1][2]) + str(tupla[1][1]) + str(tupla[1][7]) ) )
                send = int(''.join(str(num) for num in tupla[1][:4]))
                more = ''.join(str(num) for num in tupla[1][4:7])
                more = more + str(tupla[1][1])
                more = int(more)
                send = int(send)
                tupla[0] = 100000 - abs( (send+more) - tupla[2])
                #print("Send: "+str(send)+"\nMore: "+str(more)+"\n"+"MONEY: "+str(tupla[2]) +"\nNota:"+str(tupla[0])+"\n" )
            self.quickSort(0,len(self.individuos)-1)

        if filhos != None:
            #print("PAIS")
            #self.imprime(f)
            indi_aux = self.individuos
            self.individuos = [[None, [] , None, None] for i in range(Tp)]
            #print("FILHOS")
            #temp.imprime(f)
            for i in range(Tcross):
                #print("\n\nColocando os filhos")
                self.individuos[(Tp -1) - i ] = temp.individuos[len(temp.individuos)-1 -i]
                #self.imprime(f)
                #input()
            i = 0
            while True:
                #print("\n\nColocando os pais")
                if self.individuos[i][0] == None:
                    self.individuos[i] = indi_aux[(Tp-1) -i]
                    i +=1
                else:
                    break
                #self.imprime(f)
                #input()

    def custom_fitness(self,f,filhos=None):
        if filhos != None:
            for i in range(Tcross):
                self.individuos.append([None,filhos[i],None,None])

        for tupla in self.individuos:
            tupla[2] = (str(tupla[1][4]) + str(tupla[1][5]) + str(tupla[1][2]) + str(tupla[1][1]) + str(tupla[1][7]) )
            send = int(''.join(str(num) for num in tupla[1][:4]))
            more = ''.join(str(num) for num in tupla[1][4:7])
            more = more + str(tupla[1][1])
            more = int(more)
            send = int(send)
            nota = []
            candidato = str(send + more)
            while len(candidato) < len(tupla[2]):
                candidato = '0' + candidato
            #print("candidato: "+str(candidato))
            for i in range(len(candidato)):
                nota.append(abs(int(tupla[2][i]) - int(candidato[i])))

            #print("Send: "+str(send)+"\nMore: "+str(more)+"\n"+"MONEY: "+str(tupla[2]) +"\nNota:"+str(tupla[0])+"\n" )
            #print(str(nota))
            tupla[0] = 0
            peso =0
            tupla[2] = int(tupla[2])
            for digit in nota:
                tupla[0] += digit
                if digit !=0:
                    peso+=1

            tupla[0] = 100000000 - abs((send+more)-tupla[2]) * peso *tupla[0]
            #print(str(tupla))
            #input()

        #self.imprime(f)
        #input()
        if Tp != len(self.individuos):
            #print("entrou")
            self.quickSort(0,len(self.individuos)-1)
            indi_aux = self.individuos
            self.individuos = [[None, [] , None, None] for i in range(Tp)]

            for i in range(Tp):
                self.individuos[len(self.individuos) -1 - i] = indi_aux[len(indi_aux) - 1 - i]

    def Particiona(self,p,r):
        #print(self.individuos[r][0])
        x = self.individuos[r][0] #pivo é o último elemento
        i = p-1
        for j in range(p,r):
            if self.individuos[j][0] <= x:
                i = i + 1
                aux = self.individuos[i]
                self.individuos[i] = self.individuos[j]
                self.individuos[j] = aux
        temp = self.individuos[i+1]
        self.individuos[i+1] = self.individuos[r]
        self.individuos[r] = temp
        return i+1

    def quickSort(self,p,r):
        #self.imprime()
        #input()
        if(p < r):
        	q = self.Particiona(p,r)
        	self.quickSort(p,(q-1))
        	self.quickSort((q+1),r)

    def bestSolution(self,f):
        ideal = -99999
        for tupla in self.individuos:
            if tupla[0] > ideal:
                ideal = tupla[0]
                save_tupla = tupla

        #print("\n"+str(save_tupla))
        send = int(''.join(str(num) for num in save_tupla[1][:4]))
        more = ''.join(str(num) for num in save_tupla[1][4:7])
        more = int(more + str(save_tupla[1][1]))


        #print("A melhor solucao tem nota "+str( save_tupla[0] ) + "\nSEND: "+str(send)+"\nMORE: "+str(more)+"\nPara um money = "+str(save_tupla[2]) )
        #f.write("\nA melhor solução tem nota "+str( save_tupla[0] ) + "\nSEND: "+str(send)+"\nMORE: "+str(more)+"\nPara um money = "+str(save_tupla[2]) )
        #f.write("\n\n-------------------------------------------\n\n")
        if save_tupla[0] == 100000:
            #print(str(save_tupla))

            print("A melhor solucao tem nota "+str( save_tupla[0] ) + "\nSEND: "+str(send)+"\nMORE: "+str(more)+"\nPara um money = "+str(save_tupla[2]) )
            #input()
            return True

    def roleta(self,f):
        #print("chegou na roleta")
        #self.imprime(f)
        anterior = 0
        listS1, listS2 = [] , []
        #print(self.individuos[0][3])
        for i in range(len(self.individuos)):
            #print(self.individuos[i][3])
            self.individuos[i][3] = self.individuos[i][0] +anterior
            anterior = self.individuos[i][3]
        #f.write("\n\n----ROLETA----\n")
        #self.imprime(f)
        #print("depois de atribuir a nota")
        #self.imprime(f)
        for k in range(0,Tcross,2):
            x = randint(0,anterior)
            y = randint(0,anterior)

            for i in range(len(self.individuos)):
                if self.individuos[i][3] >= x:
                    listS1.append(i)
                    break
            for i in range(len(self.individuos)):
                if self.individuos[i][3] >= y:
                    listS2.append(i)
                    break

        return [listS1,listS2]

    def torneio(self,f):
        #print("\n-----TORNEIO-----\nComeço")
        #self.imprime(f)
        listS1,listS2 = [] , []
        #numeros = []
        for i in range(0,Tcross,2):
            bestS1 , bestS2 = -99999 , -99999
            indexS1, indexS2 = None,None
            for j in range(tour):
                x = randint(0,(Tp-1))
                #numeros.append(x)

                #print("self.individuos[x][0] "+str(self.individuos[x][0])+"> bestS1 ?"+str(bestS1)+" -> "+str(self.individuos[x][0] > bestS1))
                #f.write("\nPai grupo 1 Sorteado:   "+str(self.individuos[x])+"  Posição "+str(x))

                if self.individuos[x][0] > bestS1:
                    indexS1 = x
                    bestS1 = self.individuos[x][0]
                y = randint(0,(Tp-1))
                #f.write("\nPai grupo 2 Sorteado:   "+str(self.individuos[y])+"  Posição "+str(y)+"\n")
                if self.individuos[y][0] > bestS2:
                    indexS2 = y
                    bestS2 = self.individuos[y][0]
                #numeros.append(y)
            #f.write("\nPai vencedor do sorteio 1: "+str(self.individuos[indexS1])+"  Posição "+str(indexS1))
            #f.write("\nPai vencedor do sorteio 2: "+str(self.individuos[indexS2])+"  Posição "+str(indexS2)+"\n")
            listS1.append(indexS1)
            listS2.append(indexS2)

        #numeros.sort()
        #print ("Numeros do sorteio  "+str(numeros))
        #self.grupos_pais(listS1,listS2,f)
        #print("lista1 : "+str(listS1))
        #print("lista2 : "+str(listS2))
        #print("Tamanho da lista dos pais "+str(len(listS1)))
        #print("Torneio fim")
        #self.imprime(f)
        return [listS1,listS2]


    def pmx(self,pais,f):
        filhos = []
        #print(str(pais[0]))

        for i in range(len(pais[0])):
            #print(str(i))
            comeco = randint(0,8)
            while True:
                if comeco == 8:
                    fim =9
                    break
                else:
                    fim = randint(comeco,9)
                    if (fim != comeco):
                        break

            i1 = pais[0][i]
            i2 = pais[1][i]
            filho1 = list(self.individuos[i1][1])
            filho2 = list(self.individuos[i2][1])
            #print("\n\n\nANTES\nFilho 1 : "+str(filho1)+"\nFilho 2 : "+str(filho2))
            #print("Comeco "+str(comeco)+"\nFIM "+str(fim))
            aux_filho1 = filho1[comeco:fim+1]
            aux_filho2 = filho2[comeco:fim+1]
            #print("AUX1: "+str(aux_filho1)+"\nAUX2: "+str(aux_filho2))

            filho1[comeco:fim+1] = aux_filho2
            filho2[comeco:fim+1] = aux_filho1



            #print("\n\n\nDURANTE\nFilho 1 : "+str(filho1)+"\nFilho 2 : "+str(filho2))

            seq_troca = []
            geladeira1,geladeira2 = [], []
            for index in range(len(aux_filho1)):
                if aux_filho1[index] not in aux_filho2 and aux_filho2[index] not in aux_filho1:
                    seq_troca.append( [ aux_filho1[index] , aux_filho2[index] ] )
                    #print(str(1))
                elif aux_filho1[index] not in aux_filho2 and aux_filho2[index] in aux_filho1:
                    if  geladeira2:
                        seq_troca.append([ aux_filho1[index] , geladeira2[0] ])
                        del(geladeira2[0])
                        #print(str(2.1))
                    else:
                        geladeira1.append(aux_filho1[index])
                        #print(str(2.2))

                elif aux_filho2[index] not in aux_filho1 and aux_filho1[index] in aux_filho2:
                    if  geladeira1:
                        seq_troca.append([ geladeira1[0], aux_filho2[index] ])
                        del(geladeira1[0])
                        #print(str(3.1))
                    else:
                        geladeira2.append(aux_filho2[index])
                        #print(str(3.2))
                else:
                    #print("4")
                    continue


            #print ("a sequencia ai pô:  "+str(seq_troca))

            k=0
            while k < len(seq_troca):
                pos1, pos2 = None , None
                for v in range(len(filho1)):

                    if filho1[v] == seq_troca[k][1] and (v < comeco or v > fim ):
                        pos1 = v
                        break
                    elif filho1[v] == seq_troca[k][0] and (v < comeco or v > fim ):
                        pos1 = v
                        break

                for v in range(len(filho2)):
                    if filho2[v] == seq_troca[k][0] and (v < comeco or v > fim ):
                        pos2 = v
                        break
                    elif filho2[v] == seq_troca[k][1] and (v < comeco or v > fim ):
                        pos2 = v
                        break

                aux = filho1[pos1]
                filho1[pos1] = filho2[pos2]
                filho2[pos2] = aux
                k+=1

            #print("\n\n\nDEPOIS\nFilho 1 : "+str(filho1)+"\nFilho 2 : "+str(filho2))

            filhos.append(filho1)
            filhos.append(filho2)
            #input()
        #for f in filhos:
        #    print (str(f))
        #input()
        return filhos

    def crossover_ciclico(self,pais,f):
        #f.write("\n\n-----CROSSOVER-----\n")
        filhos = []
        #print("CROSSOVER ")
        #self.imprime(f)

        #print("\nIndice dos pais que farao crossover")
        #print("\n"+str(pais[0])+"\n")
        #print(str(pais[1])+"\n")

        for i in range(len(pais[0])):
            i1 = pais[0][i]
            i2 = pais[1][i]
            filho1 = list(self.individuos[i1][1])
            filho2 = list(self.individuos[i2][1])
            #print("\n\n\nFilho 1 : "+str(filho1)+"\nSelf.indiviuod referente ao filho 1: "+str(self.individuos[i1][1]))
            list_pos =[]
            pos = randint(0,9) ## em que casa comeca o crossover
            #print("\nComeça em :"+str(pos))
            #print("\nPosição do sorteio = "+str(pos))
            #print("\nPai1 = "+str(filho1)+"\nPai2 = "+str(filho2))

            while True:
                if filho1[pos] in list_pos:
                    break
                else:
                    list_pos.append(filho1[pos])
                    aux = filho1[pos]
                    filho1[pos] = filho2[pos]
                    filho2[pos] = aux
                for j in range(10):
                    if filho1[j] == filho1[pos] and j != pos:
                        pos = j
                        break;
                    elif filho1[j] == filho1[pos] and j == pos:
                        pos =j;
            #print("\nFilho1= "+str(filho1)+"\nFilho2= "+str(filho2)+"\n")
            #print("depois do cross \nFilho 1 : "+str(filho1)+"\nSelf.indiviuod referente ao filho 1: "+str(self.individuos[i1][1]))

            filhos.append(filho1)
            filhos.append(filho2)

        return filhos # retorno o conjunto de filhos gerados

    def mutacao(self,filhos,f):
        mu =0
        #print("MUTAÇÃO")
        for i in range(Tmut):
            pos = randint(0,(Tcross-1))
            #print (str(i))
            #print("\nERA : "+str(filhos[i]))
            x = randint(0,9)
            y = randint(0,9)
            #print("Mutou")
            aux = filhos[pos][x]
            filhos[pos][x] = filhos[pos][y]
            filhos[pos][y] = aux
            mu = mu + 1
            #print("É   : "+str(filhos[i]))
        #print("Ocorreram "+str(mu)+" mutacoes")
        #f.write("\nOcorreram "+str(mu)+" mutacoes\n")
        #print("Depois da mutação")
        #self.imprime(f)

        return filhos #retorno o conjunto de filhos


def run(teste,f,metodo,aptidao,crossover):
    filhos = None
    for g in range(Nger):
        #f.write("\nGeração "+str(g+1)+"\n")
        if aptidao == "Normal":
            teste.aptidao(f,filhos)
        elif aptidao =="Custom":
            teste.custom_fitness(f,filhos)
        else:
            teste.aptidao_elitismo(f,filhos)
        if teste.bestSolution(f) == True:
            #f.write("\nSolução ótima encontrada na geração "+str(g+1)+"\n")
            #print("\nSolução ótima encontrada na geração "+str(g+1)+"\n")
            return int(1)
        if(metodo=="Roleta"):
            filhos = teste.roleta(f)
        else:
            filhos = teste.torneio(f)
        if(crossover == "PMX"):
            filhos = teste.pmx(filhos,f)
        else:
            filhos = teste.crossover_ciclico(filhos,f)
        filhos = teste.mutacao(filhos,f)
    return 0

def executa(metodo,aptidao,crossover):
    bs =0
    f.write("\n"+str(metodo)+" + "+str(crossover)+" + "+str(aptidao))
    start = time.time()
    for i in range(Nexec):

        teste = sendMore()
        teste.populate()
        #f.write("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@\nExecução "+str(i+1)+"\n")
        #if metodo=="Torneio":
        #    f.write("Usando Método "+ metodo +" para tour = "+str(tour))
        #else:
        #    f.write("Usando Método "+ metodo)
        #f.write("\nPopulação = "+str(Tp))
        #f.write("\nTaxa de Crossover = "+str(Tcross))
        #f.write("\nProbabilidade de Mutação = "+str(Tmut)+"%\n\n")
        bs = bs + run(teste,f,metodo,aptidao,crossover)

    end = time.time()

    f.write("\nSoluções ótimas econtradas: "+str(bs))
    f.write("\nTempo de execução  "+str(end-start)+"\n")
    f.write("------------------------------------------\n\n")

#f.write("\nNumero de soluções ótimas: "+str(bs))
#print("Numero de soluções ótimas "+str(bs))


def testes():
    metodo= None
    crossover="Ciclico"
    c= "C1"
    aptidao= None
    j=0
    global tour
    for i in range(12):
        print(str(i))
        if i<=3:
            metodo = "Roleta"
            m = "S1"
        elif i>3 and i<=7:
            metodo = "Torneio"
            tour = 3
            m = "S2"
        elif i>7:
            metodo = "Torneio"
            tour = 2
            m = "S3"

        if i%2 ==0:
            aptidao="Normal"
            a = "R1"
        else:
            aptidao="Elitismo"
            a = "R2"

        if abs(j-i) > 1:
            j=i
            if crossover == "Ciclico":
                crossover = "PMX"
                c = "C2"
            else:
                crossover = "Ciclico"
                c = "C1"

        print(str(metodo)+" + "+str(crossover)+" + "+str(aptidao))
        f.write("   "+str(m)+"   +  "+str(c)+" +    "+str(a)+"\n\n")
        executa(metodo,aptidao,crossover)

def parametros_teste():
    global Tp
    global Nger
    global Tcross
    global Tmut
    Nger =100
    Tcross=80
    j=0
    for i in range(12):
        print(str(i))
        if i<=3:
            Tp = 50
        elif i>3 and i<=7:
            Tp = 100
        elif i>7 and i<=11:
            Tp = 200

        if abs(j-i) > 1:
            j=i
            if Nger == 50:
                Nger = 100
            else:
                 Nger = 50

        if i%2 ==0:
            Tmut = int(Tp *0.1)
        else:
            Tmut = int(Tp* 0.2)

        Tcross = int(0.8 *Tp)
        print("Tp = "+str(Tp)+" + Nger = "+str(Nger)+" + Tcross = "+str(Tcross)+ " + Tmut = " +str(Tmut))
        f.write("Tp = "+str(Tp)+" + Nger = "+str(Nger)+" + Tcross = "+str(Tcross)+ " + Tmut = " +str(Tmut))
        executa("Roleta","Normal","PMX")


if __name__ == '__main__':
    f = open("gina.dat",mode='w',encoding='utf-8')
    #parametros_teste()
    #Tp =200
    #Nger = 50
    #Tcross =  int(Tp *0.8)
    #Tmut = int(0.1 * Tp)
    executa("Roleta","Normal","PMX")


    f.close()













# problema do send + more = money
