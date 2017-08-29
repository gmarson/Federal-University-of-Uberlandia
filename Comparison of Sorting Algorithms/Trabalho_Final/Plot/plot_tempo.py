import numpy as np
import matplotlib.pyplot as plt
from math import *

n = np.arange(2, 2 ** 4)

plt.plot(n, n, 'r--', n, n*np.log2(n), 'bs', n, n ** 2, 'g^')
plt.show()
