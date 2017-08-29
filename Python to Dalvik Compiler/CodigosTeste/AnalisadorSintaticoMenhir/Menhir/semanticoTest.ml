open Printf
open Lexing

open Ast
exception Erro_Sintatico of string

module S = MenhirLib.General (* Streams *)
module I = Sintatico.MenhirInterpreter

open Semantico

(* This file was auto-generated based on "sintatico.messages". *)

(* Please note that the function [message] can raise [Not_found]. *)

let message =
  fun s ->
    match s with
    | 1 ->
        "<YOUR SYNTAX ERROR MESSAGE HERE>\n"
    | 2 ->
        "<YOUR SYNTAX ERROR MESSAGE HERE>\n"
    | 50 ->
        "<YOUR SYNTAX ERROR MESSAGE HERE>\n"
    | 3 ->
        "<YOUR SYNTAX ERROR MESSAGE HERE>\n"
    | 49 ->
        "<YOUR SYNTAX ERROR MESSAGE HERE>\n"
    | 51 ->
        "<YOUR SYNTAX ERROR MESSAGE HERE>\n"
    | 13 ->
        "<YOUR SYNTAX ERROR MESSAGE HERE>\n"
    | 14 ->
        "<YOUR SYNTAX ERROR MESSAGE HERE>\n"
    | 16 ->
        "<YOUR SYNTAX ERROR MESSAGE HERE>\n"
    | 17 ->
        "<YOUR SYNTAX ERROR MESSAGE HERE>\n"
    | 18 ->
        "<YOUR SYNTAX ERROR MESSAGE HERE>\n"
    | 19 ->
        "<YOUR SYNTAX ERROR MESSAGE HERE>\n"
    | 20 ->
        "<YOUR SYNTAX ERROR MESSAGE HERE>\n"
    | 21 ->
        "<YOUR SYNTAX ERROR MESSAGE HERE>\n"
    | 22 ->
        "<YOUR SYNTAX ERROR MESSAGE HERE>\n"
    | 23 ->
        "<YOUR SYNTAX ERROR MESSAGE HERE>\n"
    | 26 ->
        "<YOUR SYNTAX ERROR MESSAGE HERE>\n"
    | 27 ->
        "<YOUR SYNTAX ERROR MESSAGE HERE>\n"
    | 30 ->
        "<YOUR SYNTAX ERROR MESSAGE HERE>\n"
    | 31 ->
        "<YOUR SYNTAX ERROR MESSAGE HERE>\n"
    | 28 ->
        "<YOUR SYNTAX ERROR MESSAGE HERE>\n"
    | 29 ->
        "<YOUR SYNTAX ERROR MESSAGE HERE>\n"
    | 32 ->
        "<YOUR SYNTAX ERROR MESSAGE HERE>\n"
    | 33 ->
        "<YOUR SYNTAX ERROR MESSAGE HERE>\n"
    | 34 ->
        "<YOUR SYNTAX ERROR MESSAGE HERE>\n"
    | 35 ->
        "<YOUR SYNTAX ERROR MESSAGE HERE>\n"
    | 36 ->
        "<YOUR SYNTAX ERROR MESSAGE HERE>\n"
    | 37 ->
        "<YOUR SYNTAX ERROR MESSAGE HERE>\n"
    | 38 ->
        "<YOUR SYNTAX ERROR MESSAGE HERE>\n"
    | 39 ->
        "<YOUR SYNTAX ERROR MESSAGE HERE>\n"
    | 52 ->
        "<YOUR SYNTAX ERROR MESSAGE HERE>\n"
    | 53 ->
        "<YOUR SYNTAX ERROR MESSAGE HERE>\n"
    | 54 ->
        "<YOUR SYNTAX ERROR MESSAGE HERE>\n"
    | 145 ->
        "<YOUR SYNTAX ERROR MESSAGE HERE>\n"
    | 24 ->
        "<YOUR SYNTAX ERROR MESSAGE HERE>\n"
    | 25 ->
        "<YOUR SYNTAX ERROR MESSAGE HERE>\n"
    | 40 ->
        "<YOUR SYNTAX ERROR MESSAGE HERE>\n"
    | 41 ->
        "<YOUR SYNTAX ERROR MESSAGE HERE>\n"
    | 9 ->
        "<YOUR SYNTAX ERROR MESSAGE HERE>\n"
    | 11 ->
        "<YOUR SYNTAX ERROR MESSAGE HERE>\n"
    | 12 ->
        "<YOUR SYNTAX ERROR MESSAGE HERE>\n"
    | 0 ->
        "<YOUR SYNTAX ERROR MESSAGE HERE>\n"
    | 55 ->
        "<YOUR SYNTAX ERROR MESSAGE HERE>\n"
    | 196 ->
        "<YOUR SYNTAX ERROR MESSAGE HERE>\n"
    | 58 ->
        "<YOUR SYNTAX ERROR MESSAGE HERE>\n"
    | 59 ->
        "<YOUR SYNTAX ERROR MESSAGE HERE>\n"
    | 60 ->
        "<YOUR SYNTAX ERROR MESSAGE HERE>\n"
    | 62 ->
        "<YOUR SYNTAX ERROR MESSAGE HERE>\n"
    | 63 ->
        "<YOUR SYNTAX ERROR MESSAGE HERE>\n"
    | 65 ->
        "<YOUR SYNTAX ERROR MESSAGE HERE>\n"
    | 66 ->
        "<YOUR SYNTAX ERROR MESSAGE HERE>\n"
    | 68 ->
        "<YOUR SYNTAX ERROR MESSAGE HERE>\n"
    | 69 ->
        "<YOUR SYNTAX ERROR MESSAGE HERE>\n"
    | 71 ->
        "<YOUR SYNTAX ERROR MESSAGE HERE>\n"
    | 72 ->
        "<YOUR SYNTAX ERROR MESSAGE HERE>\n"
    | 74 ->
        "<YOUR SYNTAX ERROR MESSAGE HERE>\n"
    | 75 ->
        "<YOUR SYNTAX ERROR MESSAGE HERE>\n"
    | 77 ->
        "<YOUR SYNTAX ERROR MESSAGE HERE>\n"
    | 78 ->
        "<YOUR SYNTAX ERROR MESSAGE HERE>\n"
    | 80 ->
        "<YOUR SYNTAX ERROR MESSAGE HERE>\n"
    | 81 ->
        "<YOUR SYNTAX ERROR MESSAGE HERE>\n"
    | 83 ->
        "<YOUR SYNTAX ERROR MESSAGE HERE>\n"
    | 84 ->
        "<YOUR SYNTAX ERROR MESSAGE HERE>\n"
    | 85 ->
        "<YOUR SYNTAX ERROR MESSAGE HERE>\n"
    | 86 ->
        "<YOUR SYNTAX ERROR MESSAGE HERE>\n"
    | 87 ->
        "<YOUR SYNTAX ERROR MESSAGE HERE>\n"
    | 150 ->
        "<YOUR SYNTAX ERROR MESSAGE HERE>\n"
    | 151 ->
        "<YOUR SYNTAX ERROR MESSAGE HERE>\n"
    | 152 ->
        "<YOUR SYNTAX ERROR MESSAGE HERE>\n"
    | 153 ->
        "<YOUR SYNTAX ERROR MESSAGE HERE>\n"
    | 154 ->
        "<YOUR SYNTAX ERROR MESSAGE HERE>\n"
    | 157 ->
        "<YOUR SYNTAX ERROR MESSAGE HERE>\n"
    | 158 ->
        "<YOUR SYNTAX ERROR MESSAGE HERE>\n"
    | 159 ->
        "<YOUR SYNTAX ERROR MESSAGE HERE>\n"
    | 160 ->
        "<YOUR SYNTAX ERROR MESSAGE HERE>\n"
    | 161 ->
        "<YOUR SYNTAX ERROR MESSAGE HERE>\n"
    | 163 ->
        "<YOUR SYNTAX ERROR MESSAGE HERE>\n"
    | 88 ->
        "<YOUR SYNTAX ERROR MESSAGE HERE>\n"
    | 89 ->
        "<YOUR SYNTAX ERROR MESSAGE HERE>\n"
    | 90 ->
        "<YOUR SYNTAX ERROR MESSAGE HERE>\n"
    | 92 ->
        "<YOUR SYNTAX ERROR MESSAGE HERE>\n"
    | 93 ->
        "<YOUR SYNTAX ERROR MESSAGE HERE>\n"
    | 95 ->
        "<YOUR SYNTAX ERROR MESSAGE HERE>\n"
    | 96 ->
        "<YOUR SYNTAX ERROR MESSAGE HERE>\n"
    | 98 ->
        "<YOUR SYNTAX ERROR MESSAGE HERE>\n"
    | 99 ->
        "<YOUR SYNTAX ERROR MESSAGE HERE>\n"
    | 101 ->
        "<YOUR SYNTAX ERROR MESSAGE HERE>\n"
    | 102 ->
        "<YOUR SYNTAX ERROR MESSAGE HERE>\n"
    | 104 ->
        "<YOUR SYNTAX ERROR MESSAGE HERE>\n"
    | 105 ->
        "<YOUR SYNTAX ERROR MESSAGE HERE>\n"
    | 107 ->
        "<YOUR SYNTAX ERROR MESSAGE HERE>\n"
    | 108 ->
        "<YOUR SYNTAX ERROR MESSAGE HERE>\n"
    | 10 ->
        "<YOUR SYNTAX ERROR MESSAGE HERE>\n"
    | 46 ->
        "<YOUR SYNTAX ERROR MESSAGE HERE>\n"
    | 47 ->
        "<YOUR SYNTAX ERROR MESSAGE HERE>\n"
    | 147 ->
        "<YOUR SYNTAX ERROR MESSAGE HERE>\n"
    | 110 ->
        "<YOUR SYNTAX ERROR MESSAGE HERE>\n"
    | 111 ->
        "<YOUR SYNTAX ERROR MESSAGE HERE>\n"
    | 112 ->
        "<YOUR SYNTAX ERROR MESSAGE HERE>\n"
    | 113 ->
        "<YOUR SYNTAX ERROR MESSAGE HERE>\n"
    | 114 ->
        "<YOUR SYNTAX ERROR MESSAGE HERE>\n"
    | 115 ->
        "<YOUR SYNTAX ERROR MESSAGE HERE>\n"
    | 116 ->
        "<YOUR SYNTAX ERROR MESSAGE HERE>\n"
    | 117 ->
        "<YOUR SYNTAX ERROR MESSAGE HERE>\n"
    | 118 ->
        "<YOUR SYNTAX ERROR MESSAGE HERE>\n"
    | 119 ->
        "<YOUR SYNTAX ERROR MESSAGE HERE>\n"
    | 120 ->
        "<YOUR SYNTAX ERROR MESSAGE HERE>\n"
    | 121 ->
        "<YOUR SYNTAX ERROR MESSAGE HERE>\n"
    | 169 ->
        "<YOUR SYNTAX ERROR MESSAGE HERE>\n"
    | 170 ->
        "<YOUR SYNTAX ERROR MESSAGE HERE>\n"
    | 171 ->
        "<YOUR SYNTAX ERROR MESSAGE HERE>\n"
    | 172 ->
        "<YOUR SYNTAX ERROR MESSAGE HERE>\n"
    | 173 ->
        "<YOUR SYNTAX ERROR MESSAGE HERE>\n"
    | 181 ->
        "<YOUR SYNTAX ERROR MESSAGE HERE>\n"
    | 182 ->
        "<YOUR SYNTAX ERROR MESSAGE HERE>\n"
    | 185 ->
        "<YOUR SYNTAX ERROR MESSAGE HERE>\n"
    | 186 ->
        "<YOUR SYNTAX ERROR MESSAGE HERE>\n"
    | 187 ->
        "<YOUR SYNTAX ERROR MESSAGE HERE>\n"
    | 188 ->
        "<YOUR SYNTAX ERROR MESSAGE HERE>\n"
    | 189 ->
        "<YOUR SYNTAX ERROR MESSAGE HERE>\n"
    | 190 ->
        "<YOUR SYNTAX ERROR MESSAGE HERE>\n"
    | _ ->
        raise Not_found
 

