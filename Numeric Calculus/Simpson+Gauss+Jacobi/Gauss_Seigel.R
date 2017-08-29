
#A <- c(10,2,1,3,8,1,-2,-1,5)
#b<- c(57,20,-4)

A<-c(0.5,1,0.4,0.6,1,-0.4,0.3,1,1)
b<- c(0.2,0,-0.6)



#x_ant<-c(5.7,2.5,-0.8) #começa como x0
x_prox<- c()
n <- sqrt(length(A))
m <- n
A<-matrix(A,m,n)

for(i in 1:nrow(A))
{
  x_ant[i] <- b[i]/A[i,i]
}


diagonalPositiva<-0

kMAX<-50
erro<- (10^(-5))
e <- 1
k <- 0 #numero de iteração inicial

aux <-0
aux2 <-0
soma <-0

D<-matrix( data = 0:0, nrow = m, ncol = n)
E<-matrix( data = 0:0, nrow = m, ncol = n)
f<-matrix( data = 0:0, nrow = m, ncol = n)
S<-0

for(k in 1:kMAX)
{
  for(i in 1:n)
  {
    aux1 <- 0
    aux2 <- 0
    
    if(i>=2)
    {
      for(j in 1:(i-1))
      {
        aux1 <- aux1 + A[i,j]*x_prox[j]
        
      }
    }
    if((i+1)<=n)
    {
      for(j in (i+1):n)
      {
        aux2 <- aux2 + A[i,j]*x_ant[j]
      }
    }
    x_prox[i] <- (b[i] - aux1 - aux2)/A[i,i]
  }
  erro <- max(abs(x_prox-x_ant))/max(abs(x_prox))
  #x recebe o x1, pra continuar fazer x k+1 - x k
  x_ant <- x_prox
  if(erro < 10^(-5))
  {
    break
  }
  
}

#Montando D
for(i in 1:n)
{
  D[i,i] = A[i,i]
}

#Montando E
for(i in 1:(n-1))
{
  for(j in 2:n)
  {
    if(i!=j) E[j,i]=A[j,i] 
  }
}
# Montando F
for(i in 1:(n-1))
{
  for(j in 2:n)
  {
    if(i!=j)f[i,j]=A[i,j] 
  }
}

#Verificação de estritamente positiva
for(i in 1:n)
{
  for(j in 1:n)
  {
    soma<- soma + abs(A[i,j])
  }
  if(A[i,i]>soma)diagonalPositiva=1
  soma<-0		 	
}
ifelse(diagonalPositiva==1,"é estritamente diagonal positiva","não é estritamente diagonal positiva")	

soma<-D+E
soma<-solve(soma)
s<-(-soma)%*%(f)
S<-eigen(s)$values #dando numero complexo
S<-abs(S)
ifelse( max(S)>1,"Não converge","Converge")	
cat("P(S) = ", max(S))
cat("Resultado: ",x_prox," com erro = ",erro,"e k = ", k)

