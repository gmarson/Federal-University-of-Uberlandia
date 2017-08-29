prog: DEF ID APAR FPAR SETA STR DPONTOS NOVALINHA INDENTA VIRG 
##
## Ends in an error in state: 156.
##
## defs -> DEF ID APAR list(parametro) FPAR SETA tiposPrimitivos DPONTOS NOVALINHA INDENTA . nonempty_list(statements) DEDENTA [ WHILE RETURN PRINT INPUT IF ID FOR EOF DEF ]
##
## The known suffix of the stack is as follows:
## DEF ID APAR list(parametro) FPAR SETA tiposPrimitivos DPONTOS NOVALINHA INDENTA 
##

<esperava declaracao ou expressao>

prog: DEF ID APAR FPAR SETA STR DPONTOS NOVALINHA WHILE 
##
## Ends in an error in state: 155.
##
## defs -> DEF ID APAR list(parametro) FPAR SETA tiposPrimitivos DPONTOS NOVALINHA . INDENTA nonempty_list(statements) DEDENTA [ WHILE RETURN PRINT INPUT IF ID FOR EOF DEF ]
##
## The known suffix of the stack is as follows:
## DEF ID APAR list(parametro) FPAR SETA tiposPrimitivos DPONTOS NOVALINHA 
##

<erro de indentacao>

prog: DEF ID APAR FPAR SETA STR DPONTOS WHILE 
##
## Ends in an error in state: 154.
##
## defs -> DEF ID APAR list(parametro) FPAR SETA tiposPrimitivos DPONTOS . NOVALINHA INDENTA nonempty_list(statements) DEDENTA [ WHILE RETURN PRINT INPUT IF ID FOR EOF DEF ]
##
## The known suffix of the stack is as follows:
## DEF ID APAR list(parametro) FPAR SETA tiposPrimitivos DPONTOS 
##

<esperava nova linha>

prog: DEF ID APAR FPAR SETA STR WHILE 
##
## Ends in an error in state: 153.
##
## defs -> DEF ID APAR list(parametro) FPAR SETA tiposPrimitivos . DPONTOS NOVALINHA INDENTA nonempty_list(statements) DEDENTA [ WHILE RETURN PRINT INPUT IF ID FOR EOF DEF ]
##
## The known suffix of the stack is as follows:
## DEF ID APAR list(parametro) FPAR SETA tiposPrimitivos 
##

<esperava dois pontos>

prog: DEF ID APAR FPAR SETA WHILE 
##
## Ends in an error in state: 152.
##
## defs -> DEF ID APAR list(parametro) FPAR SETA . tiposPrimitivos DPONTOS NOVALINHA INDENTA nonempty_list(statements) DEDENTA [ WHILE RETURN PRINT INPUT IF ID FOR EOF DEF ]
##
## The known suffix of the stack is as follows:
## DEF ID APAR list(parametro) FPAR SETA 
##

<esperava tipo apos seta>

prog: DEF ID APAR FPAR WHILE 
##
## Ends in an error in state: 151.
##
## defs -> DEF ID APAR list(parametro) FPAR . SETA tiposPrimitivos DPONTOS NOVALINHA INDENTA nonempty_list(statements) DEDENTA [ WHILE RETURN PRINT INPUT IF ID FOR EOF DEF ]
##
## The known suffix of the stack is as follows:
## DEF ID APAR list(parametro) FPAR 
##

<esperava seta>

prog: DEF ID APAR ID DPONTOS BOOL VIRG WHILE 
##
## Ends in an error in state: 148.
##
## list(parametro) -> parametro . list(parametro) [ FPAR ]
##
## The known suffix of the stack is as follows:
## parametro 
##

<esperava variavel e tipo como argumento>

prog: DEF ID APAR ID DPONTOS STR WHILE 
##
## Ends in an error in state: 146.
##
## parametro -> ID DPONTOS tiposPrimitivos . option(VIRG) [ ID FPAR ]
##
## The known suffix of the stack is as follows:
## ID DPONTOS tiposPrimitivos 
##

<esperava virgula>

prog: DEF ID APAR ID DPONTOS WHILE 
##
## Ends in an error in state: 140.
##
## parametro -> ID DPONTOS . tiposPrimitivos option(VIRG) [ ID FPAR ]
##
## The known suffix of the stack is as follows:
## ID DPONTOS 
##

<esperava tipo de variavel>

prog: DEF ID APAR ID WHILE 
##
## Ends in an error in state: 139.
##
## parametro -> ID . DPONTOS tiposPrimitivos option(VIRG) [ ID FPAR ]
##
## The known suffix of the stack is as follows:
## ID 
##

<esperava dois pontos e tipo de variavel>

prog: DEF ID APAR WHILE 
##
## Ends in an error in state: 138.
##
## defs -> DEF ID APAR . list(parametro) FPAR SETA tiposPrimitivos DPONTOS NOVALINHA INDENTA nonempty_list(statements) DEDENTA [ WHILE RETURN PRINT INPUT IF ID FOR EOF DEF ]
##
## The known suffix of the stack is as follows:
## DEF ID APAR 
##

<esperava variavel e tipo como argumentos>

prog: DEF ID WHILE 
##
## Ends in an error in state: 137.
##
## defs -> DEF ID . APAR list(parametro) FPAR SETA tiposPrimitivos DPONTOS NOVALINHA INDENTA nonempty_list(statements) DEDENTA [ WHILE RETURN PRINT INPUT IF ID FOR EOF DEF ]
##
## The known suffix of the stack is as follows:
## DEF ID 
##

<esperava parenteses>

prog: DEF WHILE 
##
## Ends in an error in state: 136.
##
## defs -> DEF . ID APAR list(parametro) FPAR SETA tiposPrimitivos DPONTOS NOVALINHA INDENTA nonempty_list(statements) DEDENTA [ WHILE RETURN PRINT INPUT IF ID FOR EOF DEF ]
##
## The known suffix of the stack is as follows:
## DEF 
##

<esperava identificador de funcao>

prog: FOR ID IN RANGE APAR TRUE FPAR DPONTOS NOVALINHA INDENTA VIRG 
##
## Ends in an error in state: 93.
##
## loopFOR -> FOR ID IN RANGE APAR exprLogicoAritmetica FPAR DPONTOS NOVALINHA INDENTA . nonempty_list(statements) DEDENTA [ WHILE RETURN PRINT INPUT IF ID FOR EOF DEF DEDENTA ]
##
## The known suffix of the stack is as follows:
## FOR ID IN RANGE APAR exprLogicoAritmetica FPAR DPONTOS NOVALINHA INDENTA 
##

<esperava declaracao ou expressao>

prog: FOR ID IN RANGE APAR TRUE FPAR DPONTOS NOVALINHA WHILE 
##
## Ends in an error in state: 92.
##
## loopFOR -> FOR ID IN RANGE APAR exprLogicoAritmetica FPAR DPONTOS NOVALINHA . INDENTA nonempty_list(statements) DEDENTA [ WHILE RETURN PRINT INPUT IF ID FOR EOF DEF DEDENTA ]
##
## The known suffix of the stack is as follows:
## FOR ID IN RANGE APAR exprLogicoAritmetica FPAR DPONTOS NOVALINHA 
##

<erro de indentacao>

prog: FOR ID IN RANGE APAR TRUE FPAR DPONTOS WHILE 
##
## Ends in an error in state: 91.
##
## loopFOR -> FOR ID IN RANGE APAR exprLogicoAritmetica FPAR DPONTOS . NOVALINHA INDENTA nonempty_list(statements) DEDENTA [ WHILE RETURN PRINT INPUT IF ID FOR EOF DEF DEDENTA ]
##
## The known suffix of the stack is as follows:
## FOR ID IN RANGE APAR exprLogicoAritmetica FPAR DPONTOS 
##

<esperava nova linha>

prog: FOR ID IN RANGE APAR TRUE FPAR WHILE 
##
## Ends in an error in state: 90.
##
## loopFOR -> FOR ID IN RANGE APAR exprLogicoAritmetica FPAR . DPONTOS NOVALINHA INDENTA nonempty_list(statements) DEDENTA [ WHILE RETURN PRINT INPUT IF ID FOR EOF DEF DEDENTA ]
##
## The known suffix of the stack is as follows:
## FOR ID IN RANGE APAR exprLogicoAritmetica FPAR 
##

<esperava dois pontos>

prog: FOR ID IN RANGE APAR TRUE WHILE 
##
## Ends in an error in state: 89.
##
## exprLogicoAritmetica -> exprLogicoAritmetica . MAIS exprLogicoAritmetica [ VEZES OU MODULO MENOS MENORIGUAL MENOR MAIS MAIORIGUAL MAIOR IGUALDADE FPAR E DIVIDIDO DIFERENTE ]
## exprLogicoAritmetica -> exprLogicoAritmetica . MENOS exprLogicoAritmetica [ VEZES OU MODULO MENOS MENORIGUAL MENOR MAIS MAIORIGUAL MAIOR IGUALDADE FPAR E DIVIDIDO DIFERENTE ]
## exprLogicoAritmetica -> exprLogicoAritmetica . VEZES exprLogicoAritmetica [ VEZES OU MODULO MENOS MENORIGUAL MENOR MAIS MAIORIGUAL MAIOR IGUALDADE FPAR E DIVIDIDO DIFERENTE ]
## exprLogicoAritmetica -> exprLogicoAritmetica . DIVIDIDO exprLogicoAritmetica [ VEZES OU MODULO MENOS MENORIGUAL MENOR MAIS MAIORIGUAL MAIOR IGUALDADE FPAR E DIVIDIDO DIFERENTE ]
## exprLogicoAritmetica -> exprLogicoAritmetica . MODULO exprLogicoAritmetica [ VEZES OU MODULO MENOS MENORIGUAL MENOR MAIS MAIORIGUAL MAIOR IGUALDADE FPAR E DIVIDIDO DIFERENTE ]
## exprLogicoAritmetica -> exprLogicoAritmetica . IGUALDADE exprLogicoAritmetica [ VEZES OU MODULO MENOS MENORIGUAL MENOR MAIS MAIORIGUAL MAIOR IGUALDADE FPAR E DIVIDIDO DIFERENTE ]
## exprLogicoAritmetica -> exprLogicoAritmetica . MAIOR exprLogicoAritmetica [ VEZES OU MODULO MENOS MENORIGUAL MENOR MAIS MAIORIGUAL MAIOR IGUALDADE FPAR E DIVIDIDO DIFERENTE ]
## exprLogicoAritmetica -> exprLogicoAritmetica . MAIORIGUAL exprLogicoAritmetica [ VEZES OU MODULO MENOS MENORIGUAL MENOR MAIS MAIORIGUAL MAIOR IGUALDADE FPAR E DIVIDIDO DIFERENTE ]
## exprLogicoAritmetica -> exprLogicoAritmetica . MENOR exprLogicoAritmetica [ VEZES OU MODULO MENOS MENORIGUAL MENOR MAIS MAIORIGUAL MAIOR IGUALDADE FPAR E DIVIDIDO DIFERENTE ]
## exprLogicoAritmetica -> exprLogicoAritmetica . MENORIGUAL exprLogicoAritmetica [ VEZES OU MODULO MENOS MENORIGUAL MENOR MAIS MAIORIGUAL MAIOR IGUALDADE FPAR E DIVIDIDO DIFERENTE ]
## exprLogicoAritmetica -> exprLogicoAritmetica . DIFERENTE exprLogicoAritmetica [ VEZES OU MODULO MENOS MENORIGUAL MENOR MAIS MAIORIGUAL MAIOR IGUALDADE FPAR E DIVIDIDO DIFERENTE ]
## exprLogicoAritmetica -> exprLogicoAritmetica . E exprLogicoAritmetica [ VEZES OU MODULO MENOS MENORIGUAL MENOR MAIS MAIORIGUAL MAIOR IGUALDADE FPAR E DIVIDIDO DIFERENTE ]
## exprLogicoAritmetica -> exprLogicoAritmetica . OU exprLogicoAritmetica [ VEZES OU MODULO MENOS MENORIGUAL MENOR MAIS MAIORIGUAL MAIOR IGUALDADE FPAR E DIVIDIDO DIFERENTE ]
## loopFOR -> FOR ID IN RANGE APAR exprLogicoAritmetica . FPAR DPONTOS NOVALINHA INDENTA nonempty_list(statements) DEDENTA [ WHILE RETURN PRINT INPUT IF ID FOR EOF DEF DEDENTA ]
##
## The known suffix of the stack is as follows:
## FOR ID IN RANGE APAR exprLogicoAritmetica 
##

<parenteses nao fechado>

prog: FOR ID IN RANGE APAR WHILE 
##
## Ends in an error in state: 88.
##
## loopFOR -> FOR ID IN RANGE APAR . exprLogicoAritmetica FPAR DPONTOS NOVALINHA INDENTA nonempty_list(statements) DEDENTA [ WHILE RETURN PRINT INPUT IF ID FOR EOF DEF DEDENTA ]
##
## The known suffix of the stack is as follows:
## FOR ID IN RANGE APAR 
##

<parenteses nao fechado>

prog: FOR ID IN RANGE WHILE 
##
## Ends in an error in state: 87.
##
## loopFOR -> FOR ID IN RANGE . APAR exprLogicoAritmetica FPAR DPONTOS NOVALINHA INDENTA nonempty_list(statements) DEDENTA [ WHILE RETURN PRINT INPUT IF ID FOR EOF DEF DEDENTA ]
##
## The known suffix of the stack is as follows:
## FOR ID IN RANGE 
##

<esperava expressao>

prog: FOR ID IN TRUE DPONTOS NOVALINHA INDENTA VIRG 
##
## Ends in an error in state: 111.
##
## loopFOR -> FOR ID IN exprLogicoAritmetica DPONTOS NOVALINHA INDENTA . nonempty_list(statements) DEDENTA [ WHILE RETURN PRINT INPUT IF ID FOR EOF DEF DEDENTA ]
##
## The known suffix of the stack is as follows:
## FOR ID IN exprLogicoAritmetica DPONTOS NOVALINHA INDENTA 
##

<esperava expressao ou declaracao>

prog: FOR ID IN TRUE DPONTOS NOVALINHA WHILE 
##
## Ends in an error in state: 110.
##
## loopFOR -> FOR ID IN exprLogicoAritmetica DPONTOS NOVALINHA . INDENTA nonempty_list(statements) DEDENTA [ WHILE RETURN PRINT INPUT IF ID FOR EOF DEF DEDENTA ]
##
## The known suffix of the stack is as follows:
## FOR ID IN exprLogicoAritmetica DPONTOS NOVALINHA 
##

<erro de indentacao>

prog: FOR ID IN TRUE DPONTOS WHILE 
##
## Ends in an error in state: 109.
##
## loopFOR -> FOR ID IN exprLogicoAritmetica DPONTOS . NOVALINHA INDENTA nonempty_list(statements) DEDENTA [ WHILE RETURN PRINT INPUT IF ID FOR EOF DEF DEDENTA ]
##
## The known suffix of the stack is as follows:
## FOR ID IN exprLogicoAritmetica DPONTOS 
##

<esperava nova linha>

