
type 'a tabela

exception Entrada_existente of string

val insere : 'a tabela -> string -> 'a -> unit
val substitui : 'a tabela -> string -> 'a -> unit
val atualiza : 'a tabela -> string -> 'a -> unit
val busca  : 'a tabela -> string -> 'a
val cria   : (string * 'a) list -> 'a tabela 

val novo_escopo : 'a tabela -> 'a tabela 
