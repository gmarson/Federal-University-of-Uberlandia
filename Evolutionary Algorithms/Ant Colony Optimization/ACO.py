#!/usr/bin/env python
# -*- coding: utf-8 -*-


from utils import *
import random
from copy import deepcopy

random.seed(0)

ALPHA = 3
BETA = 3
MAX_ATTEMPTS = 50
SECRETED_PHEROMONE = 5000 ## Q
WEAKENING_RATE = 0.3 ## P

class ACO(object):
    def __init__(self,graph):
        self.graph = graph
        self.costCompletePath ={}
        self.ants = {}
        self.bestAnswer = 0

    def go(self):
        attempt = 0
        bestResult = []
        #correct = 0
        while attempt < MAX_ATTEMPTS:
            self.buildAnts()
            self.buildPath()
            self.updatePheromone()

            attempt+=1

        return self.checkForBestResult()

    def checkForBestResult(self):
        bestResult = 9999999999
        indexOfBestResult = 0
        for i in range(len(self.costCompletePath)):
            if self.costCompletePath[i] < bestResult:
                indexOfBestResult = i
                bestResult = self.costCompletePath[i]


        return [bestResult , self.ants[indexOfBestResult][1]]

    def buildAnts(self):
        for i in range(len(self.graph.mapNumberToCity)):
            self.ants[i] = [[],[]]
            self.costCompletePath[i] = 0
            self.ants[i][1].append(i)
            for j in range(len(self.graph.mapNumberToCity)):
                if j !=i:
                    self.ants[i][0].append( [ j , None ] )

    def checkForBreak(self):
        for ant in range(len(self.costCompletePath)-1):
            if self.costCompletePath[ant] != self.costCompletePath[ant+1]:
                return False
        return True

    def calculateChanceToCity(self):
        #input(self.graph.distanceBetweenCities)
        ##A CADA ITERAÇÃO,  A FORMIGA NAO TA INDO PRA ONDE DEVERIA IR, POR EXEMPLO, SE DUAS VAO PRA EVORA, O PROGRAMA FALA QUE SÓ UMA VAI PRA EVORA
        for i in range(len(self.ants)):
            currentAntPosition = self.ants[i][1][-1]
            denominator = self.calculateDenominator(i,currentAntPosition)
            for j in range(len(self.ants[i][0])):
                #self.graph.printMap()
                #print(self.ants[i])
                #print("I "+str(i)+"   J "+str(j))

                if self.ants[i][0][j][0] not in self.ants[i][1]:
                    #print("Formiga "+str(currentAntPosition)+"\n J = "+str(j))
                    #input("VAMO VER SE TO PEGANDO CERTO "+  str(self.graph.pheromoneMatrix[currentAntPosition][j][1])  )
                    numerator = (self.graph.pheromoneMatrix[currentAntPosition][j][1] ** ALPHA) * (self.graph.inverseDistanceMatrix[currentAntPosition][j][1] ** BETA)
                    #input("NUMERADOR: "+str(numerator))
                    #print(self.ants[ self.ants[i][0][j][0] ][0][i])
                    self.ants[i][0][j][1] = numerator/denominator # ta certo
                else:
                    self.ants[i][0][j][1] = 0 ##toma cuidado aki

                    #input("Cidade "+str(i)+" até "+str(self.ants[i][0][j]))
                    #input("Cidade "+str(self.ants[ self.ants[i][0][j][0] ] [0][i])+" até "+str(self.ants[ self.ants[i][0][j][0] ][0][i]))

            #input(self.printChanceMatrix())

    def calculateDenominator(self,i,currentAntPosition):
        denominator = 0
        #input("AKI O FI:"+str(self.ants[i][0]))
        for j in range(len(self.ants[i][0])):
            #print(self.graph.inverseDistanceMatrix[i][j][1])
            if self.ants[i][0][j][0] not in self.ants[i][1]:
                denominator += (self.graph.pheromoneMatrix[currentAntPosition][j][1] ** ALPHA) * (self.graph.inverseDistanceMatrix[currentAntPosition][j][1] ** BETA)

        #input("\nDenominador: "+str(denominator))
        if denominator == 0:
            return 1
        return denominator

    def roulette(self):
        #input(self.printChanceMatrix())
        for ant in self.ants:
            positionOfChosenCity =0
            choiceOfAnt = random.uniform(0,1)
            #input("choiceOfAnt = "+str(choiceOfAnt))

            finalChoice = self.ants[ant][0][positionOfChosenCity][1]

            while choiceOfAnt >= finalChoice:
                positionOfChosenCity +=1
                finalChoice += self.ants[ant][0][positionOfChosenCity][1]

            #print("ant was on city "+self.graph.mapNumberToCity[self.ants[ant][1][-1]])
            self.appendPathToAnt(ant,positionOfChosenCity)

    def appendPathToAnt(self,ant,positionOfChosenCity):
        chosenCity = self.ants[ant][0][positionOfChosenCity][0]
        #print("Ant choose to go to "+self.graph.mapNumberToCity[chosenCity])
        self.ants[ant][1].append(chosenCity)

    def buildPath(self):
        for step in range(1,len(self.ants)):
            self.calculateChanceToCity()
            self.roulette()

        for ant in range(len(self.ants)):
            self.ants[ant][1].append(ant)

        self.computeTotalCost()

    def computeTotalCost(self):
        for i in range(len(self.ants)):
            for j in range(len(self.ants[i][1]) -1):
                for k in range(len(self.graph.distanceBetweenCities[ self.ants[i][1][j] ])):
                    if self.ants[i][1][j+1] == self.graph.distanceBetweenCities[self.ants[i][1][j] ] [k][0]:
                        self.costCompletePath[i] += self.graph.distanceBetweenCities[self.ants[i][1][j]] [k][1]

        #self.printTotalCost()

    def updatePheromone(self):
        #print(self.graph.pheromoneMatrix)

        #self.printTotalCost()
        for originCity in range(len(self.graph.pheromoneMatrix)):
            for destinyCity in range(originCity, len(self.graph.pheromoneMatrix[originCity])+1 ):
                if originCity != destinyCity:
                    droppedPheromone = 0
                    #print("O "+str(originCity)+" D "+str(destinyCity))
                    antsByEdge = self.checkQtyOfAnts(originCity,destinyCity) # to mandando a aresta 0 -> 1 da primeira vez
                    #print("abe "+str(antsByEdge))
                    for path in antsByEdge:
                        droppedPheromone += (SECRETED_PHEROMONE/path)

                    #input("droppedPheromone "+str(droppedPheromone))

                    #print("originCity "+str(originCity)+" destinyCity "+str(destinyCity))

                    desiredOriginCity, desiredDestinyCity = None, None

                    for k in range(len(self.graph.pheromoneMatrix) -1):
                        #input(self.graph.pheromoneMatrix[originCity][k][0])
                        if self.graph.pheromoneMatrix[originCity][k][0] ==destinyCity:
                            desiredDestinyCity = k
                        if self.graph.pheromoneMatrix[destinyCity][k][0] == originCity:
                            desiredOriginCity = k

                    #print("feromonio antigo :"+str(self.graph.pheromoneMatrix[originCity][desiredDestinyCity][1]))
                    self.graph.pheromoneMatrix[originCity][desiredDestinyCity][1] = (1 - WEAKENING_RATE) * self.graph.pheromoneMatrix[originCity][desiredDestinyCity][1] + droppedPheromone
                    self.graph.pheromoneMatrix[destinyCity][desiredOriginCity][1] = deepcopy(self.graph.pheromoneMatrix[originCity][desiredDestinyCity][1])
                    #input(self.graph.pheromoneMatrix[originCity])
                    #input(self.graph.pheromoneMatrix[destinyCity])
                    #tenho o custo do caminho completo das formigas que passaram por determinada aresta
                    ##agora basta somar Q/Lk
        #input(self.printPheromoneMatrix())

    def checkQtyOfAnts(self,originCity,destinyCity):
        antsByEdge = []
       # print("originCity "+str(originCity)+" destinyCity "+str(destinyCity))

        for j in range(len(self.ants[originCity][1]) -1):
            #input("To olhando para "+str(self.graph.pheromoneMatrix[ self.ants[originCity][1][j] ]))
            #print("valor de j"+str(j))
            for k in range(len(self.graph.pheromoneMatrix[ self.ants[originCity][1][j] ]) +1):
                #input(self.ants[j][1][k])
                #input(str(self.ants[j][1][k])+" == "+ str(originCity)+ " e "+str(self.ants[j][1][k+1])+ " == "+str(destinyCity))
                if self.ants[j][1][k] == originCity and self.ants[j][1][k+1] == destinyCity:
                    #input("entrou no primeiro e ja nao preciso mais percorrer, vou pro proximo")
                    antsByEdge.append(self.costCompletePath[j])
                    break
                elif self.ants[j][1][k] == destinyCity and self.ants[j][1][k+1] == originCity:
                    #input("entrou no segundo  e ja nao preciso mais percorrer, vou pro proximo")
                    antsByEdge.append(self.costCompletePath[j])
                    break
        return antsByEdge

    def printPheromoneMatrix(self):
        for ant in range(len(self.graph.pheromoneMatrix)):
            print("Edge "+str(ant)+" to ")
            for city in range(len(self.graph.pheromoneMatrix[ant])):
                print(self.graph.pheromoneMatrix[ant][city])

    def printTotalCost(self):
        for ant in range(len(self.costCompletePath)):
            print("Ant "+str(ant)+" path is "+str(self.ants[ant][1])+"\nTotal Cost is: "+str( self.costCompletePath[ant]))

    def printPath(self):
        for key in self.ants:
            print("For Ant "+str(key)+" path is "+str(self.ants[key][1]))

    def printChanceMatrix(self):
        for i in range(len(self.ants)):
            print("ant is on city "+str(self.graph.mapNumberToCity[i])+" to ")

            for j in range(len(self.ants[i][0])):
                print(str(self.graph.mapNumberToCity[self.ants[i][0][j][0] ])+ " chance is  "+ str(self.ants[i][0][j][1]) )


            print()
        #self.graph.printGraph()



if __name__ == '__main__':
    g1 = graph("table4.txt")
    result, ants = [], []
    bestPath = [99999999,None]
    for i in range(6):
        result.append(ACO(g1))


    for i in range(len(result)):
        ants.append(result[i].go())
        if ants[i][0] < bestPath[0]:
            bestPath = ants[i]


    print("The best path is "+str(bestPath[1])+"\nCost: "+str(bestPath[0]))