prog: FOR ID IN TRUE WHILE 
##
## Ends in an error in state: 108.
##
## exprLogicoAritmetica -> exprLogicoAritmetica . MAIS exprLogicoAritmetica [ VEZES OU MODULO MENOS MENORIGUAL MENOR MAIS MAIORIGUAL MAIOR IGUALDADE E DPONTOS DIVIDIDO DIFERENTE ]
## exprLogicoAritmetica -> exprLogicoAritmetica . MENOS exprLogicoAritmetica [ VEZES OU MODULO MENOS MENORIGUAL MENOR MAIS MAIORIGUAL MAIOR IGUALDADE E DPONTOS DIVIDIDO DIFERENTE ]
## exprLogicoAritmetica -> exprLogicoAritmetica . VEZES exprLogicoAritmetica [ VEZES OU MODULO MENOS MENORIGUAL MENOR MAIS MAIORIGUAL MAIOR IGUALDADE E DPONTOS DIVIDIDO DIFERENTE ]
## exprLogicoAritmetica -> exprLogicoAritmetica . DIVIDIDO exprLogicoAritmetica [ VEZES OU MODULO MENOS MENORIGUAL MENOR MAIS MAIORIGUAL MAIOR IGUALDADE E DPONTOS DIVIDIDO DIFERENTE ]
## exprLogicoAritmetica -> exprLogicoAritmetica . MODULO exprLogicoAritmetica [ VEZES OU MODULO MENOS MENORIGUAL MENOR MAIS MAIORIGUAL MAIOR IGUALDADE E DPONTOS DIVIDIDO DIFERENTE ]
## exprLogicoAritmetica -> exprLogicoAritmetica . IGUALDADE exprLogicoAritmetica [ VEZES OU MODULO MENOS MENORIGUAL MENOR MAIS MAIORIGUAL MAIOR IGUALDADE E DPONTOS DIVIDIDO DIFERENTE ]
## exprLogicoAritmetica -> exprLogicoAritmetica . MAIOR exprLogicoAritmetica [ VEZES OU MODULO MENOS MENORIGUAL MENOR MAIS MAIORIGUAL MAIOR IGUALDADE E DPONTOS DIVIDIDO DIFERENTE ]
## exprLogicoAritmetica -> exprLogicoAritmetica . MAIORIGUAL exprLogicoAritmetica [ VEZES OU MODULO MENOS MENORIGUAL MENOR MAIS MAIORIGUAL MAIOR IGUALDADE E DPONTOS DIVIDIDO DIFERENTE ]
## exprLogicoAritmetica -> exprLogicoAritmetica . MENOR exprLogicoAritmetica [ VEZES OU MODULO MENOS MENORIGUAL MENOR MAIS MAIORIGUAL MAIOR IGUALDADE E DPONTOS DIVIDIDO DIFERENTE ]
## exprLogicoAritmetica -> exprLogicoAritmetica . MENORIGUAL exprLogicoAritmetica [ VEZES OU MODULO MENOS MENORIGUAL MENOR MAIS MAIORIGUAL MAIOR IGUALDADE E DPONTOS DIVIDIDO DIFERENTE ]
## exprLogicoAritmetica -> exprLogicoAritmetica . DIFERENTE exprLogicoAritmetica [ VEZES OU MODULO MENOS MENORIGUAL MENOR MAIS MAIORIGUAL MAIOR IGUALDADE E DPONTOS DIVIDIDO DIFERENTE ]
## exprLogicoAritmetica -> exprLogicoAritmetica . E exprLogicoAritmetica [ VEZES OU MODULO MENOS MENORIGUAL MENOR MAIS MAIORIGUAL MAIOR IGUALDADE E DPONTOS DIVIDIDO DIFERENTE ]
## exprLogicoAritmetica -> exprLogicoAritmetica . OU exprLogicoAritmetica [ VEZES OU MODULO MENOS MENORIGUAL MENOR MAIS MAIORIGUAL MAIOR IGUALDADE E DPONTOS DIVIDIDO DIFERENTE ]
## loopFOR -> FOR ID IN exprLogicoAritmetica . DPONTOS NOVALINHA INDENTA nonempty_list(statements) DEDENTA [ WHILE RETURN PRINT INPUT IF ID FOR EOF DEF DEDENTA ]
##
## The known suffix of the stack is as follows:
## FOR ID IN exprLogicoAritmetica 
##

<esperava dois pontos>

prog: FOR ID IN WHILE 
##
## Ends in an error in state: 86.
##
## loopFOR -> FOR ID IN . RANGE APAR exprLogicoAritmetica FPAR DPONTOS NOVALINHA INDENTA nonempty_list(statements) DEDENTA [ WHILE RETURN PRINT INPUT IF ID FOR EOF DEF DEDENTA ]
## loopFOR -> FOR ID IN . exprLogicoAritmetica DPONTOS NOVALINHA INDENTA nonempty_list(statements) DEDENTA [ WHILE RETURN PRINT INPUT IF ID FOR EOF DEF DEDENTA ]
##
## The known suffix of the stack is as follows:
## FOR ID IN 
##

<esperava expressao>

prog: FOR ID WHILE 
##
## Ends in an error in state: 85.
##
## loopFOR -> FOR ID . IN RANGE APAR exprLogicoAritmetica FPAR DPONTOS NOVALINHA INDENTA nonempty_list(statements) DEDENTA [ WHILE RETURN PRINT INPUT IF ID FOR EOF DEF DEDENTA ]
## loopFOR -> FOR ID . IN exprLogicoAritmetica DPONTOS NOVALINHA INDENTA nonempty_list(statements) DEDENTA [ WHILE RETURN PRINT INPUT IF ID FOR EOF DEF DEDENTA ]
##
## The known suffix of the stack is as follows:
## FOR ID 
##

<esperava in>

prog: FOR WHILE 
##
## Ends in an error in state: 84.
##
## loopFOR -> FOR . ID IN RANGE APAR exprLogicoAritmetica FPAR DPONTOS NOVALINHA INDENTA nonempty_list(statements) DEDENTA [ WHILE RETURN PRINT INPUT IF ID FOR EOF DEF DEDENTA ]
## loopFOR -> FOR . ID IN exprLogicoAritmetica DPONTOS NOVALINHA INDENTA nonempty_list(statements) DEDENTA [ WHILE RETURN PRINT INPUT IF ID FOR EOF DEF DEDENTA ]
##
## The known suffix of the stack is as follows:
## FOR 
##

<esperava variavel>

prog: FROM ID WHILE 
##
## Ends in an error in state: 4.
##
## comecoDeBloco -> option(addFROM) . IMPORT ID NOVALINHA [ WHILE RETURN PRINT INPUT IMPORT IF ID FROM FOR EOF DEF ]
##
## The known suffix of the stack is as follows:
## option(addFROM) 
##

<esperava import>

prog: FROM WHILE 
##
## Ends in an error in state: 1.
##
## addFROM -> FROM . ID [ IMPORT ]
##
## The known suffix of the stack is as follows:
## FROM 
##

<esperava identificador>

prog: ID APAR FPAR WHILE 
##
## Ends in an error in state: 103.
##
## statements -> chamadafuncao . NOVALINHA [ WHILE RETURN PRINT INPUT IF ID FOR EOF DEF DEDENTA ]
##
## The known suffix of the stack is as follows:
## chamadafuncao 
##

<esperava novalinha>

prog: ID APAR TRUE VIRG WHILE 
##
## Ends in an error in state: 56.
##
## separated_nonempty_list(VIRG,exprLogicoAritmetica) -> exprLogicoAritmetica VIRG . separated_nonempty_list(VIRG,exprLogicoAritmetica) [ FPAR ]
##
## The known suffix of the stack is as follows:
## exprLogicoAritmetica VIRG 
##

<esperava variavel ou tipo>

prog: ID APAR TRUE WHILE 
##
## Ends in an error in state: 55.
##
## exprLogicoAritmetica -> exprLogicoAritmetica . MAIS exprLogicoAritmetica [ VIRG VEZES OU MODULO MENOS MENORIGUAL MENOR MAIS MAIORIGUAL MAIOR IGUALDADE FPAR E DIVIDIDO DIFERENTE ]
## exprLogicoAritmetica -> exprLogicoAritmetica . MENOS exprLogicoAritmetica [ VIRG VEZES OU MODULO MENOS MENORIGUAL MENOR MAIS MAIORIGUAL MAIOR IGUALDADE FPAR E DIVIDIDO DIFERENTE ]
## exprLogicoAritmetica -> exprLogicoAritmetica . VEZES exprLogicoAritmetica [ VIRG VEZES OU MODULO MENOS MENORIGUAL MENOR MAIS MAIORIGUAL MAIOR IGUALDADE FPAR E DIVIDIDO DIFERENTE ]
## exprLogicoAritmetica -> exprLogicoAritmetica . DIVIDIDO exprLogicoAritmetica [ VIRG VEZES OU MODULO MENOS MENORIGUAL MENOR MAIS MAIORIGUAL MAIOR IGUALDADE FPAR E DIVIDIDO DIFERENTE ]
## exprLogicoAritmetica -> exprLogicoAritmetica . MODULO exprLogicoAritmetica [ VIRG VEZES OU MODULO MENOS MENORIGUAL MENOR MAIS MAIORIGUAL MAIOR IGUALDADE FPAR E DIVIDIDO DIFERENTE ]
## exprLogicoAritmetica -> exprLogicoAritmetica . IGUALDADE exprLogicoAritmetica [ VIRG VEZES OU MODULO MENOS MENORIGUAL MENOR MAIS MAIORIGUAL MAIOR IGUALDADE FPAR E DIVIDIDO DIFERENTE ]
## exprLogicoAritmetica -> exprLogicoAritmetica . MAIOR exprLogicoAritmetica [ VIRG VEZES OU MODULO MENOS MENORIGUAL MENOR MAIS MAIORIGUAL MAIOR IGUALDADE FPAR E DIVIDIDO DIFERENTE ]
## exprLogicoAritmetica -> exprLogicoAritmetica . MAIORIGUAL exprLogicoAritmetica [ VIRG VEZES OU MODULO MENOS MENORIGUAL MENOR MAIS MAIORIGUAL MAIOR IGUALDADE FPAR E DIVIDIDO DIFERENTE ]
## exprLogicoAritmetica -> exprLogicoAritmetica . MENOR exprLogicoAritmetica [ VIRG VEZES OU MODULO MENOS MENORIGUAL MENOR MAIS MAIORIGUAL MAIOR IGUALDADE FPAR E DIVIDIDO DIFERENTE ]
## exprLogicoAritmetica -> exprLogicoAritmetica . MENORIGUAL exprLogicoAritmetica [ VIRG VEZES OU MODULO MENOS MENORIGUAL MENOR MAIS MAIORIGUAL MAIOR IGUALDADE FPAR E DIVIDIDO DIFERENTE ]
## exprLogicoAritmetica -> exprLogicoAritmetica . DIFERENTE exprLogicoAritmetica [ VIRG VEZES OU MODULO MENOS MENORIGUAL MENOR MAIS MAIORIGUAL MAIOR IGUALDADE FPAR E DIVIDIDO DIFERENTE ]
## exprLogicoAritmetica -> exprLogicoAritmetica . E exprLogicoAritmetica [ VIRG VEZES OU MODULO MENOS MENORIGUAL MENOR MAIS MAIORIGUAL MAIOR IGUALDADE FPAR E DIVIDIDO DIFERENTE ]
## exprLogicoAritmetica -> exprLogicoAritmetica . OU exprLogicoAritmetica [ VIRG VEZES OU MODULO MENOS MENORIGUAL MENOR MAIS MAIORIGUAL MAIOR IGUALDADE FPAR E DIVIDIDO DIFERENTE ]
## separated_nonempty_list(VIRG,exprLogicoAritmetica) -> exprLogicoAritmetica . [ FPAR ]
## separated_nonempty_list(VIRG,exprLogicoAritmetica) -> exprLogicoAritmetica . VIRG separated_nonempty_list(VIRG,exprLogicoAritmetica) [ FPAR ]
##
## The known suffix of the stack is as follows:
## exprLogicoAritmetica 
##

<parenteses nao fechado>

prog: ID APAR WHILE 
##
## Ends in an error in state: 19.
##
## chamadafuncao -> ID APAR . option(chamadaArgs) FPAR [ VIRG VEZES OU NOVALINHA MODULO MENOS MENORIGUAL MENOR MAIS MAIORIGUAL MAIOR IGUALDADE FPAR E DPONTOS DIVIDIDO DIFERENTE ]
##
## The known suffix of the stack is as follows:
## ID APAR 
##

<esperava variavel ou tipo>

prog: ID ATRIB TRUE WHILE 
##
## Ends in an error in state: 82.
##
## atribuicao -> ID ATRIB exprLogicoAritmetica . NOVALINHA [ WHILE RETURN PRINT INPUT IF ID FOR EOF DEF DEDENTA ]
## exprLogicoAritmetica -> exprLogicoAritmetica . MAIS exprLogicoAritmetica [ VEZES OU NOVALINHA MODULO MENOS MENORIGUAL MENOR MAIS MAIORIGUAL MAIOR IGUALDADE E DIVIDIDO DIFERENTE ]
## exprLogicoAritmetica -> exprLogicoAritmetica . MENOS exprLogicoAritmetica [ VEZES OU NOVALINHA MODULO MENOS MENORIGUAL MENOR MAIS MAIORIGUAL MAIOR IGUALDADE E DIVIDIDO DIFERENTE ]
## exprLogicoAritmetica -> exprLogicoAritmetica . VEZES exprLogicoAritmetica [ VEZES OU NOVALINHA MODULO MENOS MENORIGUAL MENOR MAIS MAIORIGUAL MAIOR IGUALDADE E DIVIDIDO DIFERENTE ]
## exprLogicoAritmetica -> exprLogicoAritmetica . DIVIDIDO exprLogicoAritmetica [ VEZES OU NOVALINHA MODULO MENOS MENORIGUAL MENOR MAIS MAIORIGUAL MAIOR IGUALDADE E DIVIDIDO DIFERENTE ]
## exprLogicoAritmetica -> exprLogicoAritmetica . MODULO exprLogicoAritmetica [ VEZES OU NOVALINHA MODULO MENOS MENORIGUAL MENOR MAIS MAIORIGUAL MAIOR IGUALDADE E DIVIDIDO DIFERENTE ]
## exprLogicoAritmetica -> exprLogicoAritmetica . IGUALDADE exprLogicoAritmetica [ VEZES OU NOVALINHA MODULO MENOS MENORIGUAL MENOR MAIS MAIORIGUAL MAIOR IGUALDADE E DIVIDIDO DIFERENTE ]
## exprLogicoAritmetica -> exprLogicoAritmetica . MAIOR exprLogicoAritmetica [ VEZES OU NOVALINHA MODULO MENOS MENORIGUAL MENOR MAIS MAIORIGUAL MAIOR IGUALDADE E DIVIDIDO DIFERENTE ]
## exprLogicoAritmetica -> exprLogicoAritmetica . MAIORIGUAL exprLogicoAritmetica [ VEZES OU NOVALINHA MODULO MENOS MENORIGUAL MENOR MAIS MAIORIGUAL MAIOR IGUALDADE E DIVIDIDO DIFERENTE ]
## exprLogicoAritmetica -> exprLogicoAritmetica . MENOR exprLogicoAritmetica [ VEZES OU NOVALINHA MODULO MENOS MENORIGUAL MENOR MAIS MAIORIGUAL MAIOR IGUALDADE E DIVIDIDO DIFERENTE ]
## exprLogicoAritmetica -> exprLogicoAritmetica . MENORIGUAL exprLogicoAritmetica [ VEZES OU NOVALINHA MODULO MENOS MENORIGUAL MENOR MAIS MAIORIGUAL MAIOR IGUALDADE E DIVIDIDO DIFERENTE ]
## exprLogicoAritmetica -> exprLogicoAritmetica . DIFERENTE exprLogicoAritmetica [ VEZES OU NOVALINHA MODULO MENOS MENORIGUAL MENOR MAIS MAIORIGUAL MAIOR IGUALDADE E DIVIDIDO DIFERENTE ]
## exprLogicoAritmetica -> exprLogicoAritmetica . E exprLogicoAritmetica [ VEZES OU NOVALINHA MODULO MENOS MENORIGUAL MENOR MAIS MAIORIGUAL MAIOR IGUALDADE E DIVIDIDO DIFERENTE ]
## exprLogicoAritmetica -> exprLogicoAritmetica . OU exprLogicoAritmetica [ VEZES OU NOVALINHA MODULO MENOS MENORIGUAL MENOR MAIS MAIORIGUAL MAIOR IGUALDADE E DIVIDIDO DIFERENTE ]
##
## The known suffix of the stack is as follows:
## ID ATRIB exprLogicoAritmetica 
##

