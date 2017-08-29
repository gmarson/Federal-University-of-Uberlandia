open Ast

type expressao = 	
			  EXPOPB of (operador * tipo) * (expressao * tipo)  * (expressao * tipo)
			| EXPOPU of (operador * tipo) * (expressao * tipo)
			| EXPCALL of identificador * (expressao expressoes) * tipo
			| EXPINT of int * tipo
			| EXPSTRING of string * tipo
			| EXPFLOAT of float * tipo
			| EXPBOOL of bool * tipo
			| EXPVAR of identificador *  tipo
			| EXPNONE
			
						 
