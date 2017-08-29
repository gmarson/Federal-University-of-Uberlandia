module Tab = Tabsimb
module A = Ast
module T = Tast

type entrada_fn = {
  tipo_fn:  A.tipo;
  formais: (A.identificador * A.tipo) list;
  corpo: T.expressao A.comandos
}

type entrada = EntFun of entrada_fn
            |  EntVar of A.tipo * (T.expressao option)


type t = {
  ambv : entrada Tab.tabela
}

let novo_amb xs = { ambv = Tab.cria xs }

let novo_escopo amb = { ambv = Tab.novo_escopo amb.ambv }

let busca amb ch = Tab.busca amb.ambv ch

let atualiza_var amb ch t v =
  Tab.atualiza amb.ambv ch (EntVar (t,v))

let insere_local amb nome t v =
  Tab.insere amb.ambv nome (EntVar (t,v))

let insere_param amb nome t v =
  Tab.insere amb.ambv nome (EntVar (t,v))

let insere_fun amb nome params resultado corpo =
  let ef = EntFun { tipo_fn = resultado;
                    formais = params;
                    corpo = corpo }
  in Tab.insere amb.ambv nome ef
