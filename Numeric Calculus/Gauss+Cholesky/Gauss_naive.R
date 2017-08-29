Gauss_naive <- function(A,b)
{

  #INSERE POR COLUNA

  A <- c(-2,5,1,4,3,1,6,5,1,-1,3,2,5,0,-1,8)
  b <- c(2,-1,0,6)

	n <- sqrt(length(A))
	m <- n

	if (m - floor(m) != 0) return ("Erro")
	if(det(A) == 0 ) return ("Erro")
	cat("Condicionamento: ",kappa(A,exact=TRUE))

	B <- c(A,b)
	nc <- n+1
	X <- c()
	dim(B) <- c(m,nc) ##formando a matriz A com os b´s juntos

	##linha pivô ¬
	for(k in 1 :(n-1)) ## Decomposição: Adquirindo L e U
	{ # o primeiro for vai até n-1 pois a ultima linha nao eh reduzida
		for(i in (k+1) : n) ## linhas a baixo da pivo
		{
			fator <- B[i,k]/B[k,k]
			for(j in (k+1): nc)
			{
				B[i,j] <- B[i,j] - (fator * B[k,j])
			}
		}
	}

	X[n] <- B[n,nc] / B[n,n]
	for(i in seq( (n-1) , 1, -1) )
	{
		soma <- 0
		for(j in (i+1) : n)
		{
			soma <- soma  + B[i,j] * X[j]
		}
		X[i] <- (B[i,nc]- soma) / (B[i,i])
	}

}

#Gauss_naive(c(0.003, 1 , 3 , 1) , c(2.0001, 1))
