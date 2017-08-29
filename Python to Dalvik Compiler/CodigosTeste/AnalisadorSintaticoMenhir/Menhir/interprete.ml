module Amb = AmbInterp
module A = Ast
module S = Sast
module T = Tast

exception Valor_de_retorno of T.expressao

let obtem_nome_tipo_var exp = let open T in
  match exp with
    | EXPVAR (nome,tipo) -> (nome,tipo)
    | _                  -> failwith "obtem_nome_tipo_var1: nao eh variavel"
    
let pega_int exp =
  match exp with
  |  T.EXPINT (i,_) -> i
  | _ -> failwith "pega_int: nao eh inteiro"

let pega_float exp = match exp with
  | T.EXPFLOAT (f,_)-> f
  | _               -> failwith "pega_float: nao eh inteiro"

let pega_str exp =
  match exp with
  |  T.EXPSTRING (s,_) -> s
  | _ -> failwith "pega_string: nao eh string"

let pega_bool exp =
  match exp with
  |  T.EXPBOOL (b,_) -> b
  | _ -> failwith "pega_bool: nao eh booleano"

type classe_op = Aritmetico | Relacional | Logico 

let classifica op =
  let open A in
  match op with
    OR
  | NEGACAO
  | AND  -> Logico
  | MENORQ
  | MAIORQ
  | MAIORIGUALQ
  | MENORIGUALQ
  | EHIGUAL
  | EHDIFERENTE -> Relacional
  | ADICAO
  | SUBTRACAO
  | MULTIPLICACAO
  | MOD
  | DIVISAO -> Aritmetico


let rec interpreta_exp amb exp =
  let open A in
  let open T in
  match exp with
  | EXPFLOAT  _
  | EXPINT    _
  | EXPSTRING _
  | EXPBOOL   _   -> exp
  | EXPVAR (nome, tipo) ->
      (match (Amb.busca amb nome) with
        | Amb.EntVar (_, v) ->
          (match v with
            | Some valor -> valor
            | None       -> failwith "variável nao inicializada: "
          )
        |  _ -> failwith "interpreta_exp: expvar"
      )  
  | EXPOPB ((op,top), (esq, tesq), (dir,tdir)) ->
    let  vesq = interpreta_exp amb esq
    and vdir = interpreta_exp amb dir in

    let interpreta_aritmetico () =
    (
      match tesq with
    | INTEIRO ->
       (
        match op with
        | ADICAO  -> EXPINT (pega_int vesq + pega_int vdir, top)
        | SUBTRACAO -> EXPINT (pega_int vesq - pega_int vdir, top)
        | MULTIPLICACAO  -> EXPINT (pega_int vesq * pega_int vdir, top)
        | DIVISAO   -> EXPINT (pega_int vesq / pega_int vdir, top)
        | _     -> failwith "interpreta_aritmetico"
       )
     | _ -> failwith "interpreta_aritmetico"
    )
    and interpreta_relacional () =
        (match tesq with
          | INTEIRO ->
            (match op with
              | MAIORIGUALQ -> EXPBOOL (pega_int vesq >= pega_int vdir, top)
              | MENORIGUALQ -> EXPBOOL (pega_int vesq <= pega_int vdir, top)
              | MENORQ      -> EXPBOOL (pega_int vesq <  pega_int vdir, top)
              | MAIORQ      -> EXPBOOL (pega_int vesq >  pega_int vdir, top)
              | EHIGUAL      -> EXPBOOL (pega_int vesq == pega_int vdir, top)
              | EHDIFERENTE      -> EXPBOOL (pega_int vesq != pega_int vdir, top)
              | _          -> failwith "interpreta_relacional"
            )
          | STRING ->
            (match op with
              | MAIORIGUALQ -> EXPBOOL (pega_str vesq >= pega_str vdir, top)
              | MENORIGUALQ -> EXPBOOL (pega_str vesq <= pega_str vdir, top)
              | MENORQ      -> EXPBOOL (pega_str vesq <  pega_str vdir, top)
              | MAIORQ      -> EXPBOOL (pega_str vesq >  pega_str vdir, top)
              | EHIGUAL      -> EXPBOOL (pega_str vesq == pega_str vdir, top)
              | EHDIFERENTE      -> EXPBOOL (pega_str vesq != pega_str vdir, top)
              | _          -> failwith "interpreta_relacional"
            )
          | BOOLEAN ->
            (match op with
              | MAIORIGUALQ -> EXPBOOL (pega_bool vesq >= pega_bool vdir, top)
              | MENORIGUALQ -> EXPBOOL (pega_bool vesq <= pega_bool vdir, top)
              | MENORQ      -> EXPBOOL (pega_bool vesq <  pega_bool vdir, top)
              | MAIORQ      -> EXPBOOL (pega_bool vesq >  pega_bool vdir, top)
              | EHIGUAL      -> EXPBOOL (pega_bool vesq == pega_bool vdir, top)
              | EHDIFERENTE      -> EXPBOOL (pega_bool vesq != pega_bool vdir, top)
              | _          -> failwith "interpreta_relacional"
            )
          | REAL ->
            (match op with
              | MAIORIGUALQ -> EXPBOOL (pega_float vesq == pega_float vdir, top)
              | MENORIGUALQ -> EXPBOOL (pega_float vesq == pega_float vdir, top)
              | MENORQ      -> EXPBOOL (pega_float vesq <  pega_float vdir, top)
              | MAIORQ      -> EXPBOOL (pega_float vesq >  pega_float vdir, top)
              | EHIGUAL      -> EXPBOOL (pega_float vesq == pega_float vdir, top)
              | EHDIFERENTE      -> EXPBOOL (pega_float vesq != pega_float vdir, top)
              | _          -> failwith "interpreta_relacional"
            )
          | _ ->  failwith "interpreta_relacional"
        )

    and interpreta_logico () =
      (match tesq with
       | BOOLEAN ->
         (match op with
          | OR  ->  EXPBOOL (pega_bool vesq || pega_bool vdir, top)
          | AND ->  EXPBOOL (pega_bool vesq && pega_bool vdir, top)
          | _ ->  failwith "interpreta_logico"
         )
       | _ ->  failwith "interpreta_logico"
      )
    
    in
    let valor = (match (classifica op) with
          Aritmetico -> interpreta_aritmetico ()
        | Relacional -> interpreta_relacional ()
        | Logico     -> interpreta_logico ()
      )
    in
      valor

  | EXPOPU ((op, top), (exp, texp)) ->
      let vexp = interpreta_exp amb exp in
      let interpreta_not () = 
       (match texp with
        | A.BOOLEAN  -> EXPBOOL (not (pega_bool vexp), top)
        | _          -> failwith "Operador unario indefinido")
      and interpreta_negativo () = 
       (match texp with
        | A.INTEIRO   -> EXPINT   (-1   *  pega_int   vexp, top)
        | A.REAL -> EXPFLOAT (-1.0 *. pega_float vexp, top)
        | _           -> failwith "Operador unario indefinido")
      in
      let valor =
       (match op with
          | NEGACAO   -> interpreta_not ()
          | SUBTRACAO -> interpreta_negativo ()
          | _     -> failwith "Operador unario indefinido")
      in  valor
  | EXPCALL (id, args, tipo) ->
    let open Amb in
      (match (Amb.busca amb id) with
        | Amb.EntFun {tipo_fn; formais; corpo} ->
           let vargs    = List.map  (interpreta_exp amb) args in
           let vformais = List.map2 (fun (n,t) v -> (n, t, Some v)) formais vargs
           in  interpreta_fun amb vformais corpo
        | _ -> failwith "interpreta_exp: expchamada"
      )
  | EXPNONE -> T.EXPNONE

