from FileManager import *
from Vigenere import *
from VigenereXOR import *

myMessage =  "Amigos envolvidos em projeto de jovem sumido no Acre fizeram pacto de sigilo diz delegado Delegado disse ainda nao descartar que jovem tenha usado celulares com numeros diferentes para nao ser localizado Bruno Borges esta desaparecido desde o ultimo dia 27 de marco"
myKey = 'acre'
myMode = 'decrypt'

#vigenere = Vigenere(myKey)
vigenere = VigenereXOR(myKey)
fileManager = FileManager()


def main():

	if myMode == 'encrypt':
		messageFromFile = fileManager.fromHex(fileManager.readFromFile('message.txt'))
		messsage = vigenere.encryptMessage(messageFromFile)
		fileManager.writeOnFile(fileManager.toHex(messsage),'encryptedMessage.txt')
	if myMode == 'decrypt':
		messageFromFile = fileManager.fromHex(fileManager.readFromFile('encryptedMessage.txt'))
		messsage = vigenere.decryptMessage(messageFromFile)
		fileManager.writeOnFile(fileManager.toHex(messsage),'message.txt')


	print('%sed message:' % (myMode.title()))
	print(messsage)



	fileManager.toHex(messsage)


def createFileWithHexMessage():
	message = fileManager.toHex(myMessage)
	fileManager.writeOnFile(message,'message.txt')


if __name__ == '__main__':
	#createFileWithHexMessage()
	
	main()