module Amb = Ambiente
module A = Ast
module S = Sast
module T = Tast

let rec posicao exp = 
  let open S in
  match exp with 
  | EXPVAR       (_,pos)      -> pos
  | EXPINT       (_,pos)      -> pos
  | EXPSTRING    (_,pos)      -> pos
  | EXPBOOL      (_,pos)      -> pos
  | EXPFLOAT     (_,pos)      -> pos
  | EXPOPB    ((_,pos),_,_) -> pos
  | EXPOPU    ((_,pos),_)   -> pos
  | EXPCALL     ((_,pos),_)   -> pos
  

type classe_op = Aritmetico | Relacional | Logico

let classifica op =
  let open A in
    match op with
      ADICAO
    | SUBTRACAO
    | MULTIPLICACAO
    | DIVISAO
    | MOD       -> Aritmetico
    | MAIORQ
    | MENORQ
    | MAIORIGUALQ
    | MENORIGUALQ
    | EHIGUAL
    | EHDIFERENTE   -> Relacional
    | AND
    | NEGACAO
    | OR  -> Logico

let msg_erro_pos pos msg =
  let open Lexing in
  let lin = pos.pos_lnum
  and col = pos.pos_cnum - pos.pos_bol - 1 in
  Printf.sprintf "Semantico -> linha %d, coluna %d: %s" lin col msg

(*  argumento nome é do tipo S.tipo  *)
let msg_erro nome msg =
  let pos = snd nome in 
  msg_erro_pos pos msg

let nome_tipo t =
  let open A in
    match t with
      INTEIRO     -> "inteiro"
    | STRING     -> "string"
    | BOOLEAN    -> "booleano"
    | REAL   -> "real"
    | NONE    -> "vazio"

let mesmo_tipo pos msg tinf tdec =
  if tinf <> tdec then
    let msg = Printf.sprintf msg (nome_tipo tinf) (nome_tipo tdec) in
    failwith (msg_erro_pos pos msg)

