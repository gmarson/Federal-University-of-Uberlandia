Lagrange <- function(X,Y,n,x)
{

	#x  = Valor a ser interpolado
	#X  = pontos dos x usados para fazer o polinomio XY
	#Y  = pontos dos y para fazer o polinomio XY
	#n  = numero de pontos do vetor X e Y (eles tem o mesmo tamanho)

	
	R <- 0
	for(i in 1:n)
	{
		c <- 1 #numerador
		d <- 1 #denominador
		for(j in 1:n)
		{
			if(j !=i )
			{
				c <- c * (x - X[j])
				d <- d * (X[i] - X[j])
			}
		}
		R <- R + Y[i] * c/d
	}	
	
	cat("Lagrange = ", R,"\n")
	
	return(R)
}

Lagrange(c(1,4,6), c(0,1.386298,1.791759),3,seq(1,6,length.out = 100) )