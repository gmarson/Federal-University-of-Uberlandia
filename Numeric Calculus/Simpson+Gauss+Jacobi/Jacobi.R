#A <- c(10,2,1,3,8,1,-2,-1,5)
#b<- c(57,20,-4)

A<-c(0.5,1,0.4,0.6,1,-0.4,0.3,1,1)
b<- c(0.2,0,-0.6)




#x_ant<-c(5.7,2.5,-0.8) #começa como x0. É O X INICIAL, PODE SER ESTIPULADO 
x_prox<-0
n <- sqrt(length(A))
m <- n
A<-matrix(A,m,n)
soma <-0

for(i in 1:nrow(A))
{
  x_ant[i] <- b[i]/A[i,i]
}

diagonalPositiva<-0

kMAX<-50
erro<- (10^(-5))
e<-1
k<-0 #Iteração inicial
aux<-0

D <- matrix( data = 0:0, nrow = m, ncol = n)
E <- matrix( data = 0:0, nrow = m, ncol = n)
f <- matrix( data = 0:0, nrow = m, ncol = n)
J <- 0

while(erro < e && k < kMAX)
{
  for(i in 1:n)
  {
    aux <- 0
    for(j in 1:n)
    {
      if(i!=j)  aux<-aux + A[i,j] * x_ant[j]  
    }
    x_prox[i]<- 1/A[i,i] * (b[i]-aux)
    
  }

  cat("K: ",k,"\n")
  cat("x_ant : ",x_ant,"\n")
  cat("x_prox : ",x_prox,"\n")
  
  k <- k+1    
  e = max(abs(x_prox -  x_ant)) / max(abs(x_prox))
  
  cat("erro ",e,"\n")
  
  x_ant <- x_prox
  cat("\n\n")
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

d<-solve(D)
j<-(-d)%*%(E+f)
J<-eigen(j)$values #dando numero complexo
J<-abs(J)
ifelse( max(J)>1,"Não converge","Converge")	
cat("P(J): ",max(J))
cat("Resultado: ",x_prox," com erro = ",e,"e k = ", k)