let rec infere_exp amb exp =
  match exp with

  | S.EXPINT   i -> (T.EXPINT   (fst i, A.INTEIRO  ), A.INTEIRO  )
  | S.EXPSTRING   s -> (T.EXPSTRING   (fst s, A.STRING  ), A.STRING  )
  | S.EXPBOOL  b -> (T.EXPBOOL  (fst b, A.BOOLEAN ), A.BOOLEAN )
  | S.EXPFLOAT f -> (T.EXPFLOAT (fst f, A.REAL), A.REAL)
  | S.EXPVAR variavel ->
      let nome = fst variavel in
        (try begin
            (match (Amb.busca amb nome) with
            | Amb.EntVar tipo -> (T.EXPVAR (nome, tipo), tipo)
            | Amb.EntFun _    -> 
                let msg = "Nome de funcao usado como nome de variavel: "^nome in
                  failwith (msg_erro variavel msg))
        end with Not_found ->
          let msg = "Variavel "^nome^" nao declarada" in
            failwith (msg_erro variavel msg))
  | S.EXPOPB (op, exp_esq, exp_dir) ->
      let (esq, tesq) = infere_exp amb exp_esq
      and (dir, tdir) = infere_exp amb exp_dir in
      let verifica_aritmetico () = 
        (match tesq with
        | A.INTEIRO
        | A.REAL ->
            let _ = mesmo_tipo (snd op)
                    "Operando esquerdo do tipo %s, mas o tipo do direito eh %s"
                    tesq tdir
            in tesq (* Tipo inferido para a operação *)
        | demais      ->
            let msg = "O tipo "^
                      (nome_tipo demais)^
                      " nao eh valido em um operador aritmético" in
              failwith (msg_erro op msg))
      and verifica_relacional () =
        (match tesq with
        | A.INTEIRO
        | A.STRING
        | A.BOOLEAN
        | A.REAL -> 
            (let _ = mesmo_tipo (snd op)
                    "Operando esquerdo do tipo %s, mas o tipo do direito eh %s"
                    tesq tdir
            in A.BOOLEAN) (* Tipo inferido para a operação *)
        | demais      ->
            (let msg = "O tipo "^
                      (nome_tipo demais)^
                      " nao eh valido em um operador relacional" in
              failwith (msg_erro op msg)))
      and verifica_logico () = 
        (match tesq with
        | A.BOOLEAN ->
            let _ = mesmo_tipo (snd op)
                    "Operando esquerdo do tipo %s, mas o tipo do direito eh %s"
                    tesq tdir
            in A.BOOLEAN (* Tipo inferido para a operação *)
        | demais ->
            let msg = "O tipo "^
                      (nome_tipo demais)^
                      " nao eh valido em um operador logico" in
              failwith (msg_erro op msg))
      in
      let oper = fst op in
      let tinf = 
         (match (classifica oper) with
        | Aritmetico -> verifica_aritmetico ()
        | Relacional -> verifica_relacional ()
        | Logico     -> verifica_logico () )
      in (T.EXPOPB ((oper, tinf), (esq, tesq), (dir, tdir)), tinf)
  | S.EXPOPU (op, exp) ->
    let (exp, texp) = infere_exp amb exp in
    let verifica_not () = 
      match texp with
      | A.BOOLEAN ->
          let _ = mesmo_tipo (snd op)
                  "O operando eh do tipo %s, mas espera-se um %s"
                  texp A.BOOLEAN
          in A.BOOLEAN
      | demais     ->
          let msg = "O tipo "^
                      (nome_tipo demais)^
                      " nINTEIROao eh valido para o operador not" in
              failwith (msg_erro op msg)
    and verifica_negativo () = 
      match texp with
      | A.REAL ->
          let _ = mesmo_tipo (snd op)
                  "O operando eh do tipo %s, mas espera-se um %s"
                  texp A.REAL
          in A.REAL
      | A.INTEIRO ->
          let _ = mesmo_tipo (snd op)
                  "O operando eh do tipo %s, mas espera-se um %s"
                  texp A.INTEIRO
          in A.INTEIRO
      | demais     ->
          let msg = "O tipo "^
                      (nome_tipo demais)^
                      " nao eh valido para o operador menos" in
              failwith (msg_erro op msg)
    in
    let oper = fst op in
    let tinf =
      let open A in
        match oper with
        | NEGACAO   -> verifica_not ()
        | SUBTRACAO -> verifica_negativo ()
        | demais->
            let msg = "Operador unario indefinido"
            in failwith (msg_erro op msg)
    in  (T.EXPOPU ((oper, tinf), (exp, texp)), tinf)
  | S.EXPCALL (nome, args) ->
    let rec verifica_parametros ags ps fs =
      match (ags, ps, fs) with
      | (a::ags), (p::ps), (f::fs) ->
          let _ = mesmo_tipo (posicao a)
                  "O parametro eh do tipo %s mas deveria ser do tipo %s" 
                  p f
          in verifica_parametros ags ps fs
      | [], [], [] -> ()
      | _ -> failwith (msg_erro nome "Numero incorreto de parametros")
    in
    let id = fst nome in
      try
        begin
          let open Amb in
            match (Amb.busca amb id) with
            | Amb.EntFun {tipo_fn; formais} ->
              let targs    = List.map (infere_exp amb) args
              and tformais = List.map snd formais in
              let _ = verifica_parametros args (List.map snd targs) tformais in
                (T.EXPCALL (id, (List.map fst targs), tipo_fn), tipo_fn)
            | Amb.EntVar _ -> (* Se estiver associada a uma variável, falhe *)
              let msg = id ^ " eh uma variavel e nao uma funcao" in
                failwith (msg_erro nome msg)
        end
      with Not_found ->
        let msg = "Nao existe a funcao de nome " ^ id in
        failwith (msg_erro nome msg)
          
