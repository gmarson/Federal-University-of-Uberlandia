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
n <- 90 ## SERVE PARA O CALCULO DO ERRO, ESSE N VAI SER O NUMERO DE ITERAÇÕES QUE EU REALIZAREI BUSCANDO UM MÁXIMO PRA F(ALFA) EM MÓDULO.
## NOS MÉTODOS MÚLTIPLOS O N TAMBÉM É UTILIZADO PARA PARA MONTAR OS INTERVALOS NO CALCULO DA INTEGRAL
e <- expression(0.2 + 25*x - 200*(x^2) + 675* (x^3) - 900 * (x^4) + 400* (x^5))

h <- (b-a)/3 ## AKI É 4 POIS A REGRA DE SIMPSON SEMPRE EXIGE 4 PONTOS IGUALMENTE ESPAÇADOS
intervalo <-c()
intervalo[1] <- a
somatorio <- intervalo[1]

intervalo <- seq(a,b,length.out = n)

# CALCULO DA INTEGRAL  -------------------------------

I <- ( (3*h) / 8)  * ( f(a) + 3* f(intervalo[2]) + 3 * f(intervalo[3]) + f(b) )



#ERRO RELATIVO  E CALCULO DA INTEGRAL ----------------
g <- integrate(f,a,b)$value
Rreal <- g
erroR <- abs((Rreal - I)/Rreal) * 100

#ERRO DA INTEGRAÇÃO ----------------------------------
derivada_quarta <-D( D (D ( D (e,"x"), "x"),"x"),"x")


x <- abs(f2(derivada_quarta,intervalo[1]))
for(i in 2:(length(intervalo)))
{
  
  if(x < abs(f2(derivada_quarta,intervalo[i])))
    x <- abs(f2(derivada_quarta,intervalo[i]))
  
}

Et <- - ( (  (b-a) ^5 / 80) * x)
##---------------------------------------------------