<esperava nova linha>

prog: ID ATRIB WHILE 
##
## Ends in an error in state: 81.
##
## atribuicao -> ID ATRIB . exprLogicoAritmetica NOVALINHA [ WHILE RETURN PRINT INPUT IF ID FOR EOF DEF DEDENTA ]
##
## The known suffix of the stack is as follows:
## ID ATRIB 
##

<esperava expressao>

prog: ID WHILE 
##
## Ends in an error in state: 80.
##
## atribuicao -> ID . ATRIB exprLogicoAritmetica NOVALINHA [ WHILE RETURN PRINT INPUT IF ID FOR EOF DEF DEDENTA ]
## chamadafuncao -> ID . APAR option(chamadaArgs) FPAR [ NOVALINHA ]
##
## The known suffix of the stack is as follows:
## ID 
##

<esperava parenteses>

prog: IF TRUE DPONTOS NOVALINHA INDENTA RETURN FALSE NOVALINHA DEDENTA ELIF TRUE DPONTOS NOVALINHA INDENTA RETURN FALSE NOVALINHA DEDENTA VIRG 
##
## Ends in an error in state: 132.
##
## list(condicaoELIF) -> condicaoELIF . list(condicaoELIF) [ WHILE RETURN PRINT INPUT IF ID FOR EOF ELSE DEF DEDENTA ]
##
## The known suffix of the stack is as follows:
## condicaoELIF 
##

<esperava expressao ou comando>

prog: IF TRUE DPONTOS NOVALINHA INDENTA RETURN FALSE NOVALINHA DEDENTA ELIF TRUE DPONTOS NOVALINHA INDENTA VIRG 
##
## Ends in an error in state: 120.
##
## condicaoELIF -> ELIF exprLogicoAritmetica DPONTOS NOVALINHA INDENTA . nonempty_list(statements) DEDENTA [ WHILE RETURN PRINT INPUT IF ID FOR EOF ELSE ELIF DEF DEDENTA ]
##
## The known suffix of the stack is as follows:
## ELIF exprLogicoAritmetica DPONTOS NOVALINHA INDENTA 
##

<esperava expressao ou comando>

prog: IF TRUE DPONTOS NOVALINHA INDENTA RETURN FALSE NOVALINHA DEDENTA ELIF TRUE DPONTOS NOVALINHA WHILE 
##
## Ends in an error in state: 119.
##
## condicaoELIF -> ELIF exprLogicoAritmetica DPONTOS NOVALINHA . INDENTA nonempty_list(statements) DEDENTA [ WHILE RETURN PRINT INPUT IF ID FOR EOF ELSE ELIF DEF DEDENTA ]
##
## The known suffix of the stack is as follows:
## ELIF exprLogicoAritmetica DPONTOS NOVALINHA 
##

<erro de indentacao>

prog: IF TRUE DPONTOS NOVALINHA INDENTA RETURN FALSE NOVALINHA DEDENTA ELIF TRUE DPONTOS WHILE 
##
## Ends in an error in state: 118.
##
## condicaoELIF -> ELIF exprLogicoAritmetica DPONTOS . NOVALINHA INDENTA nonempty_list(statements) DEDENTA [ WHILE RETURN PRINT INPUT IF ID FOR EOF ELSE ELIF DEF DEDENTA ]
##
## The known suffix of the stack is as follows:
## ELIF exprLogicoAritmetica DPONTOS 
##

<esperava nova linha>

prog: IF TRUE DPONTOS NOVALINHA INDENTA RETURN FALSE NOVALINHA DEDENTA ELIF TRUE WHILE 
##
## Ends in an error in state: 117.
##
## condicaoELIF -> ELIF exprLogicoAritmetica . DPONTOS NOVALINHA INDENTA nonempty_list(statements) DEDENTA [ WHILE RETURN PRINT INPUT IF ID FOR EOF ELSE ELIF DEF DEDENTA ]
## exprLogicoAritmetica -> exprLogicoAritmetica . MAIS exprLogicoAritmetica [ VEZES OU MODULO MENOS MENORIGUAL MENOR MAIS MAIORIGUAL MAIOR IGUALDADE E DPONTOS DIVIDIDO DIFERENTE ]
## exprLogicoAritmetica -> exprLogicoAritmetica . MENOS exprLogicoAritmetica [ VEZES OU MODULO MENOS MENORIGUAL MENOR MAIS MAIORIGUAL MAIOR IGUALDADE E DPONTOS DIVIDIDO DIFERENTE ]
## exprLogicoAritmetica -> exprLogicoAritmetica . VEZES exprLogicoAritmetica [ VEZES OU MODULO MENOS MENORIGUAL MENOR MAIS MAIORIGUAL MAIOR IGUALDADE E DPONTOS DIVIDIDO DIFERENTE ]
## exprLogicoAritmetica -> exprLogicoAritmetica . DIVIDIDO exprLogicoAritmetica [ VEZES OU MODULO MENOS MENORIGUAL MENOR MAIS MAIORIGUAL MAIOR IGUALDADE E DPONTOS DIVIDIDO DIFERENTE ]
## exprLogicoAritmetica -> exprLogicoAritmetica . MODULO exprLogicoAritmetica [ VEZES OU MODULO MENOS MENORIGUAL MENOR MAIS MAIORIGUAL MAIOR IGUALDADE E DPONTOS DIVIDIDO DIFERENTE ]
## exprLogicoAritmetica -> exprLogicoAritmetica . IGUALDADE exprLogicoAritmetica [ VEZES OU MODULO MENOS MENORIGUAL MENOR MAIS MAIORIGUAL MAIOR IGUALDADE E DPONTOS DIVIDIDO DIFERENTE ]
## exprLogicoAritmetica -> exprLogicoAritmetica . MAIOR exprLogicoAritmetica [ VEZES OU MODULO MENOS MENORIGUAL MENOR MAIS MAIORIGUAL MAIOR IGUALDADE E DPONTOS DIVIDIDO DIFERENTE ]
## exprLogicoAritmetica -> exprLogicoAritmetica . MAIORIGUAL exprLogicoAritmetica [ VEZES OU MODULO MENOS MENORIGUAL MENOR MAIS MAIORIGUAL MAIOR IGUALDADE E DPONTOS DIVIDIDO DIFERENTE ]
## exprLogicoAritmetica -> exprLogicoAritmetica . MENOR exprLogicoAritmetica [ VEZES OU MODULO MENOS MENORIGUAL MENOR MAIS MAIORIGUAL MAIOR IGUALDADE E DPONTOS DIVIDIDO DIFERENTE ]
## exprLogicoAritmetica -> exprLogicoAritmetica . MENORIGUAL exprLogicoAritmetica [ VEZES OU MODULO MENOS MENORIGUAL MENOR MAIS MAIORIGUAL MAIOR IGUALDADE E DPONTOS DIVIDIDO DIFERENTE ]
## exprLogicoAritmetica -> exprLogicoAritmetica . DIFERENTE exprLogicoAritmetica [ VEZES OU MODULO MENOS MENORIGUAL MENOR MAIS MAIORIGUAL MAIOR IGUALDADE E DPONTOS DIVIDIDO DIFERENTE ]
## exprLogicoAritmetica -> exprLogicoAritmetica . E exprLogicoAritmetica [ VEZES OU MODULO MENOS MENORIGUAL MENOR MAIS MAIORIGUAL MAIOR IGUALDADE E DPONTOS DIVIDIDO DIFERENTE ]
## exprLogicoAritmetica -> exprLogicoAritmetica . OU exprLogicoAritmetica [ VEZES OU MODULO MENOS MENORIGUAL MENOR MAIS MAIORIGUAL MAIOR IGUALDADE E DPONTOS DIVIDIDO DIFERENTE ]
##
## The known suffix of the stack is as follows:
## ELIF exprLogicoAritmetica 
##

<esperava dois pontos>

prog: IF TRUE DPONTOS NOVALINHA INDENTA RETURN FALSE NOVALINHA DEDENTA ELIF WHILE 
##
## Ends in an error in state: 116.
##
## condicaoELIF -> ELIF . exprLogicoAritmetica DPONTOS NOVALINHA INDENTA nonempty_list(statements) DEDENTA [ WHILE RETURN PRINT INPUT IF ID FOR EOF ELSE ELIF DEF DEDENTA ]
##
## The known suffix of the stack is as follows:
## ELIF 
##

<experava variavel ou expressao>

prog: IF TRUE DPONTOS NOVALINHA INDENTA RETURN FALSE NOVALINHA DEDENTA ELSE DPONTOS NOVALINHA INDENTA VIRG 
##
## Ends in an error in state: 127.
##
## condicaoELSE -> ELSE DPONTOS NOVALINHA INDENTA . nonempty_list(statements) DEDENTA [ WHILE RETURN PRINT INPUT IF ID FOR EOF DEF DEDENTA ]
##
## The known suffix of the stack is as follows:
## ELSE DPONTOS NOVALINHA INDENTA 
##

<esperava expressao ou declaracao>

prog: IF TRUE DPONTOS NOVALINHA INDENTA RETURN FALSE NOVALINHA DEDENTA ELSE DPONTOS NOVALINHA WHILE 
##
## Ends in an error in state: 126.
##
## condicaoELSE -> ELSE DPONTOS NOVALINHA . INDENTA nonempty_list(statements) DEDENTA [ WHILE RETURN PRINT INPUT IF ID FOR EOF DEF DEDENTA ]
##
## The known suffix of the stack is as follows:
## ELSE DPONTOS NOVALINHA 
##

<erro de indentacao>

prog: IF TRUE DPONTOS NOVALINHA INDENTA RETURN FALSE NOVALINHA DEDENTA ELSE DPONTOS WHILE 
##
## Ends in an error in state: 125.
##
## condicaoELSE -> ELSE DPONTOS . NOVALINHA INDENTA nonempty_list(statements) DEDENTA [ WHILE RETURN PRINT INPUT IF ID FOR EOF DEF DEDENTA ]
##
## The known suffix of the stack is as follows:
## ELSE DPONTOS 
##

<esperava nova linha>

prog: IF TRUE DPONTOS NOVALINHA INDENTA RETURN FALSE NOVALINHA DEDENTA ELSE WHILE 
##
## Ends in an error in state: 124.
##
## condicaoELSE -> ELSE . DPONTOS NOVALINHA INDENTA nonempty_list(statements) DEDENTA [ WHILE RETURN PRINT INPUT IF ID FOR EOF DEF DEDENTA ]
##
## The known suffix of the stack is as follows:
## ELSE 
##

<esperava dois pontos>

prog: IF TRUE DPONTOS NOVALINHA INDENTA RETURN FALSE NOVALINHA DEDENTA VIRG 
##
## Ends in an error in state: 115.
##
## condicaoIF -> IF exprLogicoAritmetica DPONTOS NOVALINHA INDENTA nonempty_list(statements) DEDENTA . list(condicaoELIF) option(condicaoELSE) [ WHILE RETURN PRINT INPUT IF ID FOR EOF DEF DEDENTA ]
##
## The known suffix of the stack is as follows:
## IF exprLogicoAritmetica DPONTOS NOVALINHA INDENTA nonempty_list(statements) DEDENTA 
##

<esperava def de funcao, expressao ou declaracao>

prog: IF TRUE DPONTOS NOVALINHA INDENTA VIRG 
##
## Ends in an error in state: 79.
##
## condicaoIF -> IF exprLogicoAritmetica DPONTOS NOVALINHA INDENTA . nonempty_list(statements) DEDENTA list(condicaoELIF) option(condicaoELSE) [ WHILE RETURN PRINT INPUT IF ID FOR EOF DEF DEDENTA ]
##
## The known suffix of the stack is as follows:
## IF exprLogicoAritmetica DPONTOS NOVALINHA INDENTA 
##

<esperava expressao ou declaracao>

prog: IF TRUE DPONTOS NOVALINHA WHILE 
##
## Ends in an error in state: 78.
##
## condicaoIF -> IF exprLogicoAritmetica DPONTOS NOVALINHA . INDENTA nonempty_list(statements) DEDENTA list(condicaoELIF) option(condicaoELSE) [ WHILE RETURN PRINT INPUT IF ID FOR EOF DEF DEDENTA ]
##
## The known suffix of the stack is as follows:
## IF exprLogicoAritmetica DPONTOS NOVALINHA 
##

<erro de indentacao>

prog: IF TRUE DPONTOS WHILE 
##
## Ends in an error in state: 77.
##
## condicaoIF -> IF exprLogicoAritmetica DPONTOS . NOVALINHA INDENTA nonempty_list(statements) DEDENTA list(condicaoELIF) option(condicaoELSE) [ WHILE RETURN PRINT INPUT IF ID FOR EOF DEF DEDENTA ]
##
## The known suffix of the stack is as follows:
## IF exprLogicoAritmetica DPONTOS 
##

<esperava nova linha>

prog: IF TRUE WHILE 
##
## Ends in an error in state: 76.
##
## condicaoIF -> IF exprLogicoAritmetica . DPONTOS NOVALINHA INDENTA nonempty_list(statements) DEDENTA list(condicaoELIF) option(condicaoELSE) [ WHILE RETURN PRINT INPUT IF ID FOR EOF DEF DEDENTA ]
## exprLogicoAritmetica -> exprLogicoAritmetica . MAIS exprLogicoAritmetica [ VEZES OU MODULO MENOS MENORIGUAL MENOR MAIS MAIORIGUAL MAIOR IGUALDADE E DPONTOS DIVIDIDO DIFERENTE ]
## exprLogicoAritmetica -> exprLogicoAritmetica . MENOS exprLogicoAritmetica [ VEZES OU MODULO MENOS MENORIGUAL MENOR MAIS MAIORIGUAL MAIOR IGUALDADE E DPONTOS DIVIDIDO DIFERENTE ]
## exprLogicoAritmetica -> exprLogicoAritmetica . VEZES exprLogicoAritmetica [ VEZES OU MODULO MENOS MENORIGUAL MENOR MAIS MAIORIGUAL MAIOR IGUALDADE E DPONTOS DIVIDIDO DIFERENTE ]
## exprLogicoAritmetica -> exprLogicoAritmetica . DIVIDIDO exprLogicoAritmetica [ VEZES OU MODULO MENOS MENORIGUAL MENOR MAIS MAIORIGUAL MAIOR IGUALDADE E DPONTOS DIVIDIDO DIFERENTE ]
## exprLogicoAritmetica -> exprLogicoAritmetica . MODULO exprLogicoAritmetica [ VEZES OU MODULO MENOS MENORIGUAL MENOR MAIS MAIORIGUAL MAIOR IGUALDADE E DPONTOS DIVIDIDO DIFERENTE ]
## exprLogicoAritmetica -> exprLogicoAritmetica . IGUALDADE exprLogicoAritmetica [ VEZES OU MODULO MENOS MENORIGUAL MENOR MAIS MAIORIGUAL MAIOR IGUALDADE E DPONTOS DIVIDIDO DIFERENTE ]
## exprLogicoAritmetica -> exprLogicoAritmetica . MAIOR exprLogicoAritmetica [ VEZES OU MODULO MENOS MENORIGUAL MENOR MAIS MAIORIGUAL MAIOR IGUALDADE E DPONTOS DIVIDIDO DIFERENTE ]
## exprLogicoAritmetica -> exprLogicoAritmetica . MAIORIGUAL exprLogicoAritmetica [ VEZES OU MODULO MENOS MENORIGUAL MENOR MAIS MAIORIGUAL MAIOR IGUALDADE E DPONTOS DIVIDIDO DIFERENTE ]
## exprLogicoAritmetica -> exprLogicoAritmetica . MENOR exprLogicoAritmetica [ VEZES OU MODULO MENOS MENORIGUAL MENOR MAIS MAIORIGUAL MAIOR IGUALDADE E DPONTOS DIVIDIDO DIFERENTE ]
## exprLogicoAritmetica -> exprLogicoAritmetica . MENORIGUAL exprLogicoAritmetica [ VEZES OU MODULO MENOS MENORIGUAL MENOR MAIS MAIORIGUAL MAIOR IGUALDADE E DPONTOS DIVIDIDO DIFERENTE ]
## exprLogicoAritmetica -> exprLogicoAritmetica . DIFERENTE exprLogicoAritmetica [ VEZES OU MODULO MENOS MENORIGUAL MENOR MAIS MAIORIGUAL MAIOR IGUALDADE E DPONTOS DIVIDIDO DIFERENTE ]
## exprLogicoAritmetica -> exprLogicoAritmetica . E exprLogicoAritmetica [ VEZES OU MODULO MENOS MENORIGUAL MENOR MAIS MAIORIGUAL MAIOR IGUALDADE E DPONTOS DIVIDIDO DIFERENTE ]
## exprLogicoAritmetica -> exprLogicoAritmetica . OU exprLogicoAritmetica [ VEZES OU MODULO MENOS MENORIGUAL MENOR MAIS MAIORIGUAL MAIOR IGUALDADE E DPONTOS DIVIDIDO DIFERENTE ]
##
## The known suffix of the stack is as follows:
## IF exprLogicoAritmetica 
##