and interpreta_cmd amb cmd =
  let open A in
  let open T in
  match cmd with
    RETORNO exp ->
    (* Levantar uma exceção foi necessária pois, pela semântica do comando de   *)
    (* retorno, sempre que ele for encontrado em uma função, a computação       *)
    (* deve parar retornando o valor indicado, sem realizar os demais comandos. *)
    (match exp with
      (* Se a função não retornar nada, então retorne ExpVoid *)
      | None -> raise (Valor_de_retorno EXPNONE)
      | Some e ->
        (* Avalia a expressão e retorne o resultado *)
        let e1 = interpreta_exp amb e in
        raise (Valor_de_retorno e1))
  | CONDICAOIF (teste, entao, senao) ->
      let teste1 = interpreta_exp amb teste in
      (match teste1 with
        | EXPBOOL (true,_) ->
        (* Interpreta cada comando do bloco 'então' *)
        List.iter (interpreta_cmd amb) entao
        | _ ->
          (* Interpreta cada comando do bloco 'senão', se houver *)
          (match senao with
            | None -> ()
            | Some bloco -> interpreta_cmd amb bloco))
  | CONDICAOElifElse comandos ->
        List.iter (interpreta_cmd amb ) comandos
  | ATRIBUICAO (elem, exp) ->
      let resp = interpreta_exp amb exp in       
        (match elem with
          | T.EXPVAR (id,tipo) ->
           (try
              begin 
                match (Amb.busca amb id) with
                  | Amb.EntVar (t, _) -> Amb.atualiza_var amb id tipo (Some resp)
                  | Amb.EntFun _      -> failwith "falha na atribuicao"
              end 
            with Not_found -> 
              let _ = Amb.insere_local amb id tipo None in 
              Amb.atualiza_var amb id tipo (Some resp))
          | _ -> failwith "Falha CmdAtrib"
        )
  | CHAMADADEFUNCAO   exp -> ignore( interpreta_exp amb exp )
  | LEIAI exp
  | LEIAF exp
  | LEIAS exp ->
    (* Obtem os nomes e os tipos de cada um dos argumentos *)
    let nt = obtem_nome_tipo_var exp in
    let leia_var (nome,tipo) =
     let _ = 
       (try
          begin 
            match (Amb.busca amb nome) with
              | Amb.EntVar (_,_) -> ()
              | Amb.EntFun _     -> failwith "falha no input"
          end 
        with Not_found -> 
          let _ = Amb.insere_local amb nome tipo None in ()
        )
      in
      let valor = 
       (match tipo with
          | INTEIRO  -> T.EXPINT  (read_int   ()   , tipo)
          | STRING   -> T.EXPSTRING   (read_line  ()   , tipo)
          | REAL     -> T.EXPFLOAT    (read_float ()   , tipo)
          | _        -> failwith "Fail input")
      in  Amb.atualiza_var amb nome tipo (Some valor)
    in leia_var nt
  | PRINT exp ->
    let resp = interpreta_exp amb exp in
      (match resp with
        | T.EXPINT   (n,_) -> print_int    n
        | T.EXPFLOAT (n,_) -> print_float  n
        | T.EXPSTRING   (n,_) -> print_string n
        | T.EXPBOOL (b,_) ->
         let _ = print_string (if b then "true" else "false")
         in print_string " "
        | _ -> failwith "Fail print"
      )
  | WHILELOOP (cond, cmds) -> 
        let rec laco cond cmds = 
          let condResp = interpreta_exp amb cond in
                (match condResp with
                  | EXPBOOL (true,_) ->
                      (* Interpreta cada comando do bloco 'então' *)
                      let _ = List.iter (interpreta_cmd amb) cmds in 
                        laco cond cmds
                  | _ -> ())
        in laco cond cmds
  | FORLOOP (idt, int_de ,int_ate, bloco) ->
    let (elem1,tipo) = obtem_nome_tipo_var idt in
    let rec executa_para amb int_de int_ate bloco elem1 tipo =
           if (int_de) <= (int_ate) 
           then begin
                   (*Executa o bloco de código: *)
                   List.iter (interpreta_cmd amb) bloco;
                   (*Atualiza o valor da variavel: *)
                   Amb.atualiza_var amb elem1 tipo (Some ( EXPINT( (int_de + 1 ),INTEIRO) ) );
                   (*Chamada recursiva:*)
                   executa_para amb (int_de + 1) int_ate bloco elem1 tipo;
                end in
    executa_para amb (pega_int int_de) (pega_int int_ate) bloco elem1 tipo 

