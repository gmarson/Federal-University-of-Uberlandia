type estado = int
type estados = estado list
type simbolo = char
type entrada = simbolo list

(*essa funcao transforma cada caracter da entrada em uma posicao na lista*)
let explode str =
  let n = String.length str in
  let rec explode' i =
    if i >= n then ([]:entrada)
    else str.[i] :: explode' (i+1)
  in
    explode' 0

(*Ve se eh letra*)
let eh_letra (c:simbolo) =
  ('a' <= c && c <= 'z') ||  ('A' <= c && c <= 'Z')

(*Ve se eh digito*)
let eh_digito (c:simbolo) =  '0' <= c && c <= '9'

(* Solução 1 - funções recursivas *)

let rec e0 (cs:entrada) =
  match cs with
  | c :: resto when eh_letra c -> e1 resto
  | '_' :: resto -> e2 resto
  | _ -> false
and e1 cs =
  match cs with
  | [] -> true
  | c :: resto when eh_letra c || eh_digito c -> e1 resto
  | '_' :: resto -> e1 resto
  | _ -> false
and e2 cs =
  match cs with
  | c :: resto when eh_letra c -> e1 resto
  | '_' :: resto -> e2 resto
  | _ -> false

let rec eh_identificador str = e0 (explode str)

(* Solução 2 - função de transição *)
let estado_morto:estado = 10000

let transicao (s:estado) (c:simbolo) =
  match s with
  | 0 -> if (c = 'i') then 1 else estado_morto
  | 1 -> if (c = 'f') then 2 else estado_morto
  | _ -> estado_morto

let rec dfa (s:estado) (str:entrada) =
  match str with
   c::str1 -> dfa (transicao s c) str1
  | [] -> s = 2

let aceita str =
  let entrada = explode str in
  dfa 0 entrada

(* Solução 3 - função de transição com vários estados finais *)

let rec dfa2 trans (s:estado) (finais:estados) (str:entrada) =
  match str with
   c::str1 -> dfa (trans s c) str1
  | [] -> List.mem s finais
 
let aceita2 str =
  let entrada = explode str in
  let finais = [2] in 
  dfa2 transicao 0 finais entrada
