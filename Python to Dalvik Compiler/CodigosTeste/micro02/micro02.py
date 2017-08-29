def micro02():
	num1, num2 = 0 , 0
	print("Digite o primeiro numero: ")
	num1 = int(input())
	print("Digite o segundo numero: ")
	num2 = int(input())
	
	if num1 > num2:
		print("O primeiro numero "+str(num1)+" e maior que o segundo "+str(num2),end="")
	else:
		print("O segundo numero "+str(num2)+" e maior que o primeiro "+str(num1),end="")
	

micro02()