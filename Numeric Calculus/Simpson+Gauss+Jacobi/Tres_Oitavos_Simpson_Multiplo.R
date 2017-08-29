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
n <- 6 ## SERVE PARA O CALCULO DO ERRO, ESSE N VAI SER O NUMERO DE ITERAÇÕES QUE EU REALIZAREI BUSCANDO UM MÁXIMO PRA F(ALFA) EM MÓDULO.
## NOS MÉTODOS MÚLTIPLOS O N TAMBÉM É UTILIZADO PARA PARA MONTAR OS INTERVALOS NO CALCULO DA INTEGRAL
e <- expression(0.2 + 25*x - 200*(x^2) + 675* (x^3) - 900 * (x^4) + 400* (x^5))

h <- (b-a)/n

intervalo_integral <- seq(a,b,length.out = n)
intervalo <-c()
intervalo[1] <- a +h

for(i in 2:(n-1))
{
  intervalo[i] <- intervalo[i-1] + h
}

# CALCULO DA INTEGRAL  -------------------------------
somatorio_m3 <-0
somatorio_nm3 <- 0
for(i in 1:(n-1))
{
  if(i %% 3 != 0)
  {
    somatorio_nm3 <- somatorio_nm3  + f(intervalo[i]) 
  }
  else
  {
    somatorio_m3 <- somatorio_m3 + f(intervalo[i])
  }
  
}
I <- ( (3*h) / 8)  * ( f(a) + 3* somatorio_nm3 + 2 * somatorio_m3 + f(b) )



#ERRO RELATIVO  E CALCULO DA INTEGRAL ----------------
g <- integrate(f,a,b)$value
Rreal <- g
erroR <- abs((Rreal - I)/Rreal) * 100

#ERRO DA INTEGRAÇÃO ----------------------------------
derivada_quarta <-D( D (D ( D (e,"x"), "x"),"x"),"x")


x <- abs(f2(derivada_quarta,intervalo_integral[1]))
for(i in 2:(length(intervalo)))
{
  
  if(x < abs(f2(derivada_quarta,intervalo_integral[i])))
  {
    x <- abs(f2(derivada_quarta,intervalo_integral[i]))
  }
    
    
  
}

Et <- - ( (  (b-a) ^5) * x) / (80 * (n^4))
##---------------------------------------------------



