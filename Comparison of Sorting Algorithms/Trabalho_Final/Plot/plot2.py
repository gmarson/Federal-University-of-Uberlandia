import numpy as np
import matplotlib.pyplot as plt

n = np.arange(1, 6, 0.1)

plt.plot(n, np.log2(n), label='$\log_2 n$')
plt.plot(n, n, label='$n$')
plt.plot(n, n*np.log2(n), label='$n\log_2 n$')
plt.plot(n, n ** 2, label='$n^2$')

# Posiciona a legenda
plt.legend(loc='upper left')

# Posiciona o título
plt.title('Crescimento de funções')

# Rotula os eixox
plt.xlabel('Tamanho do vetor (n)')
plt.ylabel('Número de comparações')

plt.savefig('plot2.png')
# plt.close()
plt.show()


##PLOTA MAIS BONITO
