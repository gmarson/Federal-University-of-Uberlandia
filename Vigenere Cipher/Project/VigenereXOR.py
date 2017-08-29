class VigenereXOR:
	key = ""

	def __init__(self, key):
		self.key = key.lower()
	
	def encryptMessage(self,message) -> str:
		return self.translateMessage(message, 'encrypt')

	def decryptMessage(self,message) -> str:
		return self.translateMessage(message, 'decrypt')

	def translateMessage(self, message, mode) -> str:	
		output = ""
		for i, character in enumerate(message):
			output += chr(ord(character) ^ ord(self.key[i % len(self.key)]))
		return output