<esperava dois pontos>

prog: IF WHILE 
##
## Ends in an error in state: 75.
##
## condicaoIF -> IF . exprLogicoAritmetica DPONTOS NOVALINHA INDENTA nonempty_list(statements) DEDENTA list(condicaoELIF) option(condicaoELSE) [ WHILE RETURN PRINT INPUT IF ID FOR EOF DEF DEDENTA ]
##
## The known suffix of the stack is as follows:
## IF 
##

<esperava variavel ou expressao>

prog: IMPORT ID NOVALINHA VIRG 
##
## Ends in an error in state: 165.
##
## list(comecoDeBloco) -> comecoDeBloco . list(comecoDeBloco) [ WHILE RETURN PRINT INPUT IF ID FOR EOF DEF ]
##
## The known suffix of the stack is as follows:
## comecoDeBloco 
##

<esperava import ou qualquer declaracao valida>

prog: IMPORT ID WHILE 
##
## Ends in an error in state: 6.
##
## comecoDeBloco -> option(addFROM) IMPORT ID . NOVALINHA [ WHILE RETURN PRINT INPUT IMPORT IF ID FROM FOR EOF DEF ]
##
## The known suffix of the stack is as follows:
## option(addFROM) IMPORT ID 
##

<esperava novalinha>

prog: IMPORT WHILE 
##
## Ends in an error in state: 5.
##
## comecoDeBloco -> option(addFROM) IMPORT . ID NOVALINHA [ WHILE RETURN PRINT INPUT IMPORT IF ID FROM FOR EOF DEF ]
##
## The known suffix of the stack is as follows:
## option(addFROM) IMPORT 
##

<esperava identificador>

prog: INPUT APAR FPAR WHILE 
##
## Ends in an error in state: 100.
##
## statements -> leia . NOVALINHA [ WHILE RETURN PRINT INPUT IF ID FOR EOF DEF DEDENTA ]
##
## The known suffix of the stack is as follows:
## leia 
##

<esperava nova linha>

prog: INPUT APAR WHILE 
##
## Ends in an error in state: 16.
##
## leia -> INPUT APAR . FPAR [ VIRG VEZES OU NOVALINHA MODULO MENOS MENORIGUAL MENOR MAIS MAIORIGUAL MAIOR IGUALDADE FPAR E DPONTOS DIVIDIDO DIFERENTE ]
##
## The known suffix of the stack is as follows:
## INPUT APAR 
##

<esperava fechamento de parenteses>

prog: INPUT WHILE 
##
## Ends in an error in state: 15.
##
## leia -> INPUT . APAR FPAR [ VIRG VEZES OU NOVALINHA MODULO MENOS MENORIGUAL MENOR MAIS MAIORIGUAL MAIOR IGUALDADE FPAR E DPONTOS DIVIDIDO DIFERENTE ]
##
## The known suffix of the stack is as follows:
## INPUT 
##

<esperava parenteses>

prog: PRINT APAR LITSTRING FPAR WHILE 
##
## Ends in an error in state: 73.
##
## print -> PRINT APAR LITSTRING option(VIRG) option(chamadaArgs) FPAR . NOVALINHA [ WHILE RETURN PRINT INPUT IF ID FOR EOF DEF DEDENTA ]
##
## The known suffix of the stack is as follows:
## PRINT APAR LITSTRING option(VIRG) option(chamadaArgs) FPAR 
##

<esperava nova linha>

prog: PRINT APAR LITSTRING VIRG WHILE 
##
## Ends in an error in state: 71.
##
## print -> PRINT APAR LITSTRING option(VIRG) . option(chamadaArgs) FPAR NOVALINHA [ WHILE RETURN PRINT INPUT IF ID FOR EOF DEF DEDENTA ]
##
## The known suffix of the stack is as follows:
## PRINT APAR LITSTRING option(VIRG) 
##

<esperava variavel ou expressao>

prog: PRINT APAR LITSTRING WHILE 
##
## Ends in an error in state: 69.
##
## print -> PRINT APAR LITSTRING . option(VIRG) option(chamadaArgs) FPAR NOVALINHA [ WHILE RETURN PRINT INPUT IF ID FOR EOF DEF DEDENTA ]
##
## The known suffix of the stack is as follows:
## PRINT APAR LITSTRING 
##

<esperava fechamento de parenteses ou virgula>

prog: PRINT APAR WHILE 
##
## Ends in an error in state: 68.
##
## print -> PRINT APAR . LITSTRING option(VIRG) option(chamadaArgs) FPAR NOVALINHA [ WHILE RETURN PRINT INPUT IF ID FOR EOF DEF DEDENTA ]
##
## The known suffix of the stack is as follows:
## PRINT APAR 
##

<esperava string>

prog: PRINT WHILE 
##
## Ends in an error in state: 67.
##
## print -> PRINT . APAR LITSTRING option(VIRG) option(chamadaArgs) FPAR NOVALINHA [ WHILE RETURN PRINT INPUT IF ID FOR EOF DEF DEDENTA ]
##
## The known suffix of the stack is as follows:
## PRINT 
##

<esperava parenteses>

prog: RETURN TRUE NOVALINHA VIRG 
##
## Ends in an error in state: 162.
##
## list(estrutura) -> estrutura . list(estrutura) [ EOF ]
##
## The known suffix of the stack is as follows:
## estrutura 
##

<erro de indentacao>

prog: RETURN TRUE WHILE 
##
## Ends in an error in state: 65.
##
## exprLogicoAritmetica -> exprLogicoAritmetica . MAIS exprLogicoAritmetica [ VEZES OU NOVALINHA MODULO MENOS MENORIGUAL MENOR MAIS MAIORIGUAL MAIOR IGUALDADE E DIVIDIDO DIFERENTE ]
## exprLogicoAritmetica -> exprLogicoAritmetica . MENOS exprLogicoAritmetica [ VEZES OU NOVALINHA MODULO MENOS MENORIGUAL MENOR MAIS MAIORIGUAL MAIOR IGUALDADE E DIVIDIDO DIFERENTE ]
## exprLogicoAritmetica -> exprLogicoAritmetica . VEZES exprLogicoAritmetica [ VEZES OU NOVALINHA MODULO MENOS MENORIGUAL MENOR MAIS MAIORIGUAL MAIOR IGUALDADE E DIVIDIDO DIFERENTE ]
## exprLogicoAritmetica -> exprLogicoAritmetica . DIVIDIDO exprLogicoAritmetica [ VEZES OU NOVALINHA MODULO MENOS MENORIGUAL MENOR MAIS MAIORIGUAL MAIOR IGUALDADE E DIVIDIDO DIFERENTE ]
## exprLogicoAritmetica -> exprLogicoAritmetica . MODULO exprLogicoAritmetica [ VEZES OU NOVALINHA MODULO MENOS MENORIGUAL MENOR MAIS MAIORIGUAL MAIOR IGUALDADE E DIVIDIDO DIFERENTE ]
## exprLogicoAritmetica -> exprLogicoAritmetica . IGUALDADE exprLogicoAritmetica [ VEZES OU NOVALINHA MODULO MENOS MENORIGUAL MENOR MAIS MAIORIGUAL MAIOR IGUALDADE E DIVIDIDO DIFERENTE ]
## exprLogicoAritmetica -> exprLogicoAritmetica . MAIOR exprLogicoAritmetica [ VEZES OU NOVALINHA MODULO MENOS MENORIGUAL MENOR MAIS MAIORIGUAL MAIOR IGUALDADE E DIVIDIDO DIFERENTE ]
## exprLogicoAritmetica -> exprLogicoAritmetica . MAIORIGUAL exprLogicoAritmetica [ VEZES OU NOVALINHA MODULO MENOS MENORIGUAL MENOR MAIS MAIORIGUAL MAIOR IGUALDADE E DIVIDIDO DIFERENTE ]
## exprLogicoAritmetica -> exprLogicoAritmetica . MENOR exprLogicoAritmetica [ VEZES OU NOVALINHA MODULO MENOS MENORIGUAL MENOR MAIS MAIORIGUAL MAIOR IGUALDADE E DIVIDIDO DIFERENTE ]
## exprLogicoAritmetica -> exprLogicoAritmetica . MENORIGUAL exprLogicoAritmetica [ VEZES OU NOVALINHA MODULO MENOS MENORIGUAL MENOR MAIS MAIORIGUAL MAIOR IGUALDADE E DIVIDIDO DIFERENTE ]
## exprLogicoAritmetica -> exprLogicoAritmetica . DIFERENTE exprLogicoAritmetica [ VEZES OU NOVALINHA MODULO MENOS MENORIGUAL MENOR MAIS MAIORIGUAL MAIOR IGUALDADE E DIVIDIDO DIFERENTE ]
## exprLogicoAritmetica -> exprLogicoAritmetica . E exprLogicoAritmetica [ VEZES OU NOVALINHA MODULO MENOS MENORIGUAL MENOR MAIS MAIORIGUAL MAIOR IGUALDADE E DIVIDIDO DIFERENTE ]
## exprLogicoAritmetica -> exprLogicoAritmetica . OU exprLogicoAritmetica [ VEZES OU NOVALINHA MODULO MENOS MENORIGUAL MENOR MAIS MAIORIGUAL MAIOR IGUALDADE E DIVIDIDO DIFERENTE ]
## retorno -> RETURN exprLogicoAritmetica . NOVALINHA [ WHILE RETURN PRINT INPUT IF ID FOR EOF DEF DEDENTA ]
##
## The known suffix of the stack is as follows:
## RETURN exprLogicoAritmetica 
##

<esperava nova linha>

prog: RETURN WHILE 
##
## Ends in an error in state: 64.
##
## retorno -> RETURN . exprLogicoAritmetica NOVALINHA [ WHILE RETURN PRINT INPUT IF ID FOR EOF DEF DEDENTA ]
##
## The known suffix of the stack is as follows:
## RETURN 
##

<esperava variavel ou expressao>

prog: VIRG 
##
## Ends in an error in state: 0.
##
## prog' -> . prog [ # ]
##
## The known suffix of the stack is as follows:
## 
##

<declaracao invalida>

prog: WHILE APAR TRUE WHILE 
##
## Ends in an error in state: 23.
##
## exprLogicoAritmetica -> exprLogicoAritmetica . MAIS exprLogicoAritmetica [ VEZES OU MODULO MENOS MENORIGUAL MENOR MAIS MAIORIGUAL MAIOR IGUALDADE FPAR E DIVIDIDO DIFERENTE ]
## exprLogicoAritmetica -> exprLogicoAritmetica . MENOS exprLogicoAritmetica [ VEZES OU MODULO MENOS MENORIGUAL MENOR MAIS MAIORIGUAL MAIOR IGUALDADE FPAR E DIVIDIDO DIFERENTE ]
## exprLogicoAritmetica -> exprLogicoAritmetica . VEZES exprLogicoAritmetica [ VEZES OU MODULO MENOS MENORIGUAL MENOR MAIS MAIORIGUAL MAIOR IGUALDADE FPAR E DIVIDIDO DIFERENTE ]
## exprLogicoAritmetica -> exprLogicoAritmetica . DIVIDIDO exprLogicoAritmetica [ VEZES OU MODULO MENOS MENORIGUAL MENOR MAIS MAIORIGUAL MAIOR IGUALDADE FPAR E DIVIDIDO DIFERENTE ]
## exprLogicoAritmetica -> exprLogicoAritmetica . MODULO exprLogicoAritmetica [ VEZES OU MODULO MENOS MENORIGUAL MENOR MAIS MAIORIGUAL MAIOR IGUALDADE FPAR E DIVIDIDO DIFERENTE ]
## exprLogicoAritmetica -> exprLogicoAritmetica . IGUALDADE exprLogicoAritmetica [ VEZES OU MODULO MENOS MENORIGUAL MENOR MAIS MAIORIGUAL MAIOR IGUALDADE FPAR E DIVIDIDO DIFERENTE ]
## exprLogicoAritmetica -> exprLogicoAritmetica . MAIOR exprLogicoAritmetica [ VEZES OU MODULO MENOS MENORIGUAL MENOR MAIS MAIORIGUAL MAIOR IGUALDADE FPAR E DIVIDIDO DIFERENTE ]
## exprLogicoAritmetica -> exprLogicoAritmetica . MAIORIGUAL exprLogicoAritmetica [ VEZES OU MODULO MENOS MENORIGUAL MENOR MAIS MAIORIGUAL MAIOR IGUALDADE FPAR E DIVIDIDO DIFERENTE ]
## exprLogicoAritmetica -> exprLogicoAritmetica . MENOR exprLogicoAritmetica [ VEZES OU MODULO MENOS MENORIGUAL MENOR MAIS MAIORIGUAL MAIOR IGUALDADE FPAR E DIVIDIDO DIFERENTE ]
## exprLogicoAritmetica -> exprLogicoAritmetica . MENORIGUAL exprLogicoAritmetica [ VEZES OU MODULO MENOS MENORIGUAL MENOR MAIS MAIORIGUAL MAIOR IGUALDADE FPAR E DIVIDIDO DIFERENTE ]
## exprLogicoAritmetica -> exprLogicoAritmetica . DIFERENTE exprLogicoAritmetica [ VEZES OU MODULO MENOS MENORIGUAL MENOR MAIS MAIORIGUAL MAIOR IGUALDADE FPAR E DIVIDIDO DIFERENTE ]
## exprLogicoAritmetica -> exprLogicoAritmetica . E exprLogicoAritmetica [ VEZES OU MODULO MENOS MENORIGUAL MENOR MAIS MAIORIGUAL MAIOR IGUALDADE FPAR E DIVIDIDO DIFERENTE ]
## exprLogicoAritmetica -> exprLogicoAritmetica . OU exprLogicoAritmetica [ VEZES OU MODULO MENOS MENORIGUAL MENOR MAIS MAIORIGUAL MAIOR IGUALDADE FPAR E DIVIDIDO DIFERENTE ]
## exprLogicoAritmetica -> APAR exprLogicoAritmetica . FPAR [ VIRG VEZES OU NOVALINHA MODULO MENOS MENORIGUAL MENOR MAIS MAIORIGUAL MAIOR IGUALDADE FPAR E DPONTOS DIVIDIDO DIFERENTE ]
##
## The known suffix of the stack is as follows:
## APAR exprLogicoAritmetica 
##

<esperava fechamento de parenteses>

prog: WHILE APAR WHILE 
##
## Ends in an error in state: 21.
##
## exprLogicoAritmetica -> APAR . exprLogicoAritmetica FPAR [ VIRG VEZES OU NOVALINHA MODULO MENOS MENORIGUAL MENOR MAIS MAIORIGUAL MAIOR IGUALDADE FPAR E DPONTOS DIVIDIDO DIFERENTE ]
##
## The known suffix of the stack is as follows:
## APAR 
##

<esperava expressao ou variavel>

