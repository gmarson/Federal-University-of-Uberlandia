LUP<- function(A,b)
{
  #Insere a por coluna

  A <- c(1,2,4,2,3,0,0,1,0,-3,1,2,5,1,3,0,-1,-2,-2,-3,0,1,2,4,3,-1,-2,0,1,0,0,1,2,5,1,3)
  b <- c(10,-5,13,-16,12,2)

  trocas <-0



  n <- sqrt(length(A))
  m <- n
  A <- matrix(A,m,n)
  L <- matrix(0,n,m)
  X <- 1
  d <- 1



  if (m - floor(m) != 0) return ("Erro")
  cat("Condicionamento: ",kappa(A,exact=TRUE))

  for(i in 1:n)
  {
    L[i,i] <- 1
  }

  P <- L
  U <- A



  for (k in 1:(n-1)) ## CALCULO U E L
  {
    max <- abs(U[k,k])
    ind <- k

    for(ii in (k+1):n) ##PIVOTEAMENTO
    {
      if (abs(U[ii,k]) > max)
      {
        max <- abs(U[ii,k])
        ind <- ii
      }
    }

    if (ind != k)
    {
      for(j in k:n)
      {
        aux <- U[k,j]
        U[k,j] <- U[ind,j]
        U[ind,j] <- aux
      }


      for (j in 1:n)  ## MONITORANDO AS TROCAS DE U EM P PARA DEPOIS
      {               ## COLOCAR EM B
        aux <- P[k,j]
        P[k,j] <- P[ind,j]
        P[ind,j] <- aux
      }

      aux <- b[ind] ## REALIZANDO AS TROCAS EM B
      b[ind] <- b[k]
      b[k] <- aux
      trocas <- trocas +1

      if (k != 1)
      {
        for (j in 1:(k-1))
        {
          aux <- L[k,j]
          L[k,j] <- L[ind,j]
          L[ind,j] <- aux
        }
      }
    }

    for(i in (k+1):n)
    {
      L[i,k] <- U[i,k]/U[k,k]
      for(m in 1:n)
      {
        U[i,m] <- U[i,m] - L[i,k]*U[k,m]
      }
    }
  }## FIM CALCULO U E  L

  det <-1
  for(index in 1:n)
  {
    det <- det * U[index,index]
  }

  det <- det / ((-1) ^trocas)


  if(det == 0) return ("Determinante = 0")

  d[1] <- b[1]   ###CALCULO DO d  (Ld =b)
  for(i in 2:n)
  {
    soma <- 0
    for(j in 1:(i-1))
    {
      soma <- soma + (L[i,j] * d[j])
    }
    d[i] <- b[i] - soma
  }            #### FIM CALCULO DO d

  X[n] <- d[n]/ U[n,n]

  for(i in (n-1):1)
  {
    soma <-0
    for(j in (i+1):n)
    {
      soma <- soma + (U[i,j] * X[j])
    }
    X[i] <- (d[i] - soma)/ U[i,i]
  }

}

#LUP(c(1,-2,4,-3,8,-6,2,-1,5) , c(11,-15,-29) )
