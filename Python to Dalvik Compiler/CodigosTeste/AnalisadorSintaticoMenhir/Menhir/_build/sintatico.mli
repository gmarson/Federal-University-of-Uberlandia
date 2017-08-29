
(* The type of tokens. *)

type token = 
  | WHILE of (Lexing.position)
  | VIRG of (Lexing.position)
  | VEZES of (Lexing.position)
  | STR of (Lexing.position)
  | SETA of (Lexing.position)
  | RETURN of (Lexing.position)
  | RANGE of (Lexing.position)
  | PRINT of (Lexing.position)
  | OU of (Lexing.position)
  | NOVALINHA
  | NOT of (Lexing.position)
  | NONE of (Lexing.position)
  | MODULO of (Lexing.position)
  | MENOS of (Lexing.position)
  | MENORIGUAL of (Lexing.position)
  | MENOR of (Lexing.position)
  | MAIS of (Lexing.position)
  | MAIORIGUAL of (Lexing.position)
  | MAIOR of (Lexing.position)
  | Linha of (int * int * token list)
  | LITSTRING of (string *Lexing.position )
  | LITINT of (int * Lexing.position)
  | LITFLOAT of (float * Lexing.position)
  | LITBOOL of (bool * Lexing.position)
  | INT of (Lexing.position)
  | INPUTS of (Lexing.position)
  | INPUTI of (Lexing.position)
  | INPUTF of (Lexing.position)
  | INDENTA
  | IN of (Lexing.position)
  | IGUALDADE of (Lexing.position)
  | IF of (Lexing.position)
  | ID of (string *Lexing.position )
  | FPAR of (Lexing.position)
  | FOR of (Lexing.position)
  | FLOAT of (Lexing.position)
  | EOF
  | ELSE of (Lexing.position)
  | ELIF of (Lexing.position)
  | E of (Lexing.position)
  | DPONTOS of (Lexing.position)
  | DIVIDIDO of (Lexing.position)
  | DIFERENTE of (Lexing.position)
  | DEF of (Lexing.position)
  | DEDENTA
  | BOOL of (Lexing.position)
  | ATRIB of (Lexing.position)
  | APAR of (Lexing.position)

(* This exception is raised by the monolithic API functions. *)

exception Error

(* The monolithic API. *)

val programa: (Lexing.lexbuf -> token) -> Lexing.lexbuf -> (Sast.expressao Ast.programa)

module MenhirInterpreter : sig
  
  (* The incremental API. *)
  
  include MenhirLib.IncrementalEngine.INCREMENTAL_ENGINE
    with type token = token
  
end

(* The entry point(s) to the incremental API. *)

module Incremental : sig
  
  val programa: Lexing.position -> (Sast.expressao Ast.programa) MenhirInterpreter.checkpoint
  
end
