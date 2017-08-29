def micro04():
	x,num,intervalo = 0,0,0

	for x in range(5):
		print("Digite o numero: ",end="")
		num = int(input())
		if num >=10:
			if num <=150:
				intervalo = intervalo +1

	print("Ao total, foram digitados "+str(intervalo)+" numeros no intervalo entre 10 e 150")

micro04()