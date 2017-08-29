type estado = int
type entrada = string
type simbolo = char
type posicao = int

type dfa = {
  transicao : estado -> simbolo -> estado;
  estado: estado;
  posicao: posicao
}

type token =
 | If
 | Then
 | Else
 | Id of string
 | Int of string
 | Print
 | APar
 | FPar
 | OP of string
 | Atrib
 | PV
 | Branco
 | EOF
 | For
 | While

type estado_lexico = {
   pos_inicial: posicao; (* posição inicial na string *)
   pos_final: posicao; (* posicao na string ao encontrar um estado final recente *)
   ultimo_final: estado; (* último estado final encontrado *)
   dfa : dfa;
   rotulo : estado -> entrada -> token
}

let estado_morto:estado = -1

let estado_inicial:estado = 0

let eh_letra (c:simbolo) = ('a' <= c && c <= 'z') || ('A' <= c && c <= 'Z')

let eh_digito (c:simbolo) = '0' <= c && c <= '9'

let eh_branco (c:simbolo) = c = ' ' || c = '\t' || c = '\n'

let pulou_linha (c:simbolo) = c = '\n' 

let eh_operador (c:simbolo) = c = '+' || c = '-' || c = '*' || c = '>' || c = '<' || c = '/'

let eh_estado_final (e:estado) (el:estado_lexico) = (*el é estado léxico*)
  let rotulo = el.rotulo in
  try
      let _ = rotulo e "" in true
  with _ -> false


let obtem_token_e_estado (str:entrada) (el:estado_lexico) = 
  let inicio =  el.pos_inicial 
  and fim = el.pos_final(*possição da string ao encontrar um estado final recente*)
  and estado_final = el.ultimo_final
  and rotulo = el.rotulo in
  let tamanho = fim - inicio + 1 in
  let lexema = String.sub str inicio tamanho in (*pega sub string*)
  let token = rotulo estado_final lexema in
  let proximo_el = { el with pos_inicial = fim + 1;
                             pos_final = -1;
                             ultimo_final = -1;
                             dfa = { el.dfa with estado = estado_inicial; (*volta pro estado inicial*)
                                                 posicao = fim + 1 }}
  in
   (token, proximo_el)


let rec analisador (str:entrada) (tam:int) (el:estado_lexico) =
  let posicao_atual = el.dfa.posicao
  and estado_atual = el.dfa.estado in
  if posicao_atual >= tam
  then
    if el.ultimo_final >= 0 (* último estado final encontrado *)
    then let token, proximo_el = obtem_token_e_estado str el in
      [token; EOF]
    else [EOF]
  else
    let simbolo = str.[posicao_atual]
    and transicao = el.dfa.transicao in
    let proximo_estado = transicao estado_atual simbolo in
    if proximo_estado = estado_morto
    then let token, proximo_el = obtem_token_e_estado str el in
      token :: analisador str tam proximo_el
    else
      let proximo_el =
        if eh_estado_final proximo_estado el
        then { el with pos_final = posicao_atual; (*atualiza o  ultimo final e vai para o proximo estado*)
                       ultimo_final = proximo_estado;
                       dfa = { el.dfa with estado = proximo_estado;
                                           posicao = posicao_atual + 1 }}
        else { el with dfa = { el.dfa with estado = proximo_estado;
                                           posicao = posicao_atual + 1 }}
      in
      analisador str tam proximo_el

let lexico (str:entrada) = 
  let trans (e:estado) (c:simbolo) = 
