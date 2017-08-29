type entrada_fn = { tipo_fn:  Ast.tipo;
                    formais: (string * Ast.tipo) list;
										(*      locais: (string * Asabs.tipo) list *)
}

type entrada =  EntFun of entrada_fn
             |  EntVar of Ast.tipo

type t

val novo_amb :  (string * entrada) list -> t
val novo_escopo : t -> t
val busca: t -> string -> entrada
val insere_local : t -> string -> Ast.tipo -> unit
val insere_param : t -> string -> Ast.tipo -> unit
val insere_fun : t -> string -> (string * Ast.tipo) list -> Ast.tipo -> unit
