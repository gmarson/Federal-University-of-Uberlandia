f <- function(x)
{
  return (0.2 + 25*x - 200*(x^2) + 675* (x^3) - 900 * (x^4) + 400* (x^5)  )
}

f2 <- function(derivada_segunda,x)
{
  return (eval(derivada_segunda))
}

a <- 0
b <- 0.8
n <- 91 ## SERVE PARA O CALCULO DO ERRO, ESSE N VAI SER O NUMERO DE ITERAÇÕES QUE EU REALIZAREI BUSCANDO UM MÁXIMO PRA F(ALFA) EM MÓDULO.
        ## NOS MÉTODOS MÚLTIPLOS O N TAMBÉM É UTILIZADO PARA PARA MONTAR OS INTERVALOS NO CALCULO DA INTEGRAL
e <- expression(0.2 + 25*x - 200*(x^2) + 675* (x^3) - 900 * (x^4) + 400* (x^5))

h <- (b-a)/n
intervalo <-c()
intervalo[1] <- a +h
somatorio <- intervalo[1]
for(i in 2:(n-1))
{
  intervalo[i] <- intervalo[i-1] + h
}

intervalo_integral <- seq(a,b,length.out = n)
# CALCULO DA INTEGRAL  -------------------------------
somatorio_par <-0
somatorio_impar <- 0
for(i in 1:(n-1))
{
  if(i %% 2 != 0)
  {
    somatorio_impar <- somatorio_impar  + f(intervalo[i]) 
  }
  else
  {
    somatorio_par <- somatorio_par + f(intervalo[i])
  }
  
}
I <- ((b-a) / (3* n)) * (f(a) + 4* somatorio_impar + 2 * somatorio_par + f(b))



#ERRO RELATIVO E CALCULO DA INTEGRAL ----------------
g <- integrate(f,a,b)$value
Rreal <- g
erroR <- abs((Rreal - I)/Rreal) * 100

#ERRO DA INTEGRAÇÃO ----------------------------------
derivada_quarta <-D( D (D ( D (e,"x"), "x"),"x"),"x")


x <- abs(f2(derivada_quarta,intervalo_integral[1]))
for(i in 2:(length(intervalo_integral)))
{
  
  if(x < abs(f2(derivada_quarta,intervalo_integral[i])))
    x <- abs(f2(derivada_quarta,intervalo_integral[i]))
  
}

Et <- - ( (b-a) ^5 / (180 * (n ^4) ) ) * x
##---------------------------------------------------