prog: WHILE ID WHILE 
##
## Ends in an error in state: 18.
##
## chamadafuncao -> ID . APAR option(chamadaArgs) FPAR [ VIRG VEZES OU NOVALINHA MODULO MENOS MENORIGUAL MENOR MAIS MAIORIGUAL MAIOR IGUALDADE FPAR E DPONTOS DIVIDIDO DIFERENTE ]
## exprLogicoAritmetica -> ID . [ VIRG VEZES OU NOVALINHA MODULO MENOS MENORIGUAL MENOR MAIS MAIORIGUAL MAIOR IGUALDADE FPAR E DPONTOS DIVIDIDO DIFERENTE ]
##
## The known suffix of the stack is as follows:
## ID 
##

<esperava dois pontos>

prog: WHILE NOT WHILE 
##
## Ends in an error in state: 11.
##
## exprLogicoAritmetica -> NOT . exprLogicoAritmetica [ VIRG VEZES OU NOVALINHA MODULO MENOS MENORIGUAL MENOR MAIS MAIORIGUAL MAIOR IGUALDADE FPAR E DPONTOS DIVIDIDO DIFERENTE ]
##
## The known suffix of the stack is as follows:
## NOT 
##

<esperava termino de expressao >

prog: WHILE TRUE DIFERENTE TRUE WHILE 
##
## Ends in an error in state: 50.
##
## exprLogicoAritmetica -> exprLogicoAritmetica . MAIS exprLogicoAritmetica [ VIRG VEZES OU NOVALINHA MODULO MENOS MENORIGUAL MENOR MAIS MAIORIGUAL MAIOR IGUALDADE FPAR E DPONTOS DIVIDIDO DIFERENTE ]
## exprLogicoAritmetica -> exprLogicoAritmetica . MENOS exprLogicoAritmetica [ VIRG VEZES OU NOVALINHA MODULO MENOS MENORIGUAL MENOR MAIS MAIORIGUAL MAIOR IGUALDADE FPAR E DPONTOS DIVIDIDO DIFERENTE ]
## exprLogicoAritmetica -> exprLogicoAritmetica . VEZES exprLogicoAritmetica [ VIRG VEZES OU NOVALINHA MODULO MENOS MENORIGUAL MENOR MAIS MAIORIGUAL MAIOR IGUALDADE FPAR E DPONTOS DIVIDIDO DIFERENTE ]
## exprLogicoAritmetica -> exprLogicoAritmetica . DIVIDIDO exprLogicoAritmetica [ VIRG VEZES OU NOVALINHA MODULO MENOS MENORIGUAL MENOR MAIS MAIORIGUAL MAIOR IGUALDADE FPAR E DPONTOS DIVIDIDO DIFERENTE ]
## exprLogicoAritmetica -> exprLogicoAritmetica . MODULO exprLogicoAritmetica [ VIRG VEZES OU NOVALINHA MODULO MENOS MENORIGUAL MENOR MAIS MAIORIGUAL MAIOR IGUALDADE FPAR E DPONTOS DIVIDIDO DIFERENTE ]
## exprLogicoAritmetica -> exprLogicoAritmetica . IGUALDADE exprLogicoAritmetica [ VIRG VEZES OU NOVALINHA MODULO MENOS MENORIGUAL MENOR MAIS MAIORIGUAL MAIOR IGUALDADE FPAR E DPONTOS DIVIDIDO DIFERENTE ]
## exprLogicoAritmetica -> exprLogicoAritmetica . MAIOR exprLogicoAritmetica [ VIRG VEZES OU NOVALINHA MODULO MENOS MENORIGUAL MENOR MAIS MAIORIGUAL MAIOR IGUALDADE FPAR E DPONTOS DIVIDIDO DIFERENTE ]
## exprLogicoAritmetica -> exprLogicoAritmetica . MAIORIGUAL exprLogicoAritmetica [ VIRG VEZES OU NOVALINHA MODULO MENOS MENORIGUAL MENOR MAIS MAIORIGUAL MAIOR IGUALDADE FPAR E DPONTOS DIVIDIDO DIFERENTE ]
## exprLogicoAritmetica -> exprLogicoAritmetica . MENOR exprLogicoAritmetica [ VIRG VEZES OU NOVALINHA MODULO MENOS MENORIGUAL MENOR MAIS MAIORIGUAL MAIOR IGUALDADE FPAR E DPONTOS DIVIDIDO DIFERENTE ]
## exprLogicoAritmetica -> exprLogicoAritmetica . MENORIGUAL exprLogicoAritmetica [ VIRG VEZES OU NOVALINHA MODULO MENOS MENORIGUAL MENOR MAIS MAIORIGUAL MAIOR IGUALDADE FPAR E DPONTOS DIVIDIDO DIFERENTE ]
## exprLogicoAritmetica -> exprLogicoAritmetica . DIFERENTE exprLogicoAritmetica [ VIRG VEZES OU NOVALINHA MODULO MENOS MENORIGUAL MENOR MAIS MAIORIGUAL MAIOR IGUALDADE FPAR E DPONTOS DIVIDIDO DIFERENTE ]
## exprLogicoAritmetica -> exprLogicoAritmetica DIFERENTE exprLogicoAritmetica . [ VIRG VEZES OU NOVALINHA MODULO MENOS MENORIGUAL MENOR MAIS MAIORIGUAL MAIOR IGUALDADE FPAR E DPONTOS DIVIDIDO DIFERENTE ]
## exprLogicoAritmetica -> exprLogicoAritmetica . E exprLogicoAritmetica [ VIRG VEZES OU NOVALINHA MODULO MENOS MENORIGUAL MENOR MAIS MAIORIGUAL MAIOR IGUALDADE FPAR E DPONTOS DIVIDIDO DIFERENTE ]
## exprLogicoAritmetica -> exprLogicoAritmetica . OU exprLogicoAritmetica [ VIRG VEZES OU NOVALINHA MODULO MENOS MENORIGUAL MENOR MAIS MAIORIGUAL MAIOR IGUALDADE FPAR E DPONTOS DIVIDIDO DIFERENTE ]
##
## The known suffix of the stack is as follows:
## exprLogicoAritmetica DIFERENTE exprLogicoAritmetica 
##

<esperava dois pontos>

prog: WHILE TRUE DIFERENTE WHILE 
##
## Ends in an error in state: 49.
##
## exprLogicoAritmetica -> exprLogicoAritmetica DIFERENTE . exprLogicoAritmetica [ VIRG VEZES OU NOVALINHA MODULO MENOS MENORIGUAL MENOR MAIS MAIORIGUAL MAIOR IGUALDADE FPAR E DPONTOS DIVIDIDO DIFERENTE ]
##
## The known suffix of the stack is as follows:
## exprLogicoAritmetica DIFERENTE 
##

<esperava fim de expressao>

prog: WHILE TRUE DIVIDIDO WHILE 
##
## Ends in an error in state: 33.
##
## exprLogicoAritmetica -> exprLogicoAritmetica DIVIDIDO . exprLogicoAritmetica [ VIRG VEZES OU NOVALINHA MODULO MENOS MENORIGUAL MENOR MAIS MAIORIGUAL MAIOR IGUALDADE FPAR E DPONTOS DIVIDIDO DIFERENTE ]
##
## The known suffix of the stack is as follows:
## exprLogicoAritmetica DIVIDIDO 
##

<esperava fim de expressao>

prog: WHILE TRUE DPONTOS NOVALINHA INDENTA RETURN TRUE NOVALINHA VIRG 
##
## Ends in an error in state: 94.
##
## nonempty_list(statements) -> statements . [ DEDENTA ]
## nonempty_list(statements) -> statements . nonempty_list(statements) [ DEDENTA ]
##
## The known suffix of the stack is as follows:
## statements 
##

<erro de indentacao>

prog: WHILE TRUE DPONTOS NOVALINHA INDENTA VIRG 
##
## Ends in an error in state: 63.
##
## loopWhile -> WHILE exprLogicoAritmetica DPONTOS NOVALINHA INDENTA . nonempty_list(statements) DEDENTA [ WHILE RETURN PRINT INPUT IF ID FOR EOF DEF DEDENTA ]
##
## The known suffix of the stack is as follows:
## WHILE exprLogicoAritmetica DPONTOS NOVALINHA INDENTA 
##

<esperava expressao ou declaracao>

prog: WHILE TRUE DPONTOS NOVALINHA WHILE 
##
## Ends in an error in state: 62.
##
## loopWhile -> WHILE exprLogicoAritmetica DPONTOS NOVALINHA . INDENTA nonempty_list(statements) DEDENTA [ WHILE RETURN PRINT INPUT IF ID FOR EOF DEF DEDENTA ]
##
## The known suffix of the stack is as follows:
## WHILE exprLogicoAritmetica DPONTOS NOVALINHA 
##

<erro de indentaca>

prog: WHILE TRUE DPONTOS WHILE 
##
## Ends in an error in state: 61.
##
## loopWhile -> WHILE exprLogicoAritmetica DPONTOS . NOVALINHA INDENTA nonempty_list(statements) DEDENTA [ WHILE RETURN PRINT INPUT IF ID FOR EOF DEF DEDENTA ]
##
## The known suffix of the stack is as follows:
## WHILE exprLogicoAritmetica DPONTOS 
##

<esperava nova linha>

prog: WHILE TRUE E TRUE WHILE 
##
## Ends in an error in state: 48.
##
## exprLogicoAritmetica -> exprLogicoAritmetica . MAIS exprLogicoAritmetica [ VIRG VEZES OU NOVALINHA MODULO MENOS MENORIGUAL MENOR MAIS MAIORIGUAL MAIOR IGUALDADE FPAR E DPONTOS DIVIDIDO DIFERENTE ]
## exprLogicoAritmetica -> exprLogicoAritmetica . MENOS exprLogicoAritmetica [ VIRG VEZES OU NOVALINHA MODULO MENOS MENORIGUAL MENOR MAIS MAIORIGUAL MAIOR IGUALDADE FPAR E DPONTOS DIVIDIDO DIFERENTE ]
## exprLogicoAritmetica -> exprLogicoAritmetica . VEZES exprLogicoAritmetica [ VIRG VEZES OU NOVALINHA MODULO MENOS MENORIGUAL MENOR MAIS MAIORIGUAL MAIOR IGUALDADE FPAR E DPONTOS DIVIDIDO DIFERENTE ]
## exprLogicoAritmetica -> exprLogicoAritmetica . DIVIDIDO exprLogicoAritmetica [ VIRG VEZES OU NOVALINHA MODULO MENOS MENORIGUAL MENOR MAIS MAIORIGUAL MAIOR IGUALDADE FPAR E DPONTOS DIVIDIDO DIFERENTE ]
## exprLogicoAritmetica -> exprLogicoAritmetica . MODULO exprLogicoAritmetica [ VIRG VEZES OU NOVALINHA MODULO MENOS MENORIGUAL MENOR MAIS MAIORIGUAL MAIOR IGUALDADE FPAR E DPONTOS DIVIDIDO DIFERENTE ]
## exprLogicoAritmetica -> exprLogicoAritmetica . IGUALDADE exprLogicoAritmetica [ VIRG VEZES OU NOVALINHA MODULO MENOS MENORIGUAL MENOR MAIS MAIORIGUAL MAIOR IGUALDADE FPAR E DPONTOS DIVIDIDO DIFERENTE ]
## exprLogicoAritmetica -> exprLogicoAritmetica . MAIOR exprLogicoAritmetica [ VIRG VEZES OU NOVALINHA MODULO MENOS MENORIGUAL MENOR MAIS MAIORIGUAL MAIOR IGUALDADE FPAR E DPONTOS DIVIDIDO DIFERENTE ]
## exprLogicoAritmetica -> exprLogicoAritmetica . MAIORIGUAL exprLogicoAritmetica [ VIRG VEZES OU NOVALINHA MODULO MENOS MENORIGUAL MENOR MAIS MAIORIGUAL MAIOR IGUALDADE FPAR E DPONTOS DIVIDIDO DIFERENTE ]
## exprLogicoAritmetica -> exprLogicoAritmetica . MENOR exprLogicoAritmetica [ VIRG VEZES OU NOVALINHA MODULO MENOS MENORIGUAL MENOR MAIS MAIORIGUAL MAIOR IGUALDADE FPAR E DPONTOS DIVIDIDO DIFERENTE ]
## exprLogicoAritmetica -> exprLogicoAritmetica . MENORIGUAL exprLogicoAritmetica [ VIRG VEZES OU NOVALINHA MODULO MENOS MENORIGUAL MENOR MAIS MAIORIGUAL MAIOR IGUALDADE FPAR E DPONTOS DIVIDIDO DIFERENTE ]
## exprLogicoAritmetica -> exprLogicoAritmetica . DIFERENTE exprLogicoAritmetica [ VIRG VEZES OU NOVALINHA MODULO MENOS MENORIGUAL MENOR MAIS MAIORIGUAL MAIOR IGUALDADE FPAR E DPONTOS DIVIDIDO DIFERENTE ]
## exprLogicoAritmetica -> exprLogicoAritmetica . E exprLogicoAritmetica [ VIRG VEZES OU NOVALINHA MODULO MENOS MENORIGUAL MENOR MAIS MAIORIGUAL MAIOR IGUALDADE FPAR E DPONTOS DIVIDIDO DIFERENTE ]
## exprLogicoAritmetica -> exprLogicoAritmetica E exprLogicoAritmetica . [ VIRG VEZES OU NOVALINHA MODULO MENOS MENORIGUAL MENOR MAIS MAIORIGUAL MAIOR IGUALDADE FPAR E DPONTOS DIVIDIDO DIFERENTE ]
## exprLogicoAritmetica -> exprLogicoAritmetica . OU exprLogicoAritmetica [ VIRG VEZES OU NOVALINHA MODULO MENOS MENORIGUAL MENOR MAIS MAIORIGUAL MAIOR IGUALDADE FPAR E DPONTOS DIVIDIDO DIFERENTE ]
##
## The known suffix of the stack is as follows:
## exprLogicoAritmetica E exprLogicoAritmetica 
##

<esperava dois pontos>

prog: WHILE TRUE E WHILE 
##
## Ends in an error in state: 47.
##
## exprLogicoAritmetica -> exprLogicoAritmetica E . exprLogicoAritmetica [ VIRG VEZES OU NOVALINHA MODULO MENOS MENORIGUAL MENOR MAIS MAIORIGUAL MAIOR IGUALDADE FPAR E DPONTOS DIVIDIDO DIFERENTE ]
##
## The known suffix of the stack is as follows:
## exprLogicoAritmetica E 
##

<esperava fim de expressao>

