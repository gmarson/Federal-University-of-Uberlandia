%{
	open Ast
	open Sast
%}

%token <int * int * token list> Linha 
%token <float * Lexing.position> LITFLOAT
%token <string *Lexing.position > ID
%token <string *Lexing.position > LITSTRING
%token <int * Lexing.position> LITINT
%token <bool * Lexing.position>   LITBOOL
%token <Lexing.position> DEF SETA DPONTOS 
%token <Lexing.position> VIRG
%token <Lexing.position> ATRIB MAIOR MAIORIGUAL MENOR MENORIGUAL DIFERENTE IGUALDADE
%token <Lexing.position> OU E NOT MAIS MENOS DIVIDIDO VEZES MODULO
%token <Lexing.position> APAR FPAR
%token <Lexing.position> PRINT
%token <Lexing.position> INPUTI INPUTF INPUTS
%token <Lexing.position> WHILE FOR IN RANGE
%token <Lexing.position> IF ELIF ELSE 
%token <Lexing.position> RETURN
%token <Lexing.position> NONE
%token <Lexing.position> STR
%token <Lexing.position> INT
%token <Lexing.position> FLOAT
%token <Lexing.position> BOOL
%token INDENTA DEDENTA NOVALINHA EOF

%left OU 
%left E
%left IGUALDADE DIFERENTE
%left MAIOR MAIORIGUAL MENOR MENORIGUAL
%left MAIS MENOS
%left VEZES DIVIDIDO MODULO

%nonassoc unary_minus

%start <Sast.expressao Ast.programa> programa

%%
   
programa: ins=instrucao*  
     EOF 
     {Programa ins }

funcao:
   	 DEF nome= ID
   	 APAR args = separated_list(VIRG, parametro) FPAR
   	 SETA retorno = tipo DPONTOS NOVALINHA 
   	 INDENTA
   	 cmd = comandos 
   	 DEDENTA 
   	 {
   	 	Funcao {
   	 		fn_nome = nome;
   	 		fn_tiporet = retorno;
   	 		fn_formais = args;
   	 		fn_corpo = cmd
   	 	}
   	 } 
   	
 
parametro:
    |  id = ID  DPONTOS tp = tipo { (id,tp) }
	 

 /*esse eh o meu stm_block */
instrucao:	
	| func = funcao  		  	{     func 	}
	| cmd = comando 		{ ACMD(cmd) }
	

comandos:
	cmd = comando+ { cmd }

/*esse eh o meu stm_list*/
comando:
	| stm = atribuicao 					{ stm }
	| stm = chamadafuncao   			{ stm }
	| stm = loopWhile					{ stm }
	| stm = condicaoIF      			{ stm } 
	| stm = loopFOR 					{ stm }	
	| stm = print 						{ stm }
	| stm = retorno 					{ stm } 
	| stm = leiai NOVALINHA 			{ stm }
 	| stm = leiaf NOVALINHA  			{ stm }
 	| stm = leias NOVALINHA  			{ stm }
 	;

retorno:
	| RETURN expr = exprLogicoAritmetica? NOVALINHA  { RETORNO(expr) }
	;

print:
   	| PRINT exprla = exprLogicoAritmetica NOVALINHA {PRINT(exprla) }
	;
/*a sacada eh emcapsular tudo dentro de expressao*/

chamadafuncao:
	| exp=chamada NOVALINHA  { CHAMADADEFUNCAO(exp) }
	;

chamada : nome=ID APAR args=separated_list(VIRG, exprLogicoAritmetica) FPAR { EXPCALL (nome, args) }
	
condicaoIF:
	| IF exprla= exprLogicoAritmetica  DPONTOS NOVALINHA 
		INDENTA stm=comandos DEDENTA
	 	cee = condicaoELIFELSE?
			{ CONDICAOIF(exprla,stm,cee) }
   	

condicaoELIFELSE:
	| ELIF exprla = exprLogicoAritmetica DPONTOS NOVALINHA INDENTA stm = comandos DEDENTA condEE = condicaoELIFELSE? { CONDICAOIF (exprla,stm, condEE) }
	| ELSE DPONTOS NOVALINHA INDENTA stm=comandos DEDENTA {CONDICAOElifElse( stm ) }
	;
 
atribuicao: id = ID ATRIB exprla = exprLogicoAritmetica NOVALINHA   { ATRIBUICAO (EXPVAR id , exprla) } 

leiai: INPUTI exp=exprLogicoAritmetica  { LEIAI exp }
leiaf: INPUTF exp=exprLogicoAritmetica  { LEIAF exp }
leias: INPUTS exp=exprLogicoAritmetica  { LEIAS exp }

loopFOR:
	| FOR expid=exprLogicoAritmetica IN RANGE APAR exprcomeco = exprLogicoAritmetica VIRG exprfim = exprLogicoAritmetica FPAR DPONTOS NOVALINHA INDENTA stm = comandos DEDENTA 	{ FORLOOP(expid,exprcomeco,exprfim,stm)}
	;

loopWhile: WHILE exprla = exprLogicoAritmetica DPONTOS NOVALINHA INDENTA stm = comandos DEDENTA	{ WHILELOOP(exprla,stm) }	

exprLogicoAritmetica:
	| f = chamada 												 { f 				 }
	| id = ID 													 { EXPVAR(id)    	 }
	| i = LITINT 												 { EXPINT(i)   		 }
	| s = LITSTRING 											 { EXPSTRING(s)		 }
	| f = LITFLOAT 												 { EXPFLOAT(f) 	  	 }
	| b = LITBOOL												 { EXPBOOL (b)	 }	
	| op=opU e=exprLogicoAritmetica %prec unary_minus 			 { EXPOPU (op,e) 	 }
	| e1=exprLogicoAritmetica op = opB e2 = exprLogicoAritmetica { EXPOPB (op,e1,e2) }
	| APAR e=exprLogicoAritmetica FPAR 							 { e 		    	 }
	;

tipo:
	| BOOL 			{ BOOLEAN 	}
	| INT 			{ INTEIRO 	}
	| FLOAT 		{ REAL 		}
	| NONE 			{ NONE 		}
	| STR           { STRING 	}
	;

%inline opB:
   | pos = MAIS  					{ (ADICAO, pos)	}
   | pos = MENOS  					{ (SUBTRACAO,	pos)	}
   | pos = VEZES  					{ (MULTIPLICACAO,pos)	}
   | pos = DIVIDIDO  				{ (DIVISAO, pos)		}
   | pos = MODULO					{ (MOD, 	pos)		}
   | pos = IGUALDADE  				{ (EHIGUAL, pos)		}
   | pos = MAIOR  					{ (MAIORQ, 	pos)	}
   | pos = MAIORIGUAL				{ (MAIORIGUALQ, pos)	}
   | pos = MENOR 					{ (MENORQ, 	pos)	}
   | pos = MENORIGUAL 				{ (MENORIGUALQ,	pos)}
   | pos = DIFERENTE 				{ (EHDIFERENTE, pos)	}	 
   | pos = E 						{ (AND, 	pos)		}
   | pos = OU						{ (OR, 		pos)	}	
   ;

%inline opU:
	| pos = NOT 	{ (NEGACAO, pos) 		}
	| pos = MENOS 	{ (SUBTRACAO, pos ) }
	;



	