match (e,c) with    
    | (0, 'i') -> 1
    | (0, 't') -> 6
    | (0, 'e') -> 10
    | (0, 'p') -> 14
    | (0, 'f') -> 25
    | (0, 'w') -> 28
    | (0, '(') -> 19
    | (0, ')') -> 20
    | (0, ';') -> 22
    | (0, ':') -> 23
    | (0, '#') -> 33
    | (0, _) when eh_operador c -> 21
    | (0, _) when eh_letra c -> 3
    | (0, _) when eh_digito c -> 4
    | (0, _) when eh_branco c -> 5 
    | (0, _) -> failwith ("Erro lexico: caracter desconhecido " ^ Char.escaped c)
    
    | (1, 'f') -> 2
    | (1, _) when eh_letra c || eh_digito c -> 3
    
    | (2, _) when eh_letra c || eh_digito c -> 3
    
    | (3, _) when eh_letra c || eh_digito c -> 3
    
    | (4, _) when eh_digito c -> 4
    
    | (5, _) when eh_branco c -> 5
    
    | (6, 'h') -> 7
    | (6, _) when eh_letra c || eh_digito c -> 3
   
    | (7, 'e') -> 8
    | (7, _)  when eh_letra c || eh_digito c -> 3
    
    | (8, 'n') -> 9  
    | (8, _)  when eh_letra c || eh_digito c -> 3

    | (9, _)  when eh_letra c || eh_digito c -> 3

    | (10, 'l') -> 11
    | (10, _) when eh_letra c || eh_digito c -> 3
    
    | (11, 's') -> 12
    | (11, _)  when eh_letra c || eh_digito c -> 3
    
    | (12, 'e') -> 13 
    | (12, _)  when eh_letra c || eh_digito c -> 3
    
    | (13, _)  when eh_letra c || eh_digito c -> 3

    | (14, 'r') -> 15
    | (14, _) when eh_letra c || eh_digito c -> 3
    
    | (15, 'i') -> 16
    | (15, _)  when eh_letra c || eh_digito c -> 3
    
    | (16, 'n') -> 17 
    | (16, _)  when eh_letra c || eh_digito c -> 3
    
    | (17, 't') -> 18
    | (17, _)  when eh_letra c || eh_digito c -> 3
    
    | (18, _)  when eh_letra c || eh_digito c -> 3

    | (23,'=') -> 24

    | (25, 'o') -> 26
    | (25, _)  when eh_letra c || eh_digito c -> 3

    | (26, 'r') -> 27
    | (27, _)  when eh_letra c || eh_digito c -> 3

    | (27, _)  when eh_letra c || eh_digito c -> 3

    | (28, 'h') -> 29
    | (28, _)  when eh_letra c || eh_digito c -> 3
    
    | (29, 'i') -> 30
    | (29, _)  when eh_letra c || eh_digito c -> 3

    | (30, 'l') -> 31
    | (30, _)  when eh_letra c || eh_digito c -> 3
    
    | (31, 'e') -> 32
    | (31, _)  when eh_letra c || eh_digito c -> 3

    | (32, _)  when eh_letra c || eh_digito c -> 3

    | (33, '#') -> 34

    | (34, _) when pulou_linha c -> 0
    | (34, _) -> 34


    | _ -> estado_morto
 and rotulo e str =
  match e with
  | 2 -> If
  | 1 
  | 6
  | 7
  | 8
  | 10
  | 11
  | 12
  | 14
  | 15
  | 16
  | 17
  | 25
  | 26
  | 28
  | 29
  | 30
  | 31
  | 3 -> Id str
  | 4 -> Int str
  | 5 -> Branco
  | 9 -> Then
  | 13 -> Else
  | 18 -> Print
  | 19 -> APar
  | 20 -> FPar
  | 21 -> OP str
  | 22 -> PV
  | 24 -> Atrib
  | 27 -> For
  | 32 -> While
  | _ -> failwith ("Erro lexico: sequencia desconhecida " ^ str)
in let dfa = { transicao = trans;
               estado = estado_inicial;
               posicao = 0 }
in let estado_lexico = {
  pos_inicial = 0;
  pos_final = -1;
  ultimo_final = -1;
  rotulo = rotulo;
  dfa = dfa
} in
  analisador str (String.length str) estado_lexico