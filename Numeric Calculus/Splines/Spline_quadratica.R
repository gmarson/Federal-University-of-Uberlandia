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
	for(i in 2:(n-1)) # preenchendo com o primeiro bloco de condiÃ§Ãµes
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


Spline_quadratica( c(3.0,4.5,7.0,9.0) , c(2.5,1.0,2.5,0.5) , 4 , seq(5,6,length.out=100))