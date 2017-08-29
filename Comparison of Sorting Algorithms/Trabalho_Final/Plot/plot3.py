import numpy as np
import matplotlib.pyplot as plt

n, y = np.loadtxt('p3.dat',unpack=True)

plt.plot(n, y, 'ro', label='dados')
plt.plot(n, n ** 2, label='$n^2$')

# Posiciona a legenda
plt.legend(loc='upper left')

# Posiciona o título
plt.title('Crescimento de funções')

# Rotula os eixox
plt.xlabel('Tamanho do vetor (n)')
plt.ylabel('Número de comparações')

plt.savefig('plot3.png')
# plt.close()
plt.show()


