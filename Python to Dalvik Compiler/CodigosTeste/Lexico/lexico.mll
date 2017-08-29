{

  open Lexing
  open Printf

  type token =
  | LITINT of (int)
  | LITSTRING of (string)
  | ID of (string)
  | LITFLOAT of (float)
  | APAR
  | FPAR
  | VIRG
  | MAIS
  | DPONTOS
  | MENORIGUAL
  | SETA
  | E
  | ATRIB
  | RETURN
  | DEF
  | EOF
  (*tokens adicionados*)
  | OU
  | IF
  | ELSE
  | WHILE
  | FOR
  | MAIORIGUAL
  | IMPORT
  | INT
  | FLOAT
  | LIST
  | ABRECOLCHETES
  | FECHACOLCHETES
  | ABRECHAVES
  | FECHACHAVES
  | INCR 
  | DECR 
  | IGUALDADE
  | MENOS
  | VEZES
  | DIVIDIDO
  | MENOR
  | MAIOR
  | PV
  | IN
  | RANGE
  | CHAR
  | DOUBLE
  | PONTO
  | PASS
  | VOID
  | ELIF
  | PRINT
  | STR
  | INPUT
  | LENGTH
  | DIFERENTE
  | TRUE
  | FALSE
  | BREAK
  | IS
  | NOT
  | MODULO
  | FROM
  | ATRIBMAIS 
  | ATRIBMENOS 
  | ATRIBMULT 
  | ATRIBDIV 
  (* Os tokens a seguir são importantes para o pré processador *)
  | Linha of (int * int * token list)
  | INDENTA
  | DEDENTA
  | NOVALINHA

  let booleano nbool = 
    match nbool with
      | "True" -> 1
      | "False" -> 0
      | _ -> failwith "Erro: nao eh valor booleano"  

  let nivel_par = ref 0

  let incr_num_linha lexbuf =
    let pos = lexbuf.lex_curr_p in
      lexbuf.lex_curr_p <- { pos with
         pos_lnum = pos.pos_lnum + 1;
         pos_bol = pos.pos_cnum;
      }

  let msg_erro lexbuf c =
    let pos = lexbuf.lex_curr_p in
    let lin = pos.pos_lnum
    and col = pos.pos_cnum - pos.pos_bol - 1 in
    sprintf "%d-%d: caracter desconhecido %c" lin col c

  let erro lin col msg =
    let mensagem = sprintf "%d-%d: %s" lin col msg in
       failwith mensagem


}

let digito = ['0' - '9']
let int =  digito+
let comentario = "#"[ ^ '\n' ]*
let linha_em_branco = [' ' '\t' ]* comentario
let restante = [^ ' ' '\t' '\n' ] [^ '\n']+
let brancos = [' ' '\t']+
let novalinha = '\r' | '\n' | "\r\n"
let letra = [ 'a'-'z' 'A' - 'Z']
let identificador = letra ( letra | digito | '_' )*

(* O pré processador necessário para contabilizar a identação *)
rule preprocessador indentacao = parse
  linha_em_branco         { preprocessador 0 lexbuf } (* ignora brancos *)
| [' ' '\t' ]+ '\n'       { incr_num_linha lexbuf;
                            preprocessador 0 lexbuf } (* ignora brancos *)
| ' '                     { preprocessador (indentacao + 1) lexbuf }
| '\t'                    { let nova_ind = indentacao + 8 - (indentacao mod 8) 
                            in preprocessador nova_ind lexbuf }
| novalinha               { incr_num_linha lexbuf;
                            preprocessador 0 lexbuf }
| restante as linha {
      let rec tokenize lexbuf =
          let tok = token lexbuf in
	  match tok with
	     EOF -> []
	 | _ -> tok :: tokenize lexbuf in
      let toks = tokenize (Lexing.from_string linha) in
      (* A impressão a seguir serve apenas para depuração. Retirar depois! *)
      printf "Linha(identacao=%d,nivel_par=%d)\n" indentacao (!nivel_par);
      Linha(indentacao,!nivel_par, toks)
}
| eof { nivel_par := 0; EOF }

(* O analisador léxico a ser chamado após o pré processador *)
and token = parse
  brancos            { token lexbuf }
| comentario         { token lexbuf }
| "'''"               { comentario_bloco 0 lexbuf; }
| ">="               { MAIORIGUAL}
| "<="               { MENORIGUAL }
| "->"               { SETA }
| "++"               { INCR }
| "--"               { DECR }
| "=="               { IGUALDADE }
| "!="               { DIFERENTE }
| "+="               { ATRIBMAIS }
| "-="               { ATRIBMENOS }
| "*="               { ATRIBMULT }
| "/="               { ATRIBDIV }
| '{'                { ABRECHAVES }
| '}'                { FECHACHAVES }
| '['                { ABRECOLCHETES }
| ']'                { FECHACOLCHETES }
| '('                { let _ = incr(nivel_par) in APAR }
| ')'                { let _ = decr(nivel_par) in FPAR }
| ','                { VIRG }
| '+'                { MAIS  }
| '-'                { MENOS  }
| '*'                { VEZES  }
| '/'                { DIVIDIDO }
| '='                { ATRIB }
| ':'                { DPONTOS }
| ';'                { PV }
| '<'                { MENOR }
| '>'                { MAIOR }
| '%'		             { MODULO }
| '.'                { PONTO }
| int as num         { let numero = int_of_string num in
                       LITINT numero }                    
| "or"               { OU }
| "if"               { IF }
| "else"             { ELSE }
| "while"            { WHILE }
| "for"              { FOR }
| "return"           { RETURN }
| "def"              { DEF }
| "import"           { IMPORT }
| "int"              { INT }
| "float"            { FLOAT }
| "double"           { DOUBLE }
| "char"             { CHAR }
| "list"             { LIST }
| "and"              { E    }
| "in"               { IN }
| "range"            { RANGE }
| "pass"             { PASS }
| "void"             { VOID }
| "elif"	           { ELIF }
| "print"            { PRINT }
| "str"              { STR }
| "input"            { INPUT }
| "len"              { LENGTH }
| "break"            { BREAK }
| "is"               { IS }
| "not"		           { NOT }
| "from"	           { FROM }
| identificador as id { ID id }
| '"'        { let pos = lexbuf.lex_curr_p in
               let lin = pos.pos_lnum
               and col = pos.pos_cnum - pos.pos_bol - 1 in
               let buffer = Buffer.create 1 in 
               let str = leia_string lin col buffer lexbuf in
                 LITSTRING str }
| _ as c  { failwith (msg_erro lexbuf c) }
| eof        { EOF }

and comentario_bloco n = parse
   "'''"      { if n=0 then token lexbuf 
               else comentario_bloco (n-1) lexbuf }
| "'''"       { comentario_bloco (n+1) lexbuf }
| novalinha  { incr_num_linha lexbuf; comentario_bloco n lexbuf }
| _          { comentario_bloco n lexbuf }
| eof        { failwith "Comentário não fechado" }

and leia_string lin col buffer = parse
   '"'     { Buffer.contents buffer}
| "\\t"    { Buffer.add_char buffer '\t'; leia_string lin col buffer lexbuf }
| "\\n"    { Buffer.add_char buffer '\n'; leia_string lin col buffer lexbuf }
| '\\' '"'  { Buffer.add_char buffer '"'; leia_string lin col buffer lexbuf }
| '\\' '\\' { Buffer.add_char buffer '\\'; leia_string lin col buffer lexbuf }
| _ as c    { Buffer.add_char buffer c; leia_string lin col buffer lexbuf }
| eof      { erro lin col "A string não foi fechada"}



