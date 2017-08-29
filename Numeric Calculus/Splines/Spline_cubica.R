Spline_cubica <- function(X,Y,n,x)
{

	X <- c(1,2,4,6,7)
	Y <- c(2,4,1,3,3)
	n <-5
	x <- c(1.2,2.9,5.2,6.7)
	
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

	for(i in 2:(n-3)) # Montando o  A (Com os Hs)
	{
		A[i,(i-1)] <- H[i]
		A[i,(i)] <-  2 * ( H[i] + H[(i+1)] )
		A[i,(i+1)] <- H[(i+1)]
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
	
	### Escolha qual spline cubica
	Spline_natural(X,Y,n,x,H,DD,M)
	#Spline_not_a_knot(X,Y,n,x,H,DD,M)
}


Spline_not_a_knot <- function(X,Y,n,x)
{	
	
	tam <- (n-2)
	H <- c() #SAO OS His
	DD <- c() # Ã© o vetor de diferenÃ§a dividida
	A <- matrix( data = 0:0 , nrow = tam , ncol = tam ) 
	E <-  c() #matriz das diferenÃ§as divididas
	
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
	#cat("Diferenças divididas = ",DD,"\n")
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
	DD <- c() # Ã© o vetor de diferenÃ§a dividida
	A <- matrix( data = 0:0 , nrow = tam , ncol = tam ) 
	E <-  c() #matriz das diferenÃ§as divididas

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
	#cat("Diferenças divididas = ",DD,"\n")
	#cat("A = ",A,"\n")
	#cat("E = ",E,"\n")
	cat("Spline Natural = ",S,"\n")

	return (S)
	#plot(x,S,type = "l",col = "green")
	
}


Spline_not_a_knot( c(1,2,4,6,7), c(2,4,1,3,3), 5 , seq(1.1,6.99,length.out=100))