let posicao lexbuf =
    let pos = lexbuf.lex_curr_p in
    let lin = pos.pos_lnum
    and col = pos.pos_cnum - pos.pos_bol - 1 in
    sprintf "linha %d, coluna %d" lin col

(* [pilha checkpoint] extrai a pilha do autômato LR(1) contida em checkpoint *)
let pilha checkpoint =
  match checkpoint with
  | I.HandlingError amb -> I.stack amb
  | _ -> assert false (* Isso não pode acontecer *)

let estado checkpoint : int =
  match Lazy.force (pilha checkpoint) with
  | S.Nil -> (* O parser está no estado inicial *)
     0
  | S.Cons (I.Element (s, _, _, _), _) ->
     I.number s

let sucesso v = Some v

let falha lexbuf (checkpoint : (Sast.expressao Ast.programa) I.checkpoint) =
  let estado_atual = estado checkpoint in
  let msg = message estado_atual in
  raise (Erro_Sintatico (Printf.sprintf "%d - %s.\n"
                        (Lexing.lexeme_start lexbuf) msg))

let loop lexbuf resultado =
  let fornecedor = I.lexer_lexbuf_to_supplier Pre_processador.lexico lexbuf in
  I.loop_handle sucesso (falha lexbuf) fornecedor resultado