prog: WHILE TRUE IGUALDADE TRUE WHILE 
##
## Ends in an error in state: 46.
##
## exprLogicoAritmetica -> exprLogicoAritmetica . MAIS exprLogicoAritmetica [ VIRG VEZES OU NOVALINHA MODULO MENOS MENORIGUAL MENOR MAIS MAIORIGUAL MAIOR IGUALDADE FPAR E DPONTOS DIVIDIDO DIFERENTE ]
## exprLogicoAritmetica -> exprLogicoAritmetica . MENOS exprLogicoAritmetica [ VIRG VEZES OU NOVALINHA MODULO MENOS MENORIGUAL MENOR MAIS MAIORIGUAL MAIOR IGUALDADE FPAR E DPONTOS DIVIDIDO DIFERENTE ]
## exprLogicoAritmetica -> exprLogicoAritmetica . VEZES exprLogicoAritmetica [ VIRG VEZES OU NOVALINHA MODULO MENOS MENORIGUAL MENOR MAIS MAIORIGUAL MAIOR IGUALDADE FPAR E DPONTOS DIVIDIDO DIFERENTE ]
## exprLogicoAritmetica -> exprLogicoAritmetica . DIVIDIDO exprLogicoAritmetica [ VIRG VEZES OU NOVALINHA MODULO MENOS MENORIGUAL MENOR MAIS MAIORIGUAL MAIOR IGUALDADE FPAR E DPONTOS DIVIDIDO DIFERENTE ]
## exprLogicoAritmetica -> exprLogicoAritmetica . MODULO exprLogicoAritmetica [ VIRG VEZES OU NOVALINHA MODULO MENOS MENORIGUAL MENOR MAIS MAIORIGUAL MAIOR IGUALDADE FPAR E DPONTOS DIVIDIDO DIFERENTE ]
## exprLogicoAritmetica -> exprLogicoAritmetica . IGUALDADE exprLogicoAritmetica [ VIRG VEZES OU NOVALINHA MODULO MENOS MENORIGUAL MENOR MAIS MAIORIGUAL MAIOR IGUALDADE FPAR E DPONTOS DIVIDIDO DIFERENTE ]
## exprLogicoAritmetica -> exprLogicoAritmetica IGUALDADE exprLogicoAritmetica . [ VIRG VEZES OU NOVALINHA MODULO MENOS MENORIGUAL MENOR MAIS MAIORIGUAL MAIOR IGUALDADE FPAR E DPONTOS DIVIDIDO DIFERENTE ]
## exprLogicoAritmetica -> exprLogicoAritmetica . MAIOR exprLogicoAritmetica [ VIRG VEZES OU NOVALINHA MODULO MENOS MENORIGUAL MENOR MAIS MAIORIGUAL MAIOR IGUALDADE FPAR E DPONTOS DIVIDIDO DIFERENTE ]
## exprLogicoAritmetica -> exprLogicoAritmetica . MAIORIGUAL exprLogicoAritmetica [ VIRG VEZES OU NOVALINHA MODULO MENOS MENORIGUAL MENOR MAIS MAIORIGUAL MAIOR IGUALDADE FPAR E DPONTOS DIVIDIDO DIFERENTE ]
## exprLogicoAritmetica -> exprLogicoAritmetica . MENOR exprLogicoAritmetica [ VIRG VEZES OU NOVALINHA MODULO MENOS MENORIGUAL MENOR MAIS MAIORIGUAL MAIOR IGUALDADE FPAR E DPONTOS DIVIDIDO DIFERENTE ]
## exprLogicoAritmetica -> exprLogicoAritmetica . MENORIGUAL exprLogicoAritmetica [ VIRG VEZES OU NOVALINHA MODULO MENOS MENORIGUAL MENOR MAIS MAIORIGUAL MAIOR IGUALDADE FPAR E DPONTOS DIVIDIDO DIFERENTE ]
## exprLogicoAritmetica -> exprLogicoAritmetica . DIFERENTE exprLogicoAritmetica [ VIRG VEZES OU NOVALINHA MODULO MENOS MENORIGUAL MENOR MAIS MAIORIGUAL MAIOR IGUALDADE FPAR E DPONTOS DIVIDIDO DIFERENTE ]
## exprLogicoAritmetica -> exprLogicoAritmetica . E exprLogicoAritmetica [ VIRG VEZES OU NOVALINHA MODULO MENOS MENORIGUAL MENOR MAIS MAIORIGUAL MAIOR IGUALDADE FPAR E DPONTOS DIVIDIDO DIFERENTE ]
## exprLogicoAritmetica -> exprLogicoAritmetica . OU exprLogicoAritmetica [ VIRG VEZES OU NOVALINHA MODULO MENOS MENORIGUAL MENOR MAIS MAIORIGUAL MAIOR IGUALDADE FPAR E DPONTOS DIVIDIDO DIFERENTE ]
##
## The known suffix of the stack is as follows:
## exprLogicoAritmetica IGUALDADE exprLogicoAritmetica 
##

<esperava dois pontos>

prog: WHILE TRUE IGUALDADE WHILE 
##
## Ends in an error in state: 45.
##
## exprLogicoAritmetica -> exprLogicoAritmetica IGUALDADE . exprLogicoAritmetica [ VIRG VEZES OU NOVALINHA MODULO MENOS MENORIGUAL MENOR MAIS MAIORIGUAL MAIOR IGUALDADE FPAR E DPONTOS DIVIDIDO DIFERENTE ]
##
## The known suffix of the stack is as follows:
## exprLogicoAritmetica IGUALDADE 
##

<esperava fim de expressao>

prog: WHILE TRUE MAIOR TRUE WHILE 
##
## Ends in an error in state: 44.
##
## exprLogicoAritmetica -> exprLogicoAritmetica . MAIS exprLogicoAritmetica [ VIRG VEZES OU NOVALINHA MODULO MENOS MENORIGUAL MENOR MAIS MAIORIGUAL MAIOR IGUALDADE FPAR E DPONTOS DIVIDIDO DIFERENTE ]
## exprLogicoAritmetica -> exprLogicoAritmetica . MENOS exprLogicoAritmetica [ VIRG VEZES OU NOVALINHA MODULO MENOS MENORIGUAL MENOR MAIS MAIORIGUAL MAIOR IGUALDADE FPAR E DPONTOS DIVIDIDO DIFERENTE ]
## exprLogicoAritmetica -> exprLogicoAritmetica . VEZES exprLogicoAritmetica [ VIRG VEZES OU NOVALINHA MODULO MENOS MENORIGUAL MENOR MAIS MAIORIGUAL MAIOR IGUALDADE FPAR E DPONTOS DIVIDIDO DIFERENTE ]
## exprLogicoAritmetica -> exprLogicoAritmetica . DIVIDIDO exprLogicoAritmetica [ VIRG VEZES OU NOVALINHA MODULO MENOS MENORIGUAL MENOR MAIS MAIORIGUAL MAIOR IGUALDADE FPAR E DPONTOS DIVIDIDO DIFERENTE ]
## exprLogicoAritmetica -> exprLogicoAritmetica . MODULO exprLogicoAritmetica [ VIRG VEZES OU NOVALINHA MODULO MENOS MENORIGUAL MENOR MAIS MAIORIGUAL MAIOR IGUALDADE FPAR E DPONTOS DIVIDIDO DIFERENTE ]
## exprLogicoAritmetica -> exprLogicoAritmetica . IGUALDADE exprLogicoAritmetica [ VIRG VEZES OU NOVALINHA MODULO MENOS MENORIGUAL MENOR MAIS MAIORIGUAL MAIOR IGUALDADE FPAR E DPONTOS DIVIDIDO DIFERENTE ]
## exprLogicoAritmetica -> exprLogicoAritmetica . MAIOR exprLogicoAritmetica [ VIRG VEZES OU NOVALINHA MODULO MENOS MENORIGUAL MENOR MAIS MAIORIGUAL MAIOR IGUALDADE FPAR E DPONTOS DIVIDIDO DIFERENTE ]
## exprLogicoAritmetica -> exprLogicoAritmetica MAIOR exprLogicoAritmetica . [ VIRG VEZES OU NOVALINHA MODULO MENOS MENORIGUAL MENOR MAIS MAIORIGUAL MAIOR IGUALDADE FPAR E DPONTOS DIVIDIDO DIFERENTE ]
## exprLogicoAritmetica -> exprLogicoAritmetica . MAIORIGUAL exprLogicoAritmetica [ VIRG VEZES OU NOVALINHA MODULO MENOS MENORIGUAL MENOR MAIS MAIORIGUAL MAIOR IGUALDADE FPAR E DPONTOS DIVIDIDO DIFERENTE ]
## exprLogicoAritmetica -> exprLogicoAritmetica . MENOR exprLogicoAritmetica [ VIRG VEZES OU NOVALINHA MODULO MENOS MENORIGUAL MENOR MAIS MAIORIGUAL MAIOR IGUALDADE FPAR E DPONTOS DIVIDIDO DIFERENTE ]
## exprLogicoAritmetica -> exprLogicoAritmetica . MENORIGUAL exprLogicoAritmetica [ VIRG VEZES OU NOVALINHA MODULO MENOS MENORIGUAL MENOR MAIS MAIORIGUAL MAIOR IGUALDADE FPAR E DPONTOS DIVIDIDO DIFERENTE ]
## exprLogicoAritmetica -> exprLogicoAritmetica . DIFERENTE exprLogicoAritmetica [ VIRG VEZES OU NOVALINHA MODULO MENOS MENORIGUAL MENOR MAIS MAIORIGUAL MAIOR IGUALDADE FPAR E DPONTOS DIVIDIDO DIFERENTE ]
## exprLogicoAritmetica -> exprLogicoAritmetica . E exprLogicoAritmetica [ VIRG VEZES OU NOVALINHA MODULO MENOS MENORIGUAL MENOR MAIS MAIORIGUAL MAIOR IGUALDADE FPAR E DPONTOS DIVIDIDO DIFERENTE ]
## exprLogicoAritmetica -> exprLogicoAritmetica . OU exprLogicoAritmetica [ VIRG VEZES OU NOVALINHA MODULO MENOS MENORIGUAL MENOR MAIS MAIORIGUAL MAIOR IGUALDADE FPAR E DPONTOS DIVIDIDO DIFERENTE ]
##
## The known suffix of the stack is as follows:
## exprLogicoAritmetica MAIOR exprLogicoAritmetica 
##

<esperava dois pontos>

prog: WHILE TRUE MAIOR WHILE 
##
## Ends in an error in state: 43.
##
## exprLogicoAritmetica -> exprLogicoAritmetica MAIOR . exprLogicoAritmetica [ VIRG VEZES OU NOVALINHA MODULO MENOS MENORIGUAL MENOR MAIS MAIORIGUAL MAIOR IGUALDADE FPAR E DPONTOS DIVIDIDO DIFERENTE ]
##
## The known suffix of the stack is as follows:
## exprLogicoAritmetica MAIOR 
##

<esperava fim de expressao>

prog: WHILE TRUE MAIORIGUAL TRUE WHILE 
##
## Ends in an error in state: 42.
##
## exprLogicoAritmetica -> exprLogicoAritmetica . MAIS exprLogicoAritmetica [ VIRG VEZES OU NOVALINHA MODULO MENOS MENORIGUAL MENOR MAIS MAIORIGUAL MAIOR IGUALDADE FPAR E DPONTOS DIVIDIDO DIFERENTE ]
## exprLogicoAritmetica -> exprLogicoAritmetica . MENOS exprLogicoAritmetica [ VIRG VEZES OU NOVALINHA MODULO MENOS MENORIGUAL MENOR MAIS MAIORIGUAL MAIOR IGUALDADE FPAR E DPONTOS DIVIDIDO DIFERENTE ]
## exprLogicoAritmetica -> exprLogicoAritmetica . VEZES exprLogicoAritmetica [ VIRG VEZES OU NOVALINHA MODULO MENOS MENORIGUAL MENOR MAIS MAIORIGUAL MAIOR IGUALDADE FPAR E DPONTOS DIVIDIDO DIFERENTE ]
## exprLogicoAritmetica -> exprLogicoAritmetica . DIVIDIDO exprLogicoAritmetica [ VIRG VEZES OU NOVALINHA MODULO MENOS MENORIGUAL MENOR MAIS MAIORIGUAL MAIOR IGUALDADE FPAR E DPONTOS DIVIDIDO DIFERENTE ]
## exprLogicoAritmetica -> exprLogicoAritmetica . MODULO exprLogicoAritmetica [ VIRG VEZES OU NOVALINHA MODULO MENOS MENORIGUAL MENOR MAIS MAIORIGUAL MAIOR IGUALDADE FPAR E DPONTOS DIVIDIDO DIFERENTE ]
## exprLogicoAritmetica -> exprLogicoAritmetica . IGUALDADE exprLogicoAritmetica [ VIRG VEZES OU NOVALINHA MODULO MENOS MENORIGUAL MENOR MAIS MAIORIGUAL MAIOR IGUALDADE FPAR E DPONTOS DIVIDIDO DIFERENTE ]
## exprLogicoAritmetica -> exprLogicoAritmetica . MAIOR exprLogicoAritmetica [ VIRG VEZES OU NOVALINHA MODULO MENOS MENORIGUAL MENOR MAIS MAIORIGUAL MAIOR IGUALDADE FPAR E DPONTOS DIVIDIDO DIFERENTE ]
## exprLogicoAritmetica -> exprLogicoAritmetica . MAIORIGUAL exprLogicoAritmetica [ VIRG VEZES OU NOVALINHA MODULO MENOS MENORIGUAL MENOR MAIS MAIORIGUAL MAIOR IGUALDADE FPAR E DPONTOS DIVIDIDO DIFERENTE ]
## exprLogicoAritmetica -> exprLogicoAritmetica MAIORIGUAL exprLogicoAritmetica . [ VIRG VEZES OU NOVALINHA MODULO MENOS MENORIGUAL MENOR MAIS MAIORIGUAL MAIOR IGUALDADE FPAR E DPONTOS DIVIDIDO DIFERENTE ]
## exprLogicoAritmetica -> exprLogicoAritmetica . MENOR exprLogicoAritmetica [ VIRG VEZES OU NOVALINHA MODULO MENOS MENORIGUAL MENOR MAIS MAIORIGUAL MAIOR IGUALDADE FPAR E DPONTOS DIVIDIDO DIFERENTE ]
## exprLogicoAritmetica -> exprLogicoAritmetica . MENORIGUAL exprLogicoAritmetica [ VIRG VEZES OU NOVALINHA MODULO MENOS MENORIGUAL MENOR MAIS MAIORIGUAL MAIOR IGUALDADE FPAR E DPONTOS DIVIDIDO DIFERENTE ]
## exprLogicoAritmetica -> exprLogicoAritmetica . DIFERENTE exprLogicoAritmetica [ VIRG VEZES OU NOVALINHA MODULO MENOS MENORIGUAL MENOR MAIS MAIORIGUAL MAIOR IGUALDADE FPAR E DPONTOS DIVIDIDO DIFERENTE ]
## exprLogicoAritmetica -> exprLogicoAritmetica . E exprLogicoAritmetica [ VIRG VEZES OU NOVALINHA MODULO MENOS MENORIGUAL MENOR MAIS MAIORIGUAL MAIOR IGUALDADE FPAR E DPONTOS DIVIDIDO DIFERENTE ]
## exprLogicoAritmetica -> exprLogicoAritmetica . OU exprLogicoAritmetica [ VIRG VEZES OU NOVALINHA MODULO MENOS MENORIGUAL MENOR MAIS MAIORIGUAL MAIOR IGUALDADE FPAR E DPONTOS DIVIDIDO DIFERENTE ]
##
## The known suffix of the stack is as follows:
## exprLogicoAritmetica MAIORIGUAL exprLogicoAritmetica 
##

<esperava dois pontos>

prog: WHILE TRUE MAIORIGUAL WHILE 
##
## Ends in an error in state: 41.
##
## exprLogicoAritmetica -> exprLogicoAritmetica MAIORIGUAL . exprLogicoAritmetica [ VIRG VEZES OU NOVALINHA MODULO MENOS MENORIGUAL MENOR MAIS MAIORIGUAL MAIOR IGUALDADE FPAR E DPONTOS DIVIDIDO DIFERENTE ]
##
## The known suffix of the stack is as follows:
## exprLogicoAritmetica MAIORIGUAL 
##

<esperava fim de expressao>

