#!/usr/bin/env python
# -*- coding: utf-8 -*-


# Deve ser implementado um ambiente computacional que, uma vez especificada a
#instância do PCV a ser resolvido, busque encontrar a melhor rota possível.
#
# vertices totalmente conectados
# arestas simetricas# deverão ser fornecidos ao sistema :
#1 -  numero de cidades do grafo
#2 - distancia associada a cada par de cidades (entrada de dados em uma tabela)
#2.1 - coordenadas x,y de cada cidade (entrada de dadoos em um tabela)

import csv
import sys
from math import sqrt

INITIAL_PHEROMONE_VALUE = 1
class graph(object):

    def __init__(self,input_file):

        f = open(input_file,'r')
        lines = f.readlines()
        lines = [ lines[i].split() for i in range(len(lines)) ]

        self.inputName = input_file

        if input_file == "table1.txt":
            pass
        elif input_file == "table2.txt":
            lines = self.toNormalTable(lines)
        else:
            lines = self.toNormalTable2(lines)


        for line in lines:
            print(line)

        self.mapNumberToCity = {}
        self.distanceBetweenCities = {}
        self.inverseDistanceMatrix = {}
        self.pheromoneMatrix = {}

        self.currentKeyPosition = 0
        self.buildMap(lines)
        self.settingMatrix()
        self.buildGraph(input_file,lines)
        self.sortMatrix()

        #input(self.printGraph())

    def toNormalTable(self,lines):
        resultingLines = []
        resultingLines.append(lines[0])

        for i in range(len(lines[0])):
            subList = []
            subList.append(lines[0][i])
            resultingLines.append(subList)

        for i in range(1,len(lines[0])+1 ):# lines[0] nao tem o x nem y, só as cidades
            for j in range(1,len(lines[1])):
                #print("X1 "+str(lines[1][i])+ " Y1 "+lines[2][i] )
                #print("X2 "+str(lines[1][j])+ " Y2 "+lines[2][j] )
                #input
                resultingLines[i].append(self.computeDistance(lines[1][i],lines[2][i],lines[1][j],lines[2][j]))

        return resultingLines

    def toNormalTable2(self,lines):

            #input(lines)
            resultingLines = []
            resultingLines.append([])
            for i in range(len(lines)):
                resultingLines[0].append(str("C"+lines[i][0]))


            for i in range(len(lines)):
                subList = []
                subList.append(str("C"+lines[i][0]))
                resultingLines.append(subList)

            #input(resultingLines)
            for i in range(len(lines)):# lines[0] nao tem o x nem y, só as cidades
                X1 = lines[i][1]
                Y1 = lines[i][2]
                #print("X1 "+str(lines[i][1])+ " Y1 "+lines[i][2] )

                for j in range(len(lines)):
                    #print("X2 "+str(lines[j][1])+ " Y2 "+lines[j][2] )

                    resultingLines[i+1].append(self.computeDistance(lines[i][1],lines[i][2],lines[j][1],lines[j][2]))
                    #input(resultingLines)
            return resultingLines

    def computeDistance(self,x1,y1,x2,y2):
        return str(int(sqrt( (float(x2) -float(x1)) ** 2 + (float(y2) - float(y1)) ** 2)))


    def buildMap(self,lines):
        for line in lines:
            destinyCity = 0
            originCity = line[0]
            for value in line:
                #input("nessa line: "+str(line))
                if not value.isdigit():
                    #input(value)
                    #input(value.isdigit())
                    self.addToMap(value)
        #input(self.printMap())

    def addToMap(self,cityName):
        for key in self.mapNumberToCity:
            if self.mapNumberToCity[key] == cityName:
                return
        self.mapNumberToCity[self.currentKeyPosition] = cityName
        self.currentKeyPosition +=1

    def settingMatrix(self):
        for i in range(len(self.mapNumberToCity)):
            self.distanceBetweenCities[i] = []
            self.inverseDistanceMatrix[i] = []
            self.pheromoneMatrix[i] = []

    def buildGraph(self,input_file,lines):
        for line in lines:
            destinyCity = 0
            originCity = line[0]
            for value in line:
                if value.isdigit():
                    self.addtoGraph(originCity, destinyCity ,value)
                    destinyCity +=1

    def addtoGraph(self,originCity,destinyCity,distance):
        distance = float(distance)
        if distance == 0 :
            return
        for key,city in self.mapNumberToCity.items():
            if city == originCity:
                originCity = key
                break

        if [destinyCity,distance] not in self.distanceBetweenCities[originCity] and [originCity,distance] not in self.distanceBetweenCities[destinyCity]:
            self.distanceBetweenCities[originCity].append([destinyCity ,distance])
            self.distanceBetweenCities[destinyCity].append([originCity, distance])

            self.inverseDistanceMatrix[originCity].append([destinyCity, 1/distance])
            self.inverseDistanceMatrix[destinyCity].append([originCity, 1/distance])

            self.pheromoneMatrix[originCity].append([ destinyCity , INITIAL_PHEROMONE_VALUE ])
            self.pheromoneMatrix[destinyCity].append([originCity, INITIAL_PHEROMONE_VALUE])


    def sortMatrix(self):
        for key in self.distanceBetweenCities:
            self.distanceBetweenCities[key] = sorted(self.distanceBetweenCities[key], key=lambda cityList :cityList[0] )
            self.inverseDistanceMatrix[key] = sorted(self.inverseDistanceMatrix[key], key=lambda cityList :cityList[0] )
            self.pheromoneMatrix[key] = sorted(self.pheromoneMatrix[key], key=lambda cityList :cityList[0] )


    def printGraph(self):
        print("\nMAP FUNCTION")
        for key, city in self.mapNumberToCity.items():
            print(str(key)+" : "+ city)

        print("\nGRAPH")

        for key in self.distanceBetweenCities:
            print("\n"+ self.mapNumberToCity[key]+ " to ")
            for city in self.distanceBetweenCities[key]:
                sys.stdout.write('['+self.mapNumberToCity[city[0]] +" , "+str(city[1])+'] ')
                print()

    def printMap(self):
        print("\nMAP FUNCTION")
        for key, city in self.mapNumberToCity.items():
            print(str(key)+" : "+ city)
