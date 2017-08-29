(* Parser preditivo *)
#load "lexico.cmo";;
open Sintatico;;

type rule = S of rule * rule * rule
            | X of tokens * rule * tokens
            | Y of tokens * rule * rule * tokens * rule
            | Z of tokens * rule * rule * tokens
            | X_vazio
            | Y_d of tokens
            | Z_f of tokens

let tk = ref EOF (* variavel global para o token atual *)
let lexbuf = ref (Lexing.from_string "")

(* le o proximo token *)             
let prox () = tk := Lexico.token !lexbuf
                                 
let to_str tk =
  match tk with
    A -> "a"
  | B -> "b"
  | C -> "c"
  | D -> "d"
  | E -> "e"
  | F -> "f"
  | EOF -> "eof"

let erro esp =
  let msg = Printf.sprintf "Erro: esperava %s mas encontrei %s"
                            esp (to_str !tk)
  in
  failwith msg

let consome t = if (!tk == t) then prox() else erro (to_str t)
                                                   
let rec ntS () =
  match !tk with
    A    
   |C     
   |D     -> 
             let cmd1 = ntX() in
             let cmd2 = ntY() in
             let cmd3 = ntZ() in
             S (cmd1, cmd2, cmd3)
  | _ -> erro "a, c ou d"
and ntX () =
  match !tk with
     B
    |C
    |D
    |E
    |F    -> X_vazio 
    |A    -> let _ = consome A in 
             let cmd = ntX() in
             let _ = consome B in
             X (A, cmd, B)
    | _ -> erro "a"                               
and ntY () =
  match !tk with
    C    -> let _ = consome C in
            let cmd = ntY() in
            let cmd2 = ntZ() in
            let _ = consome C in
            let cmd3 = ntX() in
            Y (C,cmd,cmd2, C, cmd3)
   |D     -> let _ = consome D in
            Y_d (D)
   |_     -> erro "c ou d"
and ntZ () = 
  match !tk with
    E    -> let _ = consome E in
            let cmd = ntZ() in
            let cmd2 = ntY() in
            let _ = consome E in
            Z (E, cmd, cmd2, E)
   |F    -> let _ = consome F in
            Z_f (F)
   |_    -> erro "e ou f"                                           
                
let parser str =
  lexbuf := Lexing.from_string str;
  prox (); (* inicializa o token *)
  let arv = ntS () in
  match !tk with
    EOF -> let _ = Printf.printf "Ok!\n" in arv
  | _ -> erro "fim da entrada"

let teste str =
  let entrada = str
  in
  parser entrada
