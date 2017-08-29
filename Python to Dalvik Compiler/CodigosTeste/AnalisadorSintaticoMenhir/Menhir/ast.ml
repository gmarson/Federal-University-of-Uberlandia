(* The type of the abstract syntax tree (AST). *)

type identificador = string 
(*posicao no arquivo*)
type 'a pos = 'a * Lexing.position

type 'expr programa = Programa of 'expr instrucoes
and 'expr comandos = 'expr comando list
and 'expr instrucoes = 'expr instrucao list
and 'expr expressoes = 'expr list
and 'expr instrucao = 
	Funcao of 'expr decfn 
	| ACMD of 'expr comando 
and 'expr decfn = {
	fn_nome: identificador pos;
	fn_tiporet: tipo;
	fn_formais: (identificador pos * tipo) list;
	fn_corpo: 'expr comandos
}	  

and tipo = 
			  BOOLEAN
			| INTEIRO
			| REAL
			| NONE
			| STRING
  
and 'expr comando = 
				  ATRIBUICAO of 'expr * 'expr
				| CONDICAOIF of 'expr * ('expr comando) list * ('expr comando option)
				| CONDICAOElifElse of 'expr comandos
				| WHILELOOP of 'expr * ('expr comando) list
				| FORLOOP of 'expr * 'expr * 'expr * ('expr comando) list 
				| PRINT of 'expr 
				| RETORNO of 'expr option
				| LEIAI of 'expr
				| LEIAF of 'expr
				| LEIAS of 'expr
				| CHAMADADEFUNCAO of 'expr

and operador =  
				 ADICAO  					
			   | SUBTRACAO  				
			   | MULTIPLICACAO  				
			   | DIVISAO  				
			   | MOD					
			   | EHIGUAL  			
			   | MAIORQ  				
			   | MAIORIGUALQ				
			   | MENORQ					
			   | MENORIGUALQ 			
			   | EHDIFERENTE 				
			   | AND 						   
			   | OR	
			   | NEGACAO

			 

