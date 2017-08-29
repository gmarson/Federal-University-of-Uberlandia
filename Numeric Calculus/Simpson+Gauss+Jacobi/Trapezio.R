f <- function(x)
{
  #return(x^4/4 + x^2 + sin(x))
  return (0.2 + 25*x - 200*(x^2) + 675* (x^3) - 900 * (x^4) + 400* (x^5)  )
}


f2 <- function(derivada_segunda,x)
{
  return (eval(derivada_segunda))
}

a <- 0
b <- 0.8
n <- 91  ## SERVE PARA O CALCULO DO ERRO, ESSE N VAI SER O NUMERO DE ITERAÇÕES QUE EU REALIZAREI BUSCANDO UM MÁXIMO PRA F(ALFA) EM MÓDULO.
         ## NOS MÉTODOS MÚLTIPLOS O N TAMBÉM É UTILIZADO PARA PARA MONTAR OS INTERVALOS NO CALCULO DA INTEGRAL
e <- expression(0.2 + 25*x - 200*(x^2) + 675* (x^3) - 900 * (x^4) + 400* (x^5))

#ERRO RELATIVO   E CALCULO DA INTEGRAL --------------------------------------
g <- integrate(f,a,b)$value
I <- (b-a) * (( f(a) + f(b) ) /(2))
Rreal <- g
erroR <- abs((Rreal - I)/Rreal) * 100
# ----------------------------------------------------

#ERRO DA INTEGRAÇÃO ----------------------------------
derivada_segunda <- D( D(e,"x"), "x")

intervalo <-c()

intervalo <- seq(a,b,length.out = n)

x <- abs(f2(derivada_segunda,intervalo[1]))
for(i in 2:(length(intervalo)))
{

  if(x < abs(f2(derivada_segunda,intervalo[i])))
		x <- abs(f2(derivada_segunda,intervalo[i]))

}

Et <- - (   ( (b-a)^3)  / 12) * x
##---------------------------------------------------

#cat("Valor aproximado",I,"\nValor Real:",Rreal)
#cat("\nO erro eh de ",erroR,"%")
#cat("\nErro da integração: ",Et)

