open Ast

type expressao =
			 EXPOPB of operador pos * expressao * expressao
			| EXPOPU of operador pos * expressao
			| EXPVAR of identificador pos
			| EXPINT of int pos
			| EXPSTRING of string pos
			| EXPFLOAT of float pos 
			| EXPBOOL of bool pos
			| EXPCALL of identificador pos * (expressao expressoes)
				