prog: WHILE TRUE MAIS TRUE WHILE 
##
## Ends in an error in state: 38.
##
## exprLogicoAritmetica -> exprLogicoAritmetica . MAIS exprLogicoAritmetica [ VIRG VEZES OU NOVALINHA MODULO MENOS MENORIGUAL MENOR MAIS MAIORIGUAL MAIOR IGUALDADE FPAR E DPONTOS DIVIDIDO DIFERENTE ]
## exprLogicoAritmetica -> exprLogicoAritmetica MAIS exprLogicoAritmetica . [ VIRG VEZES OU NOVALINHA MODULO MENOS MENORIGUAL MENOR MAIS MAIORIGUAL MAIOR IGUALDADE FPAR E DPONTOS DIVIDIDO DIFERENTE ]
## exprLogicoAritmetica -> exprLogicoAritmetica . MENOS exprLogicoAritmetica [ VIRG VEZES OU NOVALINHA MODULO MENOS MENORIGUAL MENOR MAIS MAIORIGUAL MAIOR IGUALDADE FPAR E DPONTOS DIVIDIDO DIFERENTE ]
## exprLogicoAritmetica -> exprLogicoAritmetica . VEZES exprLogicoAritmetica [ VIRG VEZES OU NOVALINHA MODULO MENOS MENORIGUAL MENOR MAIS MAIORIGUAL MAIOR IGUALDADE FPAR E DPONTOS DIVIDIDO DIFERENTE ]
## exprLogicoAritmetica -> exprLogicoAritmetica . DIVIDIDO exprLogicoAritmetica [ VIRG VEZES OU NOVALINHA MODULO MENOS MENORIGUAL MENOR MAIS MAIORIGUAL MAIOR IGUALDADE FPAR E DPONTOS DIVIDIDO DIFERENTE ]
## exprLogicoAritmetica -> exprLogicoAritmetica . MODULO exprLogicoAritmetica [ VIRG VEZES OU NOVALINHA MODULO MENOS MENORIGUAL MENOR MAIS MAIORIGUAL MAIOR IGUALDADE FPAR E DPONTOS DIVIDIDO DIFERENTE ]
## exprLogicoAritmetica -> exprLogicoAritmetica . IGUALDADE exprLogicoAritmetica [ VIRG VEZES OU NOVALINHA MODULO MENOS MENORIGUAL MENOR MAIS MAIORIGUAL MAIOR IGUALDADE FPAR E DPONTOS DIVIDIDO DIFERENTE ]
## exprLogicoAritmetica -> exprLogicoAritmetica . MAIOR exprLogicoAritmetica [ VIRG VEZES OU NOVALINHA MODULO MENOS MENORIGUAL MENOR MAIS MAIORIGUAL MAIOR IGUALDADE FPAR E DPONTOS DIVIDIDO DIFERENTE ]
## exprLogicoAritmetica -> exprLogicoAritmetica . MAIORIGUAL exprLogicoAritmetica [ VIRG VEZES OU NOVALINHA MODULO MENOS MENORIGUAL MENOR MAIS MAIORIGUAL MAIOR IGUALDADE FPAR E DPONTOS DIVIDIDO DIFERENTE ]
## exprLogicoAritmetica -> exprLogicoAritmetica . MENOR exprLogicoAritmetica [ VIRG VEZES OU NOVALINHA MODULO MENOS MENORIGUAL MENOR MAIS MAIORIGUAL MAIOR IGUALDADE FPAR E DPONTOS DIVIDIDO DIFERENTE ]
## exprLogicoAritmetica -> exprLogicoAritmetica . MENORIGUAL exprLogicoAritmetica [ VIRG VEZES OU NOVALINHA MODULO MENOS MENORIGUAL MENOR MAIS MAIORIGUAL MAIOR IGUALDADE FPAR E DPONTOS DIVIDIDO DIFERENTE ]
## exprLogicoAritmetica -> exprLogicoAritmetica . DIFERENTE exprLogicoAritmetica [ VIRG VEZES OU NOVALINHA MODULO MENOS MENORIGUAL MENOR MAIS MAIORIGUAL MAIOR IGUALDADE FPAR E DPONTOS DIVIDIDO DIFERENTE ]
## exprLogicoAritmetica -> exprLogicoAritmetica . E exprLogicoAritmetica [ VIRG VEZES OU NOVALINHA MODULO MENOS MENORIGUAL MENOR MAIS MAIORIGUAL MAIOR IGUALDADE FPAR E DPONTOS DIVIDIDO DIFERENTE ]
## exprLogicoAritmetica -> exprLogicoAritmetica . OU exprLogicoAritmetica [ VIRG VEZES OU NOVALINHA MODULO MENOS MENORIGUAL MENOR MAIS MAIORIGUAL MAIOR IGUALDADE FPAR E DPONTOS DIVIDIDO DIFERENTE ]
##
## The known suffix of the stack is as follows:
## exprLogicoAritmetica MAIS exprLogicoAritmetica 
##

<esperava dois pontos>

prog: WHILE TRUE MAIS WHILE 
##
## Ends in an error in state: 37.
##
## exprLogicoAritmetica -> exprLogicoAritmetica MAIS . exprLogicoAritmetica [ VIRG VEZES OU NOVALINHA MODULO MENOS MENORIGUAL MENOR MAIS MAIORIGUAL MAIOR IGUALDADE FPAR E DPONTOS DIVIDIDO DIFERENTE ]
##
## The known suffix of the stack is as follows:
## exprLogicoAritmetica MAIS 
##

<esperava fim de expressao>

prog: WHILE TRUE MENOR TRUE WHILE 
##
## Ends in an error in state: 40.
##
## exprLogicoAritmetica -> exprLogicoAritmetica . MAIS exprLogicoAritmetica [ VIRG VEZES OU NOVALINHA MODULO MENOS MENORIGUAL MENOR MAIS MAIORIGUAL MAIOR IGUALDADE FPAR E DPONTOS DIVIDIDO DIFERENTE ]
## exprLogicoAritmetica -> exprLogicoAritmetica . MENOS exprLogicoAritmetica [ VIRG VEZES OU NOVALINHA MODULO MENOS MENORIGUAL MENOR MAIS MAIORIGUAL MAIOR IGUALDADE FPAR E DPONTOS DIVIDIDO DIFERENTE ]
## exprLogicoAritmetica -> exprLogicoAritmetica . VEZES exprLogicoAritmetica [ VIRG VEZES OU NOVALINHA MODULO MENOS MENORIGUAL MENOR MAIS MAIORIGUAL MAIOR IGUALDADE FPAR E DPONTOS DIVIDIDO DIFERENTE ]
## exprLogicoAritmetica -> exprLogicoAritmetica . DIVIDIDO exprLogicoAritmetica [ VIRG VEZES OU NOVALINHA MODULO MENOS MENORIGUAL MENOR MAIS MAIORIGUAL MAIOR IGUALDADE FPAR E DPONTOS DIVIDIDO DIFERENTE ]
## exprLogicoAritmetica -> exprLogicoAritmetica . MODULO exprLogicoAritmetica [ VIRG VEZES OU NOVALINHA MODULO MENOS MENORIGUAL MENOR MAIS MAIORIGUAL MAIOR IGUALDADE FPAR E DPONTOS DIVIDIDO DIFERENTE ]
## exprLogicoAritmetica -> exprLogicoAritmetica . IGUALDADE exprLogicoAritmetica [ VIRG VEZES OU NOVALINHA MODULO MENOS MENORIGUAL MENOR MAIS MAIORIGUAL MAIOR IGUALDADE FPAR E DPONTOS DIVIDIDO DIFERENTE ]
## exprLogicoAritmetica -> exprLogicoAritmetica . MAIOR exprLogicoAritmetica [ VIRG VEZES OU NOVALINHA MODULO MENOS MENORIGUAL MENOR MAIS MAIORIGUAL MAIOR IGUALDADE FPAR E DPONTOS DIVIDIDO DIFERENTE ]
## exprLogicoAritmetica -> exprLogicoAritmetica . MAIORIGUAL exprLogicoAritmetica [ VIRG VEZES OU NOVALINHA MODULO MENOS MENORIGUAL MENOR MAIS MAIORIGUAL MAIOR IGUALDADE FPAR E DPONTOS DIVIDIDO DIFERENTE ]
## exprLogicoAritmetica -> exprLogicoAritmetica . MENOR exprLogicoAritmetica [ VIRG VEZES OU NOVALINHA MODULO MENOS MENORIGUAL MENOR MAIS MAIORIGUAL MAIOR IGUALDADE FPAR E DPONTOS DIVIDIDO DIFERENTE ]
## exprLogicoAritmetica -> exprLogicoAritmetica MENOR exprLogicoAritmetica . [ VIRG VEZES OU NOVALINHA MODULO MENOS MENORIGUAL MENOR MAIS MAIORIGUAL MAIOR IGUALDADE FPAR E DPONTOS DIVIDIDO DIFERENTE ]
## exprLogicoAritmetica -> exprLogicoAritmetica . MENORIGUAL exprLogicoAritmetica [ VIRG VEZES OU NOVALINHA MODULO MENOS MENORIGUAL MENOR MAIS MAIORIGUAL MAIOR IGUALDADE FPAR E DPONTOS DIVIDIDO DIFERENTE ]
## exprLogicoAritmetica -> exprLogicoAritmetica . DIFERENTE exprLogicoAritmetica [ VIRG VEZES OU NOVALINHA MODULO MENOS MENORIGUAL MENOR MAIS MAIORIGUAL MAIOR IGUALDADE FPAR E DPONTOS DIVIDIDO DIFERENTE ]
## exprLogicoAritmetica -> exprLogicoAritmetica . E exprLogicoAritmetica [ VIRG VEZES OU NOVALINHA MODULO MENOS MENORIGUAL MENOR MAIS MAIORIGUAL MAIOR IGUALDADE FPAR E DPONTOS DIVIDIDO DIFERENTE ]
## exprLogicoAritmetica -> exprLogicoAritmetica . OU exprLogicoAritmetica [ VIRG VEZES OU NOVALINHA MODULO MENOS MENORIGUAL MENOR MAIS MAIORIGUAL MAIOR IGUALDADE FPAR E DPONTOS DIVIDIDO DIFERENTE ]
##
## The known suffix of the stack is as follows:
## exprLogicoAritmetica MENOR exprLogicoAritmetica 
##

<esperava dois pontos>

prog: WHILE TRUE MENOR WHILE 
##
## Ends in an error in state: 39.
##
## exprLogicoAritmetica -> exprLogicoAritmetica MENOR . exprLogicoAritmetica [ VIRG VEZES OU NOVALINHA MODULO MENOS MENORIGUAL MENOR MAIS MAIORIGUAL MAIOR IGUALDADE FPAR E DPONTOS DIVIDIDO DIFERENTE ]
##
## The known suffix of the stack is as follows:
## exprLogicoAritmetica MENOR 
##

<esperava fim de expressao>

prog: WHILE TRUE MENORIGUAL TRUE WHILE 
##
## Ends in an error in state: 36.
##
## exprLogicoAritmetica -> exprLogicoAritmetica . MAIS exprLogicoAritmetica [ VIRG VEZES OU NOVALINHA MODULO MENOS MENORIGUAL MENOR MAIS MAIORIGUAL MAIOR IGUALDADE FPAR E DPONTOS DIVIDIDO DIFERENTE ]
## exprLogicoAritmetica -> exprLogicoAritmetica . MENOS exprLogicoAritmetica [ VIRG VEZES OU NOVALINHA MODULO MENOS MENORIGUAL MENOR MAIS MAIORIGUAL MAIOR IGUALDADE FPAR E DPONTOS DIVIDIDO DIFERENTE ]
## exprLogicoAritmetica -> exprLogicoAritmetica . VEZES exprLogicoAritmetica [ VIRG VEZES OU NOVALINHA MODULO MENOS MENORIGUAL MENOR MAIS MAIORIGUAL MAIOR IGUALDADE FPAR E DPONTOS DIVIDIDO DIFERENTE ]
## exprLogicoAritmetica -> exprLogicoAritmetica . DIVIDIDO exprLogicoAritmetica [ VIRG VEZES OU NOVALINHA MODULO MENOS MENORIGUAL MENOR MAIS MAIORIGUAL MAIOR IGUALDADE FPAR E DPONTOS DIVIDIDO DIFERENTE ]
## exprLogicoAritmetica -> exprLogicoAritmetica . MODULO exprLogicoAritmetica [ VIRG VEZES OU NOVALINHA MODULO MENOS MENORIGUAL MENOR MAIS MAIORIGUAL MAIOR IGUALDADE FPAR E DPONTOS DIVIDIDO DIFERENTE ]
## exprLogicoAritmetica -> exprLogicoAritmetica . IGUALDADE exprLogicoAritmetica [ VIRG VEZES OU NOVALINHA MODULO MENOS MENORIGUAL MENOR MAIS MAIORIGUAL MAIOR IGUALDADE FPAR E DPONTOS DIVIDIDO DIFERENTE ]
## exprLogicoAritmetica -> exprLogicoAritmetica . MAIOR exprLogicoAritmetica [ VIRG VEZES OU NOVALINHA MODULO MENOS MENORIGUAL MENOR MAIS MAIORIGUAL MAIOR IGUALDADE FPAR E DPONTOS DIVIDIDO DIFERENTE ]
## exprLogicoAritmetica -> exprLogicoAritmetica . MAIORIGUAL exprLogicoAritmetica [ VIRG VEZES OU NOVALINHA MODULO MENOS MENORIGUAL MENOR MAIS MAIORIGUAL MAIOR IGUALDADE FPAR E DPONTOS DIVIDIDO DIFERENTE ]
## exprLogicoAritmetica -> exprLogicoAritmetica . MENOR exprLogicoAritmetica [ VIRG VEZES OU NOVALINHA MODULO MENOS MENORIGUAL MENOR MAIS MAIORIGUAL MAIOR IGUALDADE FPAR E DPONTOS DIVIDIDO DIFERENTE ]
## exprLogicoAritmetica -> exprLogicoAritmetica . MENORIGUAL exprLogicoAritmetica [ VIRG VEZES OU NOVALINHA MODULO MENOS MENORIGUAL MENOR MAIS MAIORIGUAL MAIOR IGUALDADE FPAR E DPONTOS DIVIDIDO DIFERENTE ]
## exprLogicoAritmetica -> exprLogicoAritmetica MENORIGUAL exprLogicoAritmetica . [ VIRG VEZES OU NOVALINHA MODULO MENOS MENORIGUAL MENOR MAIS MAIORIGUAL MAIOR IGUALDADE FPAR E DPONTOS DIVIDIDO DIFERENTE ]
## exprLogicoAritmetica -> exprLogicoAritmetica . DIFERENTE exprLogicoAritmetica [ VIRG VEZES OU NOVALINHA MODULO MENOS MENORIGUAL MENOR MAIS MAIORIGUAL MAIOR IGUALDADE FPAR E DPONTOS DIVIDIDO DIFERENTE ]
## exprLogicoAritmetica -> exprLogicoAritmetica . E exprLogicoAritmetica [ VIRG VEZES OU NOVALINHA MODULO MENOS MENORIGUAL MENOR MAIS MAIORIGUAL MAIOR IGUALDADE FPAR E DPONTOS DIVIDIDO DIFERENTE ]
## exprLogicoAritmetica -> exprLogicoAritmetica . OU exprLogicoAritmetica [ VIRG VEZES OU NOVALINHA MODULO MENOS MENORIGUAL MENOR MAIS MAIORIGUAL MAIOR IGUALDADE FPAR E DPONTOS DIVIDIDO DIFERENTE ]
##
## The known suffix of the stack is as follows:
## exprLogicoAritmetica MENORIGUAL exprLogicoAritmetica 
##

<esperava dois pontos>

prog: WHILE TRUE MENORIGUAL WHILE 
##
## Ends in an error in state: 35.
##
## exprLogicoAritmetica -> exprLogicoAritmetica MENORIGUAL . exprLogicoAritmetica [ VIRG VEZES OU NOVALINHA MODULO MENOS MENORIGUAL MENOR MAIS MAIORIGUAL MAIOR IGUALDADE FPAR E DPONTOS DIVIDIDO DIFERENTE ]
##
## The known suffix of the stack is as follows:
## exprLogicoAritmetica MENORIGUAL 
##

<esperava fim de expressao>

