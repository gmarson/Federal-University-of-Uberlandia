Newton <- function(X,Y,n,x)
{		
	#x  = Valor a ser interpolado
	#X  = pontos dos x usados para fazer o polinomio XY
	#Y  = pontos dos y para fazer o polinomio XY
	#n  = numero de pontos do vetor X e Y (eles tem o mesmo tamanho)

	xy <- Y
	
	for(k in 1:(n-1))
		for(i in n:(k+1))
			xy[i] <- (xy[i] - xy[i-1])/(X[i] - X[i-k])
			
	R<- xy[n]

	for(i in (n-1):1)
		R <- R * (x - X[i]) + xy[i]
	
		
	cat("Newton = ",R,"\n")
	
	#plot(x,R,type = "l",col = "blue")

	return (R)
	
}

Newton( c(1,4,6), c(0, 1.386298,1.791759), 3 , 2 )