let rec verifica_cmd amb tiporet cmd =
  let open A in
    match cmd with
    | CHAMADADEFUNCAO  exp -> let (exp,tinf) = infere_exp amb exp in CHAMADADEFUNCAO exp
    | PRINT exp -> let expt = infere_exp amb exp in PRINT (fst expt)
    | WHILELOOP (cond, cmds) -> 
        let (expCond, expT ) = infere_exp amb cond in
        let comandos_tipados = 
          (match expT with 
            | A.BOOLEAN -> List.map (verifica_cmd amb tiporet) cmds
            | _ -> let msg = "Condicao deve ser tipo Bool" in
                        failwith (msg_erro_pos (posicao cond) msg))
        in WHILELOOP (expCond,comandos_tipados)
    | LEIAI exp -> 
        (match exp with 
          S.EXPVAR (id,pos) -> 
           (try
              begin 
                (match (Amb.busca amb id) with
                    Amb.EntVar tipo ->
                      let expt = infere_exp amb exp in  
                      let _ = mesmo_tipo pos
                        "inputi com tipos diferentes: %s = %s"
                        tipo (snd expt) in 
                        LEIAI (fst expt)
                  | Amb.EntFun _ ->
                      let msg = "nome de funcao usado como nome de variavel: " ^ id in
                      failwith (msg_erro_pos pos msg) )
              end 
            with Not_found -> 
              let _ = Amb.insere_local amb id A.INTEIRO in
              let expt = infere_exp amb exp in  
              LEIAI (fst expt) )
          | _ -> failwith "Falha Inputi"
        )
    | LEIAF exp -> 
        (match exp with 
          S.EXPVAR (id,pos) -> 
           (try
              begin 
                (match (Amb.busca amb id) with
                    Amb.EntVar tipo ->
                      let expt = infere_exp amb exp in  
                      let _ = mesmo_tipo pos
                        "Inputf com tipos diferentes: %s = %s"
                        tipo (snd expt) in 
                        LEIAF (fst expt)
                  | Amb.EntFun _ ->
                      let msg = "nome de funcao usado como nome de variavel: " ^ id in
                      failwith (msg_erro_pos pos msg) )
              end 
            with Not_found -> 
              let _ = Amb.insere_local amb id A.REAL in
              let expt = infere_exp amb exp in  
              LEIAF (fst expt) )
          | _ -> failwith "Falha Inputf"  
        )
    | LEIAS exp -> 
        (match exp with 
          S.EXPVAR (id,pos) -> 
           (try
              begin 
                (match (Amb.busca amb id) with
                    Amb.EntVar tipo ->
                      let expt = infere_exp amb exp in  
                      let _ = mesmo_tipo pos
                        "Inputs com tipos diferentes: %s = %s"
                        tipo (snd expt) in 
                        LEIAS (fst expt)
                  | Amb.EntFun _ ->
                      let msg = "nome de funcao usado como nome de variavel: " ^ id in
                      failwith (msg_erro_pos pos msg) )
              end 
            with Not_found -> 
              let _ = Amb.insere_local amb id A.STRING in
              let expt = infere_exp amb exp in  
              LEIAS (fst expt) )
          | _ -> failwith "Falha Inputs"  
        )
    | ATRIBUICAO (elem, exp) ->
        let (var1, tdir) = infere_exp amb exp in       
        ( match elem with 
          S.EXPVAR (id,pos) -> 
           (try
              begin 
                (match (Amb.busca amb id) with
                    Amb.EntVar tipo -> 
                      let _ = mesmo_tipo pos
                        "Atribuicao com tipos diferentes: %s = %s"
                        tipo tdir in 
                        ATRIBUICAO (T.EXPVAR (id, tipo), var1)
                  | Amb.EntFun _ ->
                      let msg = "nome de funcao usado como nome de variavel: " ^ id in
                      failwith (msg_erro_pos pos msg) )
              end 
            with Not_found -> 
              let _ = Amb.insere_local amb id tdir in 
              ATRIBUICAO (T.EXPVAR (id, tdir), var1))
          | _ -> failwith "Falha CmdAtrib"
        )
    | RETORNO exp ->
      (match exp with
     (* Se a função não retornar nada, verifica se ela foi declarada como void *)
       None ->
       let _ = mesmo_tipo (Lexing.dummy_pos)
                   "O tipo retornado eh %s mas foi declarado como %s"

                   NONE tiporet
       in RETORNO None
        | Some e ->

       (* Verifica se o tipo inferido para a expressão de retorno confere com o *)
       (* tipo declarado para a função.                                         *)
           let (e1,tinf) = infere_exp amb e in
           let _ = mesmo_tipo (posicao e)
                              "O tipo retornado eh %s mas foi declarado como %s"
                              tinf tiporet
           in RETORNO (Some e1)
      )
    | CONDICAOElifElse comandos ->
        let comandos = List.map (verifica_cmd amb tiporet) comandos in
          CONDICAOElifElse comandos
    | CONDICAOIF (teste, entao, senao) ->
        let (teste1,tinf) = infere_exp amb teste in
        let _ = mesmo_tipo (posicao teste)
                "O teste do if deveria ser do tipo %s e nao %s"
                BOOLEAN tinf in
        let entao1 = List.map (verifica_cmd amb tiporet) entao in
        let senao1 =
          match senao with
          | None       -> None
          | Some bloco -> let c = verifica_cmd amb tiporet bloco in Some c
        in CONDICAOIF (teste1, entao1, senao1)
    | FORLOOP (idt, int_de,int_ate,bloco) ->
      let (idt1,tinf) = infere_exp amb idt in
      let (int_de1,tinf1) = infere_exp amb int_de in
      let (int_ate1,tinf2) = infere_exp amb int_ate in
      (* O tipo inferido para o identificador deve ser int *)
      let _ = mesmo_tipo (posicao idt)
               "A variável deveria ser do  tipo %s e nao %s"
               INTEIRO tinf in
      (* O tipo inferido para os ints devem ser inteiros *)
      let _ = mesmo_tipo (posicao int_de)
               "O comando DE deveria ser do  tipo %s e nao %s"
               INTEIRO tinf1 in
      let _ = mesmo_tipo (posicao int_de)
               "O comando DE deveria ser do tipo %s e nao %s"
               INTEIRO tinf2 in
      (* Verifica a validade de cada comando do bloco  *)
      let bloco1 = List.map (verifica_cmd amb tiporet) bloco in
        FORLOOP (idt1, int_de1,int_ate1,bloco1)

