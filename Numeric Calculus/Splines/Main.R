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


Runge <-function(intervalo_i,intervalo_f,m)
{
	# m eh o tanto de pontos gerados (o tamanho dos vetores X e Y)
	# os intervalos estipulam o começo e o fim dos pontos em X
	
	Y <- c()
	X <- seq(intervalo_i,intervalo_f,length.out = m)

	for(i in 1:m)
	{
		Y[i] <-  1/(1+25*X[i]*X[i]) 
	}


	return (Y)
}

Teste1 <-function()
{
	X1 <- c(1.1,2.1)
	X2 <- c(1.1,1.9,2.1)
	X3 <- c(1.1,1.4,1.9,2.1)

	x <- seq(1.11,2,length.out=100)

	Y1 <- c(0.6942,1.6562)
	Y2 <- c(0.6942,1.759,1.6562)
	Y3 <- c(0.6942,0.6952,1.759,1.6562)

	l2 <- Lagrange(X1,Y1,2,x)
	l3 <- Lagrange(X2,Y2,3,x)
	l4 <- Lagrange(X3,Y3,4,x)
	
	n2 <- Newton(X1,Y1,2,x)
	n3 <- Newton(X2,Y2,3,x)
	n4 <- Newton(X3,Y3,4,x)

	plot(x,n2,type="l",col="green")
	lines(x,l2,type="l",col="red")
	scan()
	graphics.off()
	
	plot(x,n3,type="l",col="green")
	lines(x,l3,type="l",col="red")
	scan()
	
	graphics.off()

	plot(x,n4,type="l",col="green")
	lines(x,l4,type="l",col="red")
	scan()
	
	graphics.off()
	
}

Teste2 <-function(intervalo_i,intervalo_f)
{

	x <- seq(intervalo_i,intervalo_f,length.out = 50) ## todos usam

	Ri <-  Runge(intervalo_i,intervalo_f,50) ## os ys do Runge

	length(Ri)
	length(x)

	for (i in 4:14)
	{
		
		X   <- seq(intervalo_i,intervalo_f,length.out = i)
		Y_n <- Newton(X,Runge(intervalo_i,intervalo_f,i),i,x)
		Y_l <- Lagrange(X,Runge(intervalo_i,intervalo_f,i),i,x)
		
		length(X)
		length(Y_n)
		length(Y_l)

		plot(x,Ri,type = "l",col = "blue")
		lines(x,Y_n,type = "l",col = "green")
		lines(x,Y_l,type = "l",col = "red")
			
		scan()
		graphics.off()
	}

}

Teste3 <- function()
{
	X <- c(3,4.5,7,9)
	Y <- c(2.5,1,2.5,0.5)
	#x <- 3.1
	x <- seq(3.1,8.99,length.out=100)

	s2 <- Spline_quadratica(X,Y,4,x)
	s3n <- Spline_natural(X,Y,4,x)
	s3nan <- Spline_not_a_knot(X,Y,4,x)

	plot(x,s2,type="l",col="blue")
	lines(x,s3n,type="l",col="green")
	lines(x,s3nan,type="l",col="red")
}

Spline_quadratica <- function(X,Y,n,x)
{	

#X <- c(3.0,4.5,7.0,9.0)
#Y <- c(2.5,1.0,2.5,0.5)
#n <-length(X)	
#x<- c(5,6)

	#n eh o numero de pontos
	tam <- 2*n-3
	a <- c()	

	for(i in 1:(n-1))
	{
		a[i] <- Y[i]		
	}
	

	H<-c()
	D <- seq(0,0, length.out = tam)
	A <- matrix(data = 0:0,nrow = tam, ncol = tam)	

	for( k in 1:(n-1))
	{
		H[k] <- X[k+1] - X[k]
		D[k] <- Y[k+1] - Y[k] 
	}

	A[1,1] <- H[1] # setando a primeira linha da matriz
	
	j<-2
	for(i in 2:(n-1)) # preenchendo com o primeiro bloco de condições
	{
		A[i,j] <- H[i]
		A[i,(j+1)] <- H[i] * H[i]
		j <- j + 2
	}

	A[(i+1),1] <- (-1)
	A[(i+1),2] <- (1)
	
	j <- 2	
	h_iterator <- 2
	i <- i +1	

	for(k in (i+1):tam)
	{
		A[k,j] <- (-1)
		A[k,(j+1)] <-  (-1)*(2 * H[h_iterator])
		A[k,(j+2)] <- (1)
		h_iterator <- h_iterator +1 
		j <- j + 2
	}

	m <- solve(A,D)
		
	b <- c()
	c <- c()

	b[1] <- m[1]
	c[1] <- 0	
	
	##COSNTRUINDO OS Bis E OS Cis
	fim <- length(m)
	for(i in 2:fim)
	{
		if(i %% 2 ==0)
		{
			b <- append(b,m[i])
		}
		else
		{
			c <- append(c,m[i])
		}

	}

	S <- c()

	for(j in 1:length(x))
	{
		xj <- x[j]
		for(i in 1:n)
		{
			if(xj > X[i] && xj < X[i+1])
			{
				R <- a[i] + b[i] * (xj - X[i]) + c[i] * ((xj - X[i])^2)
				#print(R)
				S <- append(S, R)
			}
		}
	}
	
	cat("Spline Quadratica  = ", S, "\n")
	return (S)
	#plot(x,S,type = "l",col = "green")
	
}


