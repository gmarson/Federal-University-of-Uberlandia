# coding = utf-8
import subprocess
import numpy as np
import matplotlib.pyplot as plt
import sys , shutil


##PRA CADA NOVO METODO TEM QUE MUDAR
#Sys.path()

## PARA CADA VETOR NOVO OU NOVO METODO TEM QUE MUDAR
#Para o executa_teste a chamada das funções e o shutil.move()
#para os plots        a chamada das funções e o savefig

sys.path.append('/home/gmarson/Git/AnaliseDeAlgoritmos/Trabalho_Final/Codigos/Counting')  ## adicionei o código de ordenação
sys.path.append('/home/gmarson/Git/AnaliseDeAlgoritmos/Trabalho_Final/relatorio/Resultados/Counting') ## adicionei o resultado do executa_teste


def executa_teste(arqteste, arqsaida, nlin, intervalo):
    """Executa uma sequência de testes contidos em arqteste, com:
       arqsaida: nome do arquivo de saída, ex: tBolha.dat
       nlin: número da linha no arquivo gerado pelo line_profiler contendo
             os dados de interesse. Ex: 14
       intervalo: tamanhos dos vetores: Ex: 2 ** np.arange(5,10)
    """
    f = open(arqsaida,mode='w', encoding='utf-8')
    f.write('#      n      tempo(s)\n')

    for n in intervalo:
        cmd = ' '.join(["kernprof -l -v", "testeGeneric.py", str(n)])
        str_saida = subprocess.check_output(cmd, shell=True).decode('utf-8')
        linhas = str_saida.split('\n')
        #for i in linhas:
        #    print(i)
        #print (linhas)
        unidade_tempo = float(linhas[1].split()[2])
        tempo_total = float(linhas[3].split()[2])
        #lcomp = linhas[nlin].split()

        #print ("unidade tempo: ",unidade_tempo )
        #print("lcomp: ",lcomp)
        #print("tempo total",tempo_total)

        #num_comps = int(lcomp[1])
        str_res = '{:>8} {:13.6f}'.format(n, tempo_total)
        print(str_res)
        f.write(str_res + '\n')
    f.close()
    shutil.move("tCounting_vetor_parcialmente_ordenado_decrescente.dat", "/home/gmarson/Git/AnaliseDeAlgoritmos/Trabalho_Final/relatorio/Resultados/Counting/tCounting_vetor_parcialmente_ordenado_decrescente.dat")

executa_teste("testeGeneric.py", "tCounting_vetor_parcialmente_ordenado_decrescente.dat", 46, 2 ** np.arange(5,15))

def executa_teste_memoria(arqteste, arqsaida, nlin, intervalo):
    """Executa uma sequência de testes contidos em arqteste, com:
       arqsaida: nome do arquivo de saída, ex: tBolha.dat
       nlin: número da linha no arquivo gerado pelo line_profiler contendo
             os dados de interesse. Ex: 14
       intervalo: tamanhos dos vetores: Ex: 2 ** np.arange(5,10)
    """
    f = open(arqsaida,mode='w', encoding='utf-8')
    f.write('#      n   comparações      tempo(s)\n')

    for n in intervalo:
        cmd = ' '.join(["kernprof -l -v ", "testeGeneric.py", str(n)])

        str_saida = subprocess.check_output(cmd, shell=True).decode('utf-8')

        linhas = str_saida.split('\n')
        for i in linhas:
            print(i)

        print ("Linhas:",linhas[1])

        unidade_tempo = float(linhas[1].split()[2])


        str_res = '{:>8} {:>13} {:13.6f}'.format(n, n, n)
        print(str_res)
        f.write(str_res + '\n')
    f.close()
    #shutil.move("tSelection_memoria.dat", "/home/gmarson/Git/AnaliseDeAlgoritmos/Trabalho_Final/relatorio/Resultados/Selection/tSelection_memoria.dat")

#executa_teste_memoria("testeGeneric.py", "tSelection_memoria.dat", 14, 2 ** np.arange(5,15))

