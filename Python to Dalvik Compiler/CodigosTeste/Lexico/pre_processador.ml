open Lexico
open Printf

(* Pré processa o arquivo gerando os tokens de indenta e dedenta *)

let preprocessa lexbuf =
  let pilha = Stack.create ()
  and npar = ref 0 in
    let _ = Stack.push 0 pilha in
    let off_side toks nivel =
    let _ = printf "Nivel: %d\n" nivel in
    if !npar != 0 (* nova linha entre parenteses *)
    then toks     (* nao faz nada *)
    else if nivel > Stack.top pilha
         then begin
           Stack.push nivel pilha;
           INDENTA :: toks
         end
    else if nivel = Stack.top pilha
         then toks
    else begin
    let prefixo = ref toks in
    while nivel < Stack.top pilha do
      ignore (Stack.pop pilha);
      if nivel > Stack.top pilha
        then failwith "Erro de indentacao"
      else prefixo := DEDENTA :: !prefixo
   done;
   !prefixo
   end
 in

 let rec dedenta sufixo =
   if Stack.top pilha != 0
   then let _ = Stack.pop pilha in
	      dedenta (DEDENTA :: sufixo)
   else sufixo
 in
 let rec get_tokens () =
   let tok = Lexico.preprocessador 0 lexbuf in
   match tok with
     Linha(nivel,npars,toks) ->
     let new_toks = off_side toks nivel in
     npar := npars;
     new_toks @ (if npars = 0 
                 then NOVALINHA :: get_tokens () 
                 else get_tokens ())
		| _ -> dedenta []
 in get_tokens ()
			     

(* Chama o analisador léxico *)
let lexico =
  let tokbuf = ref None in
  let carrega lexbuf =
    let toks = preprocessa lexbuf in
    (match toks with
       tok::toks ->
       tokbuf := Some toks;
       tok
     | [] -> print_endline "EOF";
	     EOF)
  in
  fun lexbuf ->
  match !tokbuf with
    Some tokens ->
    (match tokens with
       tok::toks ->
       tokbuf := Some toks;
       tok
     | [] -> carrega lexbuf)
  | None -> carrega lexbuf


