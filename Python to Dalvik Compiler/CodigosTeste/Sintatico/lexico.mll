{
  open Lexing
  open Printf
  open Sintatico
         

  let incr_num_linha lexbuf = 
    let pos = lexbuf.lex_curr_p in
     lexbuf.lex_curr_p <- { pos with
        pos_lnum = pos.pos_lnum + 1;
        pos_bol = pos.pos_cnum;
     }

  let msg_erro lexbuf c =
    let pos = lexbuf.lex_curr_p in
    let lin = pos.pos_lnum
    and col = pos.pos_cnum - pos.pos_bol - 1 in
    sprintf "%d-%d: caracter desconhecido %c" lin col c


}

rule token = parse 
| 'a'        {A}
| 'b'        {B}
| 'c'        {C}
| 'd'        {D}
| 'e'        {E}
| 'f'        {F}
| _ as c  { failwith (msg_erro lexbuf c) }
| eof        { EOF }