prog: WHILE TRUE MENOS TRUE WHILE 
##
## Ends in an error in state: 32.
##
## exprLogicoAritmetica -> exprLogicoAritmetica . MAIS exprLogicoAritmetica [ VIRG VEZES OU NOVALINHA MODULO MENOS MENORIGUAL MENOR MAIS MAIORIGUAL MAIOR IGUALDADE FPAR E DPONTOS DIVIDIDO DIFERENTE ]
## exprLogicoAritmetica -> exprLogicoAritmetica . MENOS exprLogicoAritmetica [ VIRG VEZES OU NOVALINHA MODULO MENOS MENORIGUAL MENOR MAIS MAIORIGUAL MAIOR IGUALDADE FPAR E DPONTOS DIVIDIDO DIFERENTE ]
## exprLogicoAritmetica -> exprLogicoAritmetica MENOS exprLogicoAritmetica . [ VIRG VEZES OU NOVALINHA MODULO MENOS MENORIGUAL MENOR MAIS MAIORIGUAL MAIOR IGUALDADE FPAR E DPONTOS DIVIDIDO DIFERENTE ]
## exprLogicoAritmetica -> exprLogicoAritmetica . VEZES exprLogicoAritmetica [ VIRG VEZES OU NOVALINHA MODULO MENOS MENORIGUAL MENOR MAIS MAIORIGUAL MAIOR IGUALDADE FPAR E DPONTOS DIVIDIDO DIFERENTE ]
## exprLogicoAritmetica -> exprLogicoAritmetica . DIVIDIDO exprLogicoAritmetica [ VIRG VEZES OU NOVALINHA MODULO MENOS MENORIGUAL MENOR MAIS MAIORIGUAL MAIOR IGUALDADE FPAR E DPONTOS DIVIDIDO DIFERENTE ]
## exprLogicoAritmetica -> exprLogicoAritmetica . MODULO exprLogicoAritmetica [ VIRG VEZES OU NOVALINHA MODULO MENOS MENORIGUAL MENOR MAIS MAIORIGUAL MAIOR IGUALDADE FPAR E DPONTOS DIVIDIDO DIFERENTE ]
## exprLogicoAritmetica -> exprLogicoAritmetica . IGUALDADE exprLogicoAritmetica [ VIRG VEZES OU NOVALINHA MODULO MENOS MENORIGUAL MENOR MAIS MAIORIGUAL MAIOR IGUALDADE FPAR E DPONTOS DIVIDIDO DIFERENTE ]
## exprLogicoAritmetica -> exprLogicoAritmetica . MAIOR exprLogicoAritmetica [ VIRG VEZES OU NOVALINHA MODULO MENOS MENORIGUAL MENOR MAIS MAIORIGUAL MAIOR IGUALDADE FPAR E DPONTOS DIVIDIDO DIFERENTE ]
## exprLogicoAritmetica -> exprLogicoAritmetica . MAIORIGUAL exprLogicoAritmetica [ VIRG VEZES OU NOVALINHA MODULO MENOS MENORIGUAL MENOR MAIS MAIORIGUAL MAIOR IGUALDADE FPAR E DPONTOS DIVIDIDO DIFERENTE ]
## exprLogicoAritmetica -> exprLogicoAritmetica . MENOR exprLogicoAritmetica [ VIRG VEZES OU NOVALINHA MODULO MENOS MENORIGUAL MENOR MAIS MAIORIGUAL MAIOR IGUALDADE FPAR E DPONTOS DIVIDIDO DIFERENTE ]
## exprLogicoAritmetica -> exprLogicoAritmetica . MENORIGUAL exprLogicoAritmetica [ VIRG VEZES OU NOVALINHA MODULO MENOS MENORIGUAL MENOR MAIS MAIORIGUAL MAIOR IGUALDADE FPAR E DPONTOS DIVIDIDO DIFERENTE ]
## exprLogicoAritmetica -> exprLogicoAritmetica . DIFERENTE exprLogicoAritmetica [ VIRG VEZES OU NOVALINHA MODULO MENOS MENORIGUAL MENOR MAIS MAIORIGUAL MAIOR IGUALDADE FPAR E DPONTOS DIVIDIDO DIFERENTE ]
## exprLogicoAritmetica -> exprLogicoAritmetica . E exprLogicoAritmetica [ VIRG VEZES OU NOVALINHA MODULO MENOS MENORIGUAL MENOR MAIS MAIORIGUAL MAIOR IGUALDADE FPAR E DPONTOS DIVIDIDO DIFERENTE ]
## exprLogicoAritmetica -> exprLogicoAritmetica . OU exprLogicoAritmetica [ VIRG VEZES OU NOVALINHA MODULO MENOS MENORIGUAL MENOR MAIS MAIORIGUAL MAIOR IGUALDADE FPAR E DPONTOS DIVIDIDO DIFERENTE ]
##
## The known suffix of the stack is as follows:
## exprLogicoAritmetica MENOS exprLogicoAritmetica 
##

<esperava dois pontos>

prog: WHILE TRUE MENOS WHILE 
##
## Ends in an error in state: 31.
##
## exprLogicoAritmetica -> exprLogicoAritmetica MENOS . exprLogicoAritmetica [ VIRG VEZES OU NOVALINHA MODULO MENOS MENORIGUAL MENOR MAIS MAIORIGUAL MAIOR IGUALDADE FPAR E DPONTOS DIVIDIDO DIFERENTE ]
##
## The known suffix of the stack is as follows:
## exprLogicoAritmetica MENOS 
##

<esperava fim de expressao>

prog: WHILE TRUE MODULO WHILE 
##
## Ends in an error in state: 29.
##
## exprLogicoAritmetica -> exprLogicoAritmetica MODULO . exprLogicoAritmetica [ VIRG VEZES OU NOVALINHA MODULO MENOS MENORIGUAL MENOR MAIS MAIORIGUAL MAIOR IGUALDADE FPAR E DPONTOS DIVIDIDO DIFERENTE ]
##
## The known suffix of the stack is as follows:
## exprLogicoAritmetica MODULO 
##

<esperava fim de expressao>

prog: WHILE TRUE OU TRUE WHILE 
##
## Ends in an error in state: 28.
##
## exprLogicoAritmetica -> exprLogicoAritmetica . MAIS exprLogicoAritmetica [ VIRG VEZES OU NOVALINHA MODULO MENOS MENORIGUAL MENOR MAIS MAIORIGUAL MAIOR IGUALDADE FPAR E DPONTOS DIVIDIDO DIFERENTE ]
## exprLogicoAritmetica -> exprLogicoAritmetica . MENOS exprLogicoAritmetica [ VIRG VEZES OU NOVALINHA MODULO MENOS MENORIGUAL MENOR MAIS MAIORIGUAL MAIOR IGUALDADE FPAR E DPONTOS DIVIDIDO DIFERENTE ]
## exprLogicoAritmetica -> exprLogicoAritmetica . VEZES exprLogicoAritmetica [ VIRG VEZES OU NOVALINHA MODULO MENOS MENORIGUAL MENOR MAIS MAIORIGUAL MAIOR IGUALDADE FPAR E DPONTOS DIVIDIDO DIFERENTE ]
## exprLogicoAritmetica -> exprLogicoAritmetica . DIVIDIDO exprLogicoAritmetica [ VIRG VEZES OU NOVALINHA MODULO MENOS MENORIGUAL MENOR MAIS MAIORIGUAL MAIOR IGUALDADE FPAR E DPONTOS DIVIDIDO DIFERENTE ]
## exprLogicoAritmetica -> exprLogicoAritmetica . MODULO exprLogicoAritmetica [ VIRG VEZES OU NOVALINHA MODULO MENOS MENORIGUAL MENOR MAIS MAIORIGUAL MAIOR IGUALDADE FPAR E DPONTOS DIVIDIDO DIFERENTE ]
## exprLogicoAritmetica -> exprLogicoAritmetica . IGUALDADE exprLogicoAritmetica [ VIRG VEZES OU NOVALINHA MODULO MENOS MENORIGUAL MENOR MAIS MAIORIGUAL MAIOR IGUALDADE FPAR E DPONTOS DIVIDIDO DIFERENTE ]
## exprLogicoAritmetica -> exprLogicoAritmetica . MAIOR exprLogicoAritmetica [ VIRG VEZES OU NOVALINHA MODULO MENOS MENORIGUAL MENOR MAIS MAIORIGUAL MAIOR IGUALDADE FPAR E DPONTOS DIVIDIDO DIFERENTE ]
## exprLogicoAritmetica -> exprLogicoAritmetica . MAIORIGUAL exprLogicoAritmetica [ VIRG VEZES OU NOVALINHA MODULO MENOS MENORIGUAL MENOR MAIS MAIORIGUAL MAIOR IGUALDADE FPAR E DPONTOS DIVIDIDO DIFERENTE ]
## exprLogicoAritmetica -> exprLogicoAritmetica . MENOR exprLogicoAritmetica [ VIRG VEZES OU NOVALINHA MODULO MENOS MENORIGUAL MENOR MAIS MAIORIGUAL MAIOR IGUALDADE FPAR E DPONTOS DIVIDIDO DIFERENTE ]
## exprLogicoAritmetica -> exprLogicoAritmetica . MENORIGUAL exprLogicoAritmetica [ VIRG VEZES OU NOVALINHA MODULO MENOS MENORIGUAL MENOR MAIS MAIORIGUAL MAIOR IGUALDADE FPAR E DPONTOS DIVIDIDO DIFERENTE ]
## exprLogicoAritmetica -> exprLogicoAritmetica . DIFERENTE exprLogicoAritmetica [ VIRG VEZES OU NOVALINHA MODULO MENOS MENORIGUAL MENOR MAIS MAIORIGUAL MAIOR IGUALDADE FPAR E DPONTOS DIVIDIDO DIFERENTE ]
## exprLogicoAritmetica -> exprLogicoAritmetica . E exprLogicoAritmetica [ VIRG VEZES OU NOVALINHA MODULO MENOS MENORIGUAL MENOR MAIS MAIORIGUAL MAIOR IGUALDADE FPAR E DPONTOS DIVIDIDO DIFERENTE ]
## exprLogicoAritmetica -> exprLogicoAritmetica . OU exprLogicoAritmetica [ VIRG VEZES OU NOVALINHA MODULO MENOS MENORIGUAL MENOR MAIS MAIORIGUAL MAIOR IGUALDADE FPAR E DPONTOS DIVIDIDO DIFERENTE ]
## exprLogicoAritmetica -> exprLogicoAritmetica OU exprLogicoAritmetica . [ VIRG VEZES OU NOVALINHA MODULO MENOS MENORIGUAL MENOR MAIS MAIORIGUAL MAIOR IGUALDADE FPAR E DPONTOS DIVIDIDO DIFERENTE ]
##
## The known suffix of the stack is as follows:
## exprLogicoAritmetica OU exprLogicoAritmetica 
##

<esperava dois pontos>

prog: WHILE TRUE OU WHILE 
##
## Ends in an error in state: 27.
##
## exprLogicoAritmetica -> exprLogicoAritmetica OU . exprLogicoAritmetica [ VIRG VEZES OU NOVALINHA MODULO MENOS MENORIGUAL MENOR MAIS MAIORIGUAL MAIOR IGUALDADE FPAR E DPONTOS DIVIDIDO DIFERENTE ]
##
## The known suffix of the stack is as follows:
## exprLogicoAritmetica OU 
##

<esperava fim de expressao>

prog: WHILE TRUE VEZES WHILE 
##
## Ends in an error in state: 24.
##
## exprLogicoAritmetica -> exprLogicoAritmetica VEZES . exprLogicoAritmetica [ VIRG VEZES OU NOVALINHA MODULO MENOS MENORIGUAL MENOR MAIS MAIORIGUAL MAIOR IGUALDADE FPAR E DPONTOS DIVIDIDO DIFERENTE ]
##
## The known suffix of the stack is as follows:
## exprLogicoAritmetica VEZES 
##

<esperava fim de expressao>

prog: WHILE TRUE WHILE 
##
## Ends in an error in state: 60.
##
## exprLogicoAritmetica -> exprLogicoAritmetica . MAIS exprLogicoAritmetica [ VEZES OU MODULO MENOS MENORIGUAL MENOR MAIS MAIORIGUAL MAIOR IGUALDADE E DPONTOS DIVIDIDO DIFERENTE ]
## exprLogicoAritmetica -> exprLogicoAritmetica . MENOS exprLogicoAritmetica [ VEZES OU MODULO MENOS MENORIGUAL MENOR MAIS MAIORIGUAL MAIOR IGUALDADE E DPONTOS DIVIDIDO DIFERENTE ]
## exprLogicoAritmetica -> exprLogicoAritmetica . VEZES exprLogicoAritmetica [ VEZES OU MODULO MENOS MENORIGUAL MENOR MAIS MAIORIGUAL MAIOR IGUALDADE E DPONTOS DIVIDIDO DIFERENTE ]
## exprLogicoAritmetica -> exprLogicoAritmetica . DIVIDIDO exprLogicoAritmetica [ VEZES OU MODULO MENOS MENORIGUAL MENOR MAIS MAIORIGUAL MAIOR IGUALDADE E DPONTOS DIVIDIDO DIFERENTE ]
## exprLogicoAritmetica -> exprLogicoAritmetica . MODULO exprLogicoAritmetica [ VEZES OU MODULO MENOS MENORIGUAL MENOR MAIS MAIORIGUAL MAIOR IGUALDADE E DPONTOS DIVIDIDO DIFERENTE ]
## exprLogicoAritmetica -> exprLogicoAritmetica . IGUALDADE exprLogicoAritmetica [ VEZES OU MODULO MENOS MENORIGUAL MENOR MAIS MAIORIGUAL MAIOR IGUALDADE E DPONTOS DIVIDIDO DIFERENTE ]
## exprLogicoAritmetica -> exprLogicoAritmetica . MAIOR exprLogicoAritmetica [ VEZES OU MODULO MENOS MENORIGUAL MENOR MAIS MAIORIGUAL MAIOR IGUALDADE E DPONTOS DIVIDIDO DIFERENTE ]
## exprLogicoAritmetica -> exprLogicoAritmetica . MAIORIGUAL exprLogicoAritmetica [ VEZES OU MODULO MENOS MENORIGUAL MENOR MAIS MAIORIGUAL MAIOR IGUALDADE E DPONTOS DIVIDIDO DIFERENTE ]
## exprLogicoAritmetica -> exprLogicoAritmetica . MENOR exprLogicoAritmetica [ VEZES OU MODULO MENOS MENORIGUAL MENOR MAIS MAIORIGUAL MAIOR IGUALDADE E DPONTOS DIVIDIDO DIFERENTE ]
## exprLogicoAritmetica -> exprLogicoAritmetica . MENORIGUAL exprLogicoAritmetica [ VEZES OU MODULO MENOS MENORIGUAL MENOR MAIS MAIORIGUAL MAIOR IGUALDADE E DPONTOS DIVIDIDO DIFERENTE ]
## exprLogicoAritmetica -> exprLogicoAritmetica . DIFERENTE exprLogicoAritmetica [ VEZES OU MODULO MENOS MENORIGUAL MENOR MAIS MAIORIGUAL MAIOR IGUALDADE E DPONTOS DIVIDIDO DIFERENTE ]
## exprLogicoAritmetica -> exprLogicoAritmetica . E exprLogicoAritmetica [ VEZES OU MODULO MENOS MENORIGUAL MENOR MAIS MAIORIGUAL MAIOR IGUALDADE E DPONTOS DIVIDIDO DIFERENTE ]
## exprLogicoAritmetica -> exprLogicoAritmetica . OU exprLogicoAritmetica [ VEZES OU MODULO MENOS MENORIGUAL MENOR MAIS MAIORIGUAL MAIOR IGUALDADE E DPONTOS DIVIDIDO DIFERENTE ]
## loopWhile -> WHILE exprLogicoAritmetica . DPONTOS NOVALINHA INDENTA nonempty_list(statements) DEDENTA [ WHILE RETURN PRINT INPUT IF ID FOR EOF DEF DEDENTA ]
##
## The known suffix of the stack is as follows:
## WHILE exprLogicoAritmetica 
##

<esperava dois pontos>

prog: WHILE WHILE 
##
## Ends in an error in state: 9.
##
## loopWhile -> WHILE . exprLogicoAritmetica DPONTOS NOVALINHA INDENTA nonempty_list(statements) DEDENTA [ WHILE RETURN PRINT INPUT IF ID FOR EOF DEF DEDENTA ]
##
## The known suffix of the stack is as follows:
## WHILE 
##

<esperava expressao>

