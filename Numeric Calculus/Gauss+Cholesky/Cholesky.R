Cholesky <- function(A,b)
{
  ## DIGITAR OS VALORES POR COLUNA

  ## O b pode ser qualquer um

  A <- c(9,6,-3,3,6,20,2,22,-3,2,6,2,3,22,2,28)
  b <- c(12,64,4,82)

  n <- sqrt(length(A))
  m <- n
  d <- c()
  X <- c()

  if (m - floor(m) != 0) return ("Erro")
  cat("Condicionamento: ",kappa(A,exact=TRUE))


  A <- matrix(A,m,n)

  if (identical(A,t(A)) == TRUE && all(eigen(A)$values >= 0) == TRUE)
  {

    L <- matrix(0,n,n)

    for(i in 1:n)
    {
      for(j in 1:n)
      {
        if(i == j && i<=j)
        {
          soma <- 0
          if((i-1) != 0)
          {
            for(k in 1:(i-1))
            {
              soma <- soma + (L[i,k]^2)
            }
          }
          L[i,i] <- sqrt(A[i,i] - soma)
        }
        else if
        (i > j)
        {
          soma <- 0
          if((j-1) != 0)
          {
            for(k in 1:(j-1))
            {
                soma <- soma + (L[i,k] * L[j,k])
            }
          }
          L[i,j] <- (A[i,j] - soma) / L[j,j]
        }
      }
    }

    for(i in 1:n)
    {
      soma <- 0
      if((i-1) != 0)
      {
        for(j in 1:(i-1))
        {
          soma <- soma + L[i,j]*d[j]
        }
      }

      d[i] <- (b[i] - soma)/L[i,i]

    }#fecha for de i

    for(i in n:1)
    {
      soma <- 0

      if (i != n)
      {
        for(j in (i+1):n)
        {
          soma <- soma + L[j,i] * X[j]
        }
      }

      X[i] <- (d[i] - soma)/L[i,i]
    }#fecha for de i
  }else
  {
    print("Matriz A nao simetrica ou nao definida positiva")
  }

}


# Exatidao  >>  R <- b - A %*% X  --------- se R for próximo de 0, o sistema é bom
# Unicidade >>  det(A) se det(A) for diferente de 0, o sistema possuí uma única solução
