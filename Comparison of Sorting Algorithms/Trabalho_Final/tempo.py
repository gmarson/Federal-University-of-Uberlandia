import time


# Medição de tempo

class Tempo(object):
    def __init__(self, verbose=False):
        self.verbose = verbose

    def __enter__(self):
        self.inicio = time.time()
        self.inicio_processo = time.process_time()
        return self

    def __exit__(self, *args):
        self.fim_processo = time.process_time()
        self.fim = time.time()
        self.segs = self.fim - self.inicio
        self.msegs = self.segs * 1000  # milisegundos
        self.processo = self.fim_processo - self.inicio_processo
        if self.verbose:
            print('tempo do processo: {0:.3f} s'.format(self.processo))
            print('tempo total decorrido: {0:.3f} s'.format(self.segs))


class RegistraTempo(object):
    def __init__(self, arquivo='log.dat'):
        self.arquivo = arquivo
        self.fh = open(arquivo, mode='a', encoding='utf-8')

    def __enter__(self):
        self.inicio = time.time()
        self.inicio_processo = time.process_time()
        return self

    def __exit__(self, *args):
        self.fim_processo = time.process_time()
        self.fim = time.time()
        self.segs = self.fim - self.inicio
        self.msegs = self.segs * 1000  # milisegundos
        self.processo = self.fim_processo - self.inicio_processo
        if self.verbose:
            print('tempo do processo: {0:.3f} s'.format(self.processo))
            print('tempo total decorrido: {0:.3f} s'.format(self.segs))
            
