import binascii

class FileManager:
	encodeMode = 'ascii'

	def toHex(self,message) -> str:
		hexMessage = binascii.hexlify(message.encode(self.encodeMode))
		return str(hexMessage, self.encodeMode)
		

	def writeOnFile(self,string,fileName):
		text_file = open(fileName, "w+")
		text_file.write(string)
		text_file.close()


	def readFromFile(self,fileName) -> str:
		text_file = open(fileName, "r") 
		message = text_file.read()
		text_file.close()
		return message

	def fromHex(self, message) -> str:
		decodedMessage = binascii.unhexlify(message)
		return str(decodedMessage, self.encodeMode)