Spline_not_a_knot <- function(X,Y,n,x)
{	
	
	tam <- (n-2)
	H <- c() #SAO OS His
	DD <- c() # é o vetor de diferença dividida
	A <- matrix( data = 0:0 , nrow = tam , ncol = tam ) 
	E <-  c() #matriz das diferenças divididas
	
	for(i in 1:(n-1)) # montando o vetor das diferencas dividias e os Hs
	{
		H[i] <- X[(i+1)] - X[i]
		DD[i] <- (Y[(i+1)] - Y[i])/ H[i]
	}

	A[1,1] <-((H[1] + H[2])*(H[1]+2*H[2]))/H[2]
	A[1,2] <- (H[2]^2-H[1]^2)/H[2]
	A[tam,(tam-1)] <- (H[n-2]^2-H[n-1]^2)/H[n-2]
	A[tam,tam] <- ((H[n-1]+H[n-2])*(H[n-1]+2*H[n-2]))/H[n-2]


	if(tam > 2)
	{
		for(i in 2:(n-3)) # Montando o  A (Com os Hs)
		{
			A[i,(i-1)] <- H[i]
			A[i,(i)] <-  2 * ( H[i] + H[(i+1)] )
			A[i,(i+1)] <- H[(i+1)]
		}		
	}

	

	for(i in 1:(n-2))
	{
		E[i] <- DD[(i+1)] - DD[i]
	}

	E <- E * 6

	
	m <- solve(A,E)
	M <- seq(0,0,length.out = n)
	
	# aumentando M
	for (i in 2: (length(m)+1) )
	{
		M[i] <- m[(i-1)]
	}

	a <- Y[1:(n-1)]
	b <- c()
	c <- c()
	d <- c()

	M[1] <- ( (H[1] + H[2] ) * M[2] - ( H[1] * M[3] ) ) / H[2]
	M[n] <- ( ((H[n-1] + H[n-2]) * (M[n-1]) -( H[n-1] *  M[n-2]) ) ) / H[n-2]

	for (i in 1:(n-1))
	{
		b[i] <- DD[i] - (  M[i+1]+ 2* M[i]) *( H[i] /6) 
		c[i] <- M[i]/2 
		d[i] <- ( M[i+1] - M[i] ) / (6*H[i]) 	
	}
	
	
	S <- c()
	k <- 1

	for(j in 1:length(x))
	{	
		
		xj <- x[j]
		for(i in 1:(length(X)-1))
		{	
			
			if(xj > X[i] && xj < X[i+1])
			{	
				#cat(xj , ">", X[i], "&&", xj, "<", X[i+1],"\n")
				R <- a[i] + b[i]*(xj-X[i]) + c[i] * (xj-X[i])^2 + d[i] * (xj-X[i])^3 
				#print(R)
				S[k] <- R
				k <- k+1
				
			}
		}
			
	}
	#cat("H = ",H,"\n")
	#cat("Diferen�as divididas = ",DD,"\n")
	#cat("A = ",A,"\n")
	#cat("E = ",E,"\n")
	cat("Spline Not a Knot = ",S,"\n")	

	return (S)
	#plot(x,S,type = "l",col="blue")


}

Spline_natural <- function(X,Y,n,x)
{	
	tam <- (n-2)
	H <- c() #SAO OS His
	DD <- c() # é o vetor de diferença dividida
	A <- matrix( data = 0:0 , nrow = tam , ncol = tam ) 
	E <-  c() #matriz das diferenças divididas

	for(i in 1:(n-1)) # montando o vetor das diferencas dividias e os Hs
	{
		H[i] <- X[(i+1)] - X[i]
		DD[i] <- (Y[(i+1)] - Y[i])/ H[i]
	}
	
	A[1,1] <-  2 * (H[1] + H[2])
	A[1,2] <- H[2]
	A[tam,tam] <- 2 * (H[n-2] + H[n-1])
	A[tam,(tam-1)] <- H[n-2]

	if(tam > 2)
	{
		for(i in 2:(n-3)) # Montando o  A (Com os Hs)
		{
			A[i,(i-1)] <- H[i]
			A[i,(i)] <-  2 * ( H[i] + H[(i+1)] )
			A[i,(i+1)] <- H[(i+1)]
		}
	}

	for(i in 1:(n-2))
	{
		E[i] <- DD[(i+1)] - DD[i]
	}

	E <- E * 6

	
	m <- solve(A,E)
	M <- seq(0,0,length.out = n)
	
	# aumentando M
	for (i in 2: (length(m)+1) )
	{
		M[i] <- m[(i-1)]
	}

	a <- Y[1:n-1]
	b <- c()
	c <- c()
	d <- c()


	for (i in 1:(n-1))
	{
		b[i] <- DD[i] - (  M[i+1]+ 2* M[i]) *( H[i] /6) 
		c[i] <- M[i]/2 
		d[i] <- ( M[i+1] - M[i] ) / (6*H[i]) 	
	}


	S <- c()
	k <- 1	
	for(j in 1:length(x))
	{	
		xj <- x[j]
		for(i in 1:length(X))
		{
			if(xj > X[i] && xj < X[i+1])
			{
				R <- a[i] + b[i]*(xj-X[i]) + c[i] * (xj-X[i])^2 + d[i] * (xj-X[i])^3 
				S[k] <- R
				#print(R)
				k <- k+1
			}

		}
	}
	
	#cat("H = ",H,"\n")
	#cat("Diferen�as divididas = ",DD,"\n")
	#cat("A = ",A,"\n")
	#cat("E = ",E,"\n")
	cat("Spline Natural = ",S,"\n")

	return (S)
	#plot(x,S,type = "l",col = "green")
	
}

#Spline_quadratica( c(3.0,4.5,7.0,9.0) , c(2.5,1.0,2.5,0.5) , 4 , seq(5,6,length.out=100))
#Teste2(-1,1)
