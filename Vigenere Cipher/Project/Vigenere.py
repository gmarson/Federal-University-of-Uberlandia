class Vigenere:
	LETTERS = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ'
	key = ""

	def __init__(self, key):
		self.key = key
	
	def encryptMessage(self,message) -> str:
		return self.translateMessage(message, 'encrypt')

	def decryptMessage(self,message) -> str:
		return self.translateMessage(message, 'decrypt')

	def translateMessage(self, message, mode) -> str:
		translated = []

		keyIndex = 0
		self.key = self.key.upper()

		for symbol in message:
			num = self.LETTERS.find(symbol.upper()) # return the position symbol is on letter
			if num != -1:
				if mode == 'encrypt':
					num += self.LETTERS.find(self.key[keyIndex]) #add if encrypting
				elif mode == 'decrypt':
					num -= self.LETTERS.find(self.key[keyIndex]) #subtract if decrypting

				num %= len(self.LETTERS) ## handle the potential wrap-around	

				if symbol.isupper():
					translated.append(self.LETTERS[num])
				elif symbol.islower():
					translated.append(self.LETTERS[num].lower())

				keyIndex+=1
				if keyIndex == len(self.key):
					keyIndex =0
			else:
				translated.append(symbol)

		return "".join(translated)






