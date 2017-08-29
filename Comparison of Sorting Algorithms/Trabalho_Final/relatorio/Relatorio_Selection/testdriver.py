import subprocess
import numpy as np
import matplotlib.pyplot as plt
import sys , shutil


##PRA CADA NOVO METODO TEM QUE MUDAR
#Sys.path()

## PARA CADA VETOR NOVO OU NOVO MÉTODO TEM QUE MUDAR
#Para o executa_teste a chamada das funções e o shutil.move()
#para os plots        a chamada das funções e o savefig

sys.path.append('/home/gmarson/Git/AnaliseDeAlgoritmos/Trabalho_Final/Codigos/Selection')  ## adicionei o código de ordenação
sys.path.append('/home/gmarson/Git/AnaliseDeAlgoritmos/Trabalho_Final/relatorio/Resultados/Selection') ## adicionei o resultado do executa_teste


def executa_teste(arqteste, arqsaida, nlin, intervalo):
    """Executa uma sequência de testes contidos em arqteste, com:
       arqsaida: nome do arquivo de saída, ex: tBolha.dat
       nlin: número da linha no arquivo gerado pelo line_profiler contendo
             os dados de interesse. Ex: 14
       intervalo: tamanhos dos vetores: Ex: 2 ** np.arange(5,10)
    """
    f = open(arqsaida,mode='w', encoding='utf-8')
    f.write('#      n   comparações      tempo(s)\n')

    for n in intervalo:
        cmd = ' '.join(["kernprof -l -v", "testeGeneric.py", str(n)])
        str_saida = subprocess.check_output(cmd, shell=True).decode('utf-8')
        linhas = str_saida.split('\n')
        unidade_tempo = float(linhas[1].split()[2])
        #print("CMD:", cmd, "\nSTR_SAIDA: ",str_saida,"\nLINHAS: ",linhas,"\nUNIDADE_TEMPO: ",unidade_tempo)
        #print("Linhas4:",linhas[4]," ----->  Linhas 4 float: ",linhas[4].split()[2])
        tempo_total = float(linhas[3].split()[2])
        lcomp = linhas[nlin].split()
        num_comps = int(lcomp[1])
        str_res = '{:>8} {:>13} {:13.6f}'.format(n, num_comps, tempo_total)
        print(str_res)
        f.write(str_res + '\n')
    f.close()
    shutil.move("tSelection_vetor_aleatorio.dat", "/home/gmarson/Git/AnaliseDeAlgoritmos/Trabalho_Final/relatorio/Resultados/Selection/tSelection_vetor_aleatorio.dat")

#executa_teste("testeGeneric.py", "tSelection_vetor_aleatorio.dat", 14, 2 ** np.arange(5,15))

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

    plt.savefig('relatorio/imagens/Selection/selection_plot_1_aleatorio.png')
    plt.show()



def plota_teste2(arqsaida):
    n, c, t = np.loadtxt(arqsaida, unpack=True)
    plt.plot(n, n ** 2, label='$n^2$')
    plt.plot(n, t, 'ro', label='selection sort')

    # Posiciona a legenda
    plt.legend(loc='upper left')

    # Posiciona o título
    plt.title('Análise da complexidade de \ntempo do método da seleção')

    # Rotula os eixos
    plt.xlabel('Tamanho do vetor (n)')
    plt.ylabel('Tempo(s)')

    plt.savefig('relatorio/imagens/Selection/selection_plot_2_aleatorio.png')
    plt.show()




def plota_teste3(arqsaida):
    n, c, t = np.loadtxt(arqsaida, unpack=True)

    # Calcula os coeficientes de um ajuste a um polinômio de grau 2 usando
    # o método dos mínimos quadrados
    coefs = np.polyfit(n, t, 2)
    p = np.poly1d(coefs)

    plt.plot(n, p(n), label='$n^2$')
    plt.plot(n, t, 'ro', label='selection sort')

    # Posiciona a legenda
    plt.legend(loc='upper left')

    # Posiciona o título
    plt.title('Análise da complexidade de \ntempo do método da seleção com mínimos quadrados')

    # Rotula os eixos
    plt.xlabel('Tamanho do vetor (n)')
    plt.ylabel('Tempo(s)')

    plt.savefig('relatorio/imagens/Selection/selection_plot_3_aleatorio.png')
    plt.show()

plota_teste1("/home/gmarson/Git/AnaliseDeAlgoritmos/Trabalho_Final/relatorio/Resultados/Selection/tSelection_vetor_aleatorio.dat")
plota_teste2("/home/gmarson/Git/AnaliseDeAlgoritmos/Trabalho_Final/relatorio/Resultados/Selection/tSelection_vetor_aleatorio.dat")
plota_teste3("/home/gmarson/Git/AnaliseDeAlgoritmos/Trabalho_Final/relatorio/Resultados/Selection/tSelection_vetor_aleatorio.dat")


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