and verifica_fun amb ast =
  let open A in
  match ast with
  | Funcao {fn_nome; fn_tiporet; fn_formais; fn_corpo} ->
    (* Estende o ambiente global, adicionando um ambiente local *)
    let ambfn = Amb.novo_escopo amb in
    (* Insere os parâmetros no novo ambiente *)
    let insere_parametro (v,t) = Amb.insere_param ambfn (fst v) t in
      let _ = List.iter insere_parametro fn_formais in
    (* Verifica cada comando presente no corpo da função usando o novo ambiente *)
    let corpo_tipado = List.map (verifica_cmd ambfn fn_tiporet) fn_corpo in
      Funcao {fn_nome; fn_tiporet; fn_formais; fn_corpo = corpo_tipado}
  | ACMD _ -> failwith "Instrucao invalida"

let rec verifica_dup xs =
  match xs with
  | [] -> []
  | (nome,t)::xs ->
    let id = fst nome in
    if (List.for_all (fun (n,t) -> (fst n) <> id) xs)
    then (id, t) :: verifica_dup xs
    else let msg = "Parametro duplicado " ^ id in
      failwith (msg_erro nome msg)

let insere_declaracao_fun amb dec =
  let open A in
    match dec with
    | Funcao {fn_nome; fn_tiporet; fn_formais; fn_corpo} ->
      let formais = verifica_dup fn_formais in
      let nome = fst fn_nome in
      Amb.insere_fun amb nome formais fn_tiporet
    | ACMD _ -> failwith "Instrucao invalida"

let fn_predefs = 
  let open A in [
    ("inputi", [("x", INTEIRO  )], NONE);
    ("inputs", [("x", STRING  )], NONE);
    ("inputf", [("x", REAL)], NONE)]

let declara_predefinidas amb =
  List.iter (fun (n,ps,tr) -> Amb.insere_fun amb n ps tr) fn_predefs

let semantico ast =
  let amb_global = Amb.novo_amb [] in
  let _ = declara_predefinidas amb_global in
  let A.Programa instr = ast in
  let decs_funs = List.filter(fun x -> 
    (match x with
    | A.Funcao _ -> true
    | _          -> false)) instr in
    let _ = List.iter (insere_declaracao_fun amb_global) decs_funs in
      let decs_funs = List.map (verifica_fun amb_global) decs_funs in
      (A.Programa decs_funs, amb_global)

