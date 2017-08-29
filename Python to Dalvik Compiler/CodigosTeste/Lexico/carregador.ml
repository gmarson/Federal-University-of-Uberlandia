(* Para compilar:
     ocamllex lexico.mll
     ocamlc -c lexico.ml
     ocamlc -c pre_processador.ml

   Para usar:
     rlwrap ocaml

     #use "carregador.ml";;
     lex "teste.py";;
*)

#load "lexico.cmo"
#load "pre_processador.cmo"

type nome_arq = string
type tokens = Lexico.token list

let rec tokens lexbuf =
  let tok = Pre_processador.lexico lexbuf in
  match tok with
  | Lexico.EOF -> ([Lexico.EOF]:tokens)
  | _ -> tok :: tokens lexbuf
;;

let lexico str =
  let lexbuf = Lexing.from_string str in
  tokens lexbuf
;;

let lex (arq:nome_arq) =
  let ic = open_in arq in
  let lexbuf = Lexing.from_channel ic in
  let toks = tokens lexbuf in
  let _ = close_in ic in
  toks