let parse_com_erro lexbuf =
  try
    Some (loop lexbuf (Sintatico.Incremental.programa lexbuf.lex_curr_p))
  with
  | Lexico.Erro msg ->
     printf "Erro lexico na %s:\n\t%s\n" (posicao lexbuf) msg;
     None
  | Erro_Sintatico msg ->
     printf "Erro sintático na %s %s\n" (posicao lexbuf) msg;
     None

(* 
let parse s =
    let lexbuf = Lexing.from_string s in
    let ast = Sintatico.programa Pre_processador.lexico lexbuf in ast

let parse_arq nome =
    let ic = open_in nome in
    let lexbuf = Lexing.from_channel ic in
    let ast = Sintatico.programa Pre_processador.lexico lexbuf in
    let _   = close_in ic in ast
 *)

let parse s =
  let lexbuf = Lexing.from_string s in
  let ast = parse_com_erro lexbuf in
  ast
  
let parse_arq nome =
  let ic = open_in nome in
  let lexbuf = Lexing.from_channel ic in
  let ast = parse_com_erro lexbuf in
  let _ = close_in ic in
  ast

let verifica_tipos nome =
  let ast = parse_arq nome in
  match ast with
    Some (Some ast) -> semantico ast
  | _ -> failwith "Nada a se fazer!\n"


(*
Para Compilar 
ocamlbuild -use-ocamlfind -use-menhir -menhir "menhir --table" -package menhirLib semanticoTest.byte


*)