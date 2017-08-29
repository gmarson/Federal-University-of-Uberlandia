open Printf
open Lexing

open Ast
exception Erro_Sintatico of string

module S = MenhirLib.General (* Streams *)
module I = Sintatico.MenhirInterpreter


(* This file was auto-generated based on "sintatico.msg". *)

(* Please note that the function [message] can raise [Not_found]. *)

let message =
  fun s ->
    match s with
    | 9 ->
        "<esperava expressao>\n"
    | 60 ->
        "<esperava dois pontos>\n"
    | 24 ->
        "<esperava fim de expressao>\n"
    | 27 ->
        "<esperava fim de expressao>\n"
    | 28 ->
        "<esperava dois pontos>\n"
    | 29 ->
        "<esperava fim de expressao>\n"
    | 31 ->
        "<esperava fim de expressao>\n"
    | 32 ->
        "<esperava dois pontos>\n"
    | 35 ->
        "<esperava fim de expressao>\n"
    | 36 ->
        "<esperava dois pontos>\n"
    | 39 ->
        "<esperava fim de expressao>\n"
    | 40 ->
        "<esperava dois pontos>\n"
    | 37 ->
        "<esperava fim de expressao>\n"
    | 38 ->
        "<esperava dois pontos>\n"
    | 41 ->
        "<esperava fim de expressao>\n"
    | 42 ->
        "<esperava dois pontos>\n"
    | 43 ->
        "<esperava fim de expressao>\n"
    | 44 ->
        "<esperava dois pontos>\n"
    | 45 ->
        "<esperava fim de expressao>\n"
    | 46 ->
        "<esperava dois pontos>\n"
    | 47 ->
        "<esperava fim de expressao>\n"
    | 48 ->
        "<esperava dois pontos>\n"
    | 61 ->
        "<esperava nova linha>\n"
    | 62 ->
        "<erro de indentaca>\n"
    | 63 ->
        "<esperava expressao ou declaracao>\n"
    | 94 ->
        "<erro de indentacao>\n"
    | 33 ->
        "<esperava fim de expressao>\n"
    | 49 ->
        "<esperava fim de expressao>\n"
    | 50 ->
        "<esperava dois pontos>\n"
    | 11 ->
        "<esperava termino de expressao >\n"
    | 18 ->
        "<esperava dois pontos>\n"
    | 21 ->
        "<esperava expressao ou variavel>\n"
    | 23 ->
        "<esperava fechamento de parenteses>\n"
    | 0 ->
        "<declaracao invalida>\n"
    | 64 ->
        "<esperava variavel ou expressao>\n"
    | 65 ->
        "<esperava nova linha>\n"
    | 162 ->
        "<erro de indentacao>\n"
    | 67 ->
        "<esperava parenteses>\n"
    | 68 ->
        "<esperava string>\n"
    | 69 ->
        "<esperava fechamento de parenteses ou virgula>\n"
    | 71 ->
        "<esperava variavel ou expressao>\n"
    | 73 ->
        "<esperava nova linha>\n"
    | 15 ->
        "<esperava parenteses>\n"
    | 16 ->
        "<esperava fechamento de parenteses>\n"
    | 100 ->
        "<esperava nova linha>\n"
    | 5 ->
        "<esperava identificador>\n"
    | 6 ->
        "<esperava novalinha>\n"
    | 165 ->
        "<esperava import ou qualquer declaracao valida>\n"
    | 75 ->
        "<esperava variavel ou expressao>\n"
    | 76 ->
        "<esperava dois pontos>\n"
    | 77 ->
        "<esperava nova linha>\n"
    | 78 ->
        "<erro de indentacao>\n"
    | 79 ->
        "<esperava expressao ou declaracao>\n"
    | 115 ->
        "<esperava def de funcao, expressao ou declaracao>\n"
    | 124 ->
        "<esperava dois pontos>\n"
    | 125 ->
        "<esperava nova linha>\n"
    | 126 ->
        "<erro de indentacao>\n"
    | 127 ->
        "<esperava expressao ou declaracao>\n"
    | 116 ->
        "<experava variavel ou expressao>\n"
    | 117 ->
        "<esperava dois pontos>\n"
    | 118 ->
        "<esperava nova linha>\n"
    | 119 ->
        "<erro de indentacao>\n"
    | 120 ->
        "<esperava expressao ou comando>\n"
    | 132 ->
        "<esperava expressao ou comando>\n"
    | 80 ->
        "<esperava parenteses>\n"
    | 81 ->
        "<esperava expressao>\n"
    | 82 ->
        "<esperava nova linha>\n"
    | 19 ->
        "<esperava variavel ou tipo>\n"
    | 55 ->
        "<parenteses nao fechado>\n"
    | 56 ->
        "<esperava variavel ou tipo>\n"
    | 103 ->
        "<esperava novalinha>\n"
    | 1 ->
        "<esperava identificador>\n"
    | 4 ->
        "<esperava import>\n"
    | 84 ->
        "<esperava variavel>\n"
    | 85 ->
        "<esperava in>\n"
    | 86 ->
        "<esperava expressao>\n"
    | 108 ->
        "<esperava dois pontos>\n"
    | 109 ->
        "<esperava nova linha>\n"
    | 110 ->
        "<erro de indentacao>\n"
    | 111 ->
        "<esperava expressao ou declaracao>\n"
    | 87 ->
        "<esperava expressao>\n"
    | 88 ->
        "<parenteses nao fechado>\n"
    | 89 ->
        "<parenteses nao fechado>\n"
    | 90 ->
        "<esperava dois pontos>\n"
    | 91 ->
        "<esperava nova linha>\n"
    | 92 ->
        "<erro de indentacao>\n"
    | 93 ->
        "<esperava declaracao ou expressao>\n"
    | 136 ->
        "<esperava identificador de funcao>\n"
    | 137 ->
        "<esperava parenteses>\n"
    | 138 ->
        "<esperava variavel e tipo como argumentos>\n"
    | 139 ->
        "<esperava dois pontos e tipo de variavel>\n"
    | 140 ->
        "<esperava tipo de variavel>\n"
    | 146 ->
        "<esperava virgula>\n"
    | 148 ->
        "<esperava variavel e tipo como argumento>\n"
    | 151 ->
        "<esperava seta>\n"
    | 152 ->
        "<esperava tipo apos seta>\n"
    | 153 ->
        "<esperava dois pontos>\n"
    | 154 ->
        "<esperava nova linha>\n"
    | 155 ->
        "<erro de indentacao>\n"
    | 156 ->
        "<esperava declaracao ou expressao>\n"
    | _ ->
        raise Not_found


open Semantico
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
  | _ -> failwith "Nada a fazer!\n"


let interprete nome =
  let tast,amb = verifica_tipos nome in
  Interprete.interprete tast
