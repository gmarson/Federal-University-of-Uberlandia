f <- function(x)
{
  return(x^4/4 + x^2 + sin(x))
  #return (0.2 + 25*x - 200*(x^2) + 675* (x^3) - 900 * (x^4) + 400* (x^5)  )
}

f2 <- function(derivada_segunda,x)
{
  return (eval(derivada_segunda))
}

a <- 0
b <- pi
n <- 5 ## SERVE PARA O CALCULO DO ERRO, ESSE N VAI SER O NUMERO DE ITERAÇÕES QUE EU REALIZAREI BUSCANDO UM MÁXIMO PRA F(ALFA) EM MÓDULO.
        ## NOS MÉTODOS MÚLTIPLOS O N TAMBÉM É UTILIZADO PARA PARA MONTAR OS INTERVALOS NO CALCULO DA INTEGRAL
e <- expression(x^4/4 + x^2 + sin(x))


##DETERMINANDO O INTERVALO, O SOMATÓRIO E A INTEGRAL ------

h <- ((b-a)/n)
intervalo <-c()

intervalo_integral <- seq(a,b,length.out = n)

intervalo[1] <- a +h
somatorio <- f(intervalo[1])
for(i in 2:(n-1))
{
  intervalo[i] <- intervalo[i-1] + h
  somatorio <- somatorio + f(intervalo[i])
  cat("intervalo:",intervalo[i],"\n")
}

I <- (h/2) * (f(a) + 2* somatorio + f(b))

#CALCULO DO ERRO DA INTEGRAÇÃO------------------------------ 
fdd <- D((D(e,"x")),"x")

F_alfamax <- abs(f2(fdd,intervalo_integral[1]))

for(i in 2:(n))
{
  if(F_alfamax < abs(f2(fdd,intervalo_integral[i])) )
    F_alfamax <- abs(f2(fdd,intervalo_integral[i]))
}


Et <- -( ( (b-a)^3 )/ (12*( n ^ 2) ) ) * F_alfamax
# ----------------------------------------------------------
