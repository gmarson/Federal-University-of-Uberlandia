module Tab = Tabsimb
module A = Ast

type entrada_fn = { tipo_fn:  A.tipo;
                    formais: (string * A.tipo) list;
}

type entrada =  EntFun of entrada_fn
             |  EntVar of A.tipo

type t = {
  ambv : entrada Tab.tabela
}

let novo_amb xs = { ambv = Tab.cria xs }

let novo_escopo amb = { ambv = Tab.novo_escopo amb.ambv }

let busca amb ch = Tab.busca amb.ambv ch

let insere_local amb ch t =
  Tab.insere amb.ambv ch (EntVar t)

let insere_param amb ch t =
  Tab.insere amb.ambv ch (EntVar t)

let insere_fun amb nome params resultado =
  let ef = EntFun { tipo_fn = resultado;
                    formais = params }
  in Tab.insere amb.ambv nome ef
