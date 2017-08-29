Spline_linear <- function(X,Y,n,x)
{
	#x  = Valor a ser interpolado
	#X  = pontos dos x usados para fazer o vetor A e B(Coeficientes)
	#Y  = pontos dos y para fazer o vetor A e B(Coeficientes)
	#n  = numero de pontos do vetor

	A <-Y # Ai = F(Xi)
	B <- c()
	
	count <- 1

	for (i in 1:(n-1))
		B[i] <- (Y[i+1] - Y[i]) / ( X[i+1] - X[i] )
	

	for(k in 1:(n-1))
		if(X[k] < x && X[k+1]>x)
			break
		count = k

	S <- A[count] + B[count] * (x - X[count])

	S

}

X <-c(3.5,4.5,7.0,9.0)
Y <-c(2.5,1.0,2.5,0.5)
x <- 5
n <- length(X)

Spline_linear(X,Y,n,x)