and interpreta_fun amb fn_formais fn_corpo =
  let open A in
 (* Estende o ambiente global, adicionando um ambiente local *)
  let ambfn = Amb.novo_escopo amb in
  (* Associa os argumento
  s aos parâmetros e insere no novo ambiente *)
  let insere_parametro (n,t,v) = Amb.insere_param ambfn n t v in
  let _ = List.iter insere_parametro fn_formais in
      (* Interpreta cada comando presente no corpo da função usando o novo *)
      (* ambiente                                                          *)
      try
        let _ = List.iter (interpreta_cmd ambfn) fn_corpo in T.EXPNONE
      with
        Valor_de_retorno expret -> expret

let insere_declaracao_fun amb dec =
  let open A in
    match dec with
      | Funcao {fn_nome; fn_tiporet; fn_formais; fn_corpo} ->
        let nome = fst fn_nome in
        let formais = List.map (fun (n,t) -> ((fst n), t)) fn_formais in
        Amb.insere_fun amb nome formais fn_tiporet fn_corpo
      | _ -> failwith "Erro de declaacao de funcao"


let fn_predefs = let open A in [
    ("inputi", [("x", INTEIRO  )], NONE, []);
    ("inputf", [("x", REAL     )], NONE, []);
    ("inputs", [("x", STRING   )], NONE, []);
    
]

(* insere as funções pré definidas no ambiente global *)
let declara_predefinidas amb =
  List.iter (fun (n,ps,tr,c) -> Amb.insere_fun amb n ps tr c) fn_predefs

let interprete ast =
  let open Amb in
  let amb_global = Amb.novo_amb [] in
  let _ = declara_predefinidas amb_global in
  let A.Programa instr = ast in
    let decs_funs = List.filter (fun x -> 
    (match x with
    | A.Funcao _ -> true
    |             _ -> false)) instr in
    let _ = List.iter (insere_declaracao_fun amb_global) decs_funs in
      (try begin
        (match (Amb.busca amb_global "main") with
            | Amb.EntFun { tipo_fn ; formais ; corpo } ->
              let vformais = List.map (fun (n,t) -> (n, t, None)) formais in
              let _        = interpreta_fun amb_global vformais corpo in ()
            | _ -> failwith "variavel declarada como 'main'")
       end with Not_found -> failwith "Funcao main nao declarada ")
      