def plota_teste1(arqsaida):
    n, c, t = np.loadtxt(arqsaida, unpack=True)
    #print("n: ",n,"\nc: ",c,"\nt: ",t)
    #n eh o tamanho da entrada , c eh o tanto de comparações e t eh o tempo gasto
    plt.plot(n, n ** 2, label='$n^2$')  ## custo esperado bubble Sort
    plt.plot(n, c, 'ro', label='selection sort')

    # Posiciona a legenda
    plt.legend(loc='upper left')

    # Posiciona o título
    plt.title('Análise de comparações do método da seleção')

    # Rotula os eixos
    plt.xlabel('Tamanho do vetor (n)')
    plt.ylabel('Número de comparações')

    plt.savefig('relatorio/imagens/Selection/selection_plot_1_ordenado_descresente.png')
    plt.show()



def plota_teste2(arqsaida):
    n, t = np.loadtxt(arqsaida, unpack=True)
    plt.plot(n, n , label='$n$')
    plt.plot(n, t, 'ro', label='counting sort')

    # Posiciona a legenda
    plt.legend(loc='upper left')

    # Posiciona o título
    plt.title('Análise da complexidade de \ntempo do método Counting Sort')

    # Rotula os eixos
    plt.xlabel('Tamanho do vetor (n)')
    plt.ylabel('Tempo(s)')

    plt.savefig('relatorio/imagens/Counting/counting_plot_2_parcialmente_ordenado_decrescente.png')
    plt.show()


def plota_teste3(arqsaida):
    n, t = np.loadtxt(arqsaida, unpack=True)

    # Calcula os coeficientes de um ajuste a um polinômio de grau 2 usando
    # o método dos mínimos quadrados
    coefs = np.polyfit(n, t, 2)
    p = np.poly1d(coefs)

    plt.plot(n, p(n), label='$n$')
    plt.plot(n, t, 'ro', label='counting sort')

    # Posiciona a legenda
    plt.legend(loc='upper left')

    # Posiciona o título
    plt.title('Análise da complexidade de \ntempo do método Counting Sort com mínimos quadrados')

    # Rotula os eixos
    plt.xlabel('Tamanho do vetor (n)')
    plt.ylabel('Tempo(s)')

    plt.savefig('relatorio/imagens/Counting/counting_plot_3_parcialmente_ordenado_decrescente.png')
    plt.show()

#plota_teste1("/home/gmarson/Git/AnaliseDeAlgoritmos/Trabalho_Final/relatorio/Resultados/Selection/tSelection_vetor_ordenado_descresente.dat")
plota_teste2("/home/gmarson/Git/AnaliseDeAlgoritmos/Trabalho_Final/relatorio/Resultados/Counting/tCounting_vetor_parcialmente_ordenado_decrescente.dat")
plota_teste3("/home/gmarson/Git/AnaliseDeAlgoritmos/Trabalho_Final/relatorio/Resultados/Counting/tCounting_vetor_parcialmente_ordenado_decrescente.dat")


def plota_teste4(arqsaida):
    n, c, t = np.loadtxt(arqsaida, unpack=True)

    # Calcula os coeficientes de um ajuste a um polinômio de grau 2 usando
    # o método dos mínimos quadrados
    coefs = np.polyfit(n, c, 2)
    p = np.poly1d(coefs)

    plt.plot(n, p(n), label='$n^2$')
    plt.plot(n, c, 'ro', label='bubble sort')

    # Posiciona a legenda
    plt.legend(loc='upper left')

    # Posiciona o título
    plt.title('Análise da complexidade de \ntempo do método da bolha')

    # Rotula os eixos
    plt.xlabel('Tamanho do vetor (n)')
    plt.ylabel('Número de comparações')

    plt.savefig('bubble4.png')
    plt.show()

def plota_teste5(arqsaida):
    n, c, t = np.loadtxt(arqsaida, unpack=True)

    # Calcula os coeficientes de um ajuste a um polinômio de grau 2 usando
    # o método dos mínimos quadrados
    coefs = np.polyfit(n, c, 2)
    p = np.poly1d(coefs)

    # set_yscale('log')
    # set_yscale('log')
    plt.semilogy(n, p(n), label='$n^2$')
    plt.semilogy(n, c, 'ro', label='bubble sort')

    # Posiciona a legenda
    plt.legend(loc='upper left')

    # Posiciona o título
    plt.title('Análise da complexidade de \ntempo do método da bolha')

    # Rotula os eixos
    plt.xlabel('Tamanho do vetor (n)')
    plt.ylabel('Número de comparações')

    plt.savefig('bubble5.png')
    plt.show()
