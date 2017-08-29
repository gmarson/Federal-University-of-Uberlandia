{
  open Sintatico
  open Lexing
  open Printf

  exception Erro of string

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

  let pos_atual lexbuf = lexbuf.lex_start_p

}

let digito = ['0' - '9']
let int = '-'? * digito+
let float = '-'? * digito+ * '.' * digito+
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
                                  Linha(indentacao,!nivel_par, toks)
                  }
| eof { nivel_par := 0; EOF }

(* O analisador léxico a ser chamado após o pré processador *)
and token = parse
  brancos            { token lexbuf }
| comentario         { token lexbuf }
| "'''"              { comentario_bloco 0 lexbuf; }
| ">="               { MAIORIGUAL (pos_atual lexbuf)}
| "<="               { MENORIGUAL (pos_atual lexbuf)}
| "->"               { SETA (pos_atual lexbuf)}
| "=="               { IGUALDADE (pos_atual lexbuf)}
| "!="               { DIFERENTE (pos_atual lexbuf)}
| '('                { incr(nivel_par); APAR(pos_atual lexbuf)}
| ')'                { decr(nivel_par); FPAR(pos_atual lexbuf)}
| ','                { VIRG (pos_atual lexbuf)}
| '+'                { MAIS  (pos_atual lexbuf)}
| '-'                { MENOS (pos_atual lexbuf) }
| '*'                { VEZES  (pos_atual lexbuf)}
| '/'                { DIVIDIDO (pos_atual lexbuf)}
| '='                { ATRIB (pos_atual lexbuf)}
| ':'                { DPONTOS (pos_atual lexbuf)}
| '<'                { MENOR (pos_atual lexbuf)}
| '>'                { MAIOR (pos_atual lexbuf)}
| '%'		             { MODULO (pos_atual lexbuf)}
| "or"               { OU (pos_atual lexbuf)}
| "if"               { IF (pos_atual lexbuf)}
| "else"             { ELSE (pos_atual lexbuf)}
| "while"            { WHILE (pos_atual lexbuf)}
| "for"              { FOR (pos_atual lexbuf)}
| "return"           { RETURN (pos_atual lexbuf)}
| "def"              { DEF (pos_atual lexbuf)}
| "int"              { INT (pos_atual lexbuf)}
| "float"            { FLOAT (pos_atual lexbuf)}
| "bool"             { BOOL (pos_atual lexbuf)}
| "and"              { E   (pos_atual lexbuf) }
| "in"               { IN (pos_atual lexbuf)}
| "range"            { RANGE (pos_atual lexbuf)}
| "None"             { NONE (pos_atual lexbuf)}
| "elif"	           { ELIF (pos_atual lexbuf)}
| "print"            { PRINT (pos_atual lexbuf)}
| "str"              { STR (pos_atual lexbuf)}
| "inputi"            { INPUTI (pos_atual lexbuf)}
| "inputf"            { INPUTF (pos_atual lexbuf)}
| "inputs"            { INPUTS (pos_atual lexbuf)}
| "not"		           { NOT (pos_atual lexbuf)}
| "True"             { LITBOOL(true,pos_atual lexbuf)}
| "False"            { LITBOOL(false,pos_atual lexbuf)}
| int as num         { LITINT (int_of_string num, pos_atual lexbuf) } 
| float as num       { LITFLOAT (float_of_string num, pos_atual lexbuf) }
| digito+ as numint  {let num = int_of_string numint in LITINT (num, pos_atual lexbuf)}
| identificador as id { ID (id, pos_atual lexbuf) }
| '"'        { let pos = lexbuf.lex_curr_p in
               let lin = pos.pos_lnum
               and col = pos.pos_cnum - pos.pos_bol - 1 in
               let buffer = Buffer.create 1 in 
               let str = leia_string lin col buffer lexbuf in
                 LITSTRING (str, pos_atual lexbuf) }
| _ as c  { failwith (msg_erro lexbuf c) }
| eof        { EOF }

and comentario_bloco n = parse
   "'''"      { if n=0 then token lexbuf 
               else comentario_bloco (n-1) lexbuf }
| "'''"       { comentario_bloco (n+1) lexbuf }
| novalinha  { incr_num_linha lexbuf; comentario_bloco n lexbuf }
| _          { comentario_bloco n lexbuf }
| eof     { raise (Erro "Comentário não terminado") }

and leia_string lin col buffer = parse
   '"'     { Buffer.contents buffer}
| "\\t"    { Buffer.add_char buffer '\t'; leia_string lin col buffer lexbuf }
| "\\n"    { Buffer.add_char buffer '\n'; leia_string lin col buffer lexbuf }
| '\\' '"'  { Buffer.add_char buffer '"'; leia_string lin col buffer lexbuf }
| '\\' '\\' { Buffer.add_char buffer '\\'; leia_string lin col buffer lexbuf }
| _ as c    { Buffer.add_char buffer c; leia_string lin col buffer lexbuf }
| eof      { erro lin col "A string não foi fechada"}




