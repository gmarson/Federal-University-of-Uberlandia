
(* This generated code requires the following version of MenhirLib: *)

let () =
  MenhirLib.StaticVersion.require_20160825

module Basics = struct
  
  exception Error
  
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
  
end

include Basics

let _eRR =
  Basics.Error
  
	open Ast
	open Sast

module Tables = struct
  
  include Basics
  
  let token2terminal : token -> int =
    fun _tok ->
      match _tok with
      | APAR _ ->
          48
      | ATRIB _ ->
          47
      | BOOL _ ->
          46
      | DEDENTA ->
          45
      | DEF _ ->
          44
      | DIFERENTE _ ->
          43
      | DIVIDIDO _ ->
          42
      | DPONTOS _ ->
          41
      | E _ ->
          40
      | ELIF _ ->
          39
      | ELSE _ ->
          38
      | EOF ->
          37
      | FLOAT _ ->
          36
      | FOR _ ->
          35
      | FPAR _ ->
          34
      | ID _ ->
          33
      | IF _ ->
          32
      | IGUALDADE _ ->
          31
      | IN _ ->
          30
      | INDENTA ->
          29
      | INPUTF _ ->
          28
      | INPUTI _ ->
          27
      | INPUTS _ ->
          26
      | INT _ ->
          25
      | LITBOOL _ ->
          24
      | LITFLOAT _ ->
          23
      | LITINT _ ->
          22
      | LITSTRING _ ->
          21
      | Linha _ ->
          20
      | MAIOR _ ->
          19
      | MAIORIGUAL _ ->
          18
      | MAIS _ ->
          17
      | MENOR _ ->
          16
      | MENORIGUAL _ ->
          15
      | MENOS _ ->
          14
      | MODULO _ ->
          13
      | NONE _ ->
          12
      | NOT _ ->
          11
      | NOVALINHA ->
          10
      | OU _ ->
          9
      | PRINT _ ->
          8
      | RANGE _ ->
          7
      | RETURN _ ->
          6
      | SETA _ ->
          5
      | STR _ ->
          4
      | VEZES _ ->
          3
      | VIRG _ ->
          2
      | WHILE _ ->
          1
  
  and error_terminal =
    0
  
  and token2value : token -> Obj.t =
    fun _tok ->
      match _tok with
      | APAR _v ->
          Obj.repr _v
      | ATRIB _v ->
          Obj.repr _v
      | BOOL _v ->
          Obj.repr _v
      | DEDENTA ->
          Obj.repr ()
      | DEF _v ->
          Obj.repr _v
      | DIFERENTE _v ->
          Obj.repr _v
      | DIVIDIDO _v ->
          Obj.repr _v
      | DPONTOS _v ->
          Obj.repr _v
      | E _v ->
          Obj.repr _v
      | ELIF _v ->
          Obj.repr _v
      | ELSE _v ->
          Obj.repr _v
      | EOF ->
          Obj.repr ()
      | FLOAT _v ->
          Obj.repr _v
      | FOR _v ->
          Obj.repr _v
      | FPAR _v ->
          Obj.repr _v
      | ID _v ->
          Obj.repr _v
      | IF _v ->
          Obj.repr _v
      | IGUALDADE _v ->
          Obj.repr _v
      | IN _v ->
          Obj.repr _v
      | INDENTA ->
          Obj.repr ()
      | INPUTF _v ->
          Obj.repr _v
      | INPUTI _v ->
          Obj.repr _v
      | INPUTS _v ->
          Obj.repr _v
      | INT _v ->
          Obj.repr _v
      | LITBOOL _v ->
          Obj.repr _v
      | LITFLOAT _v ->
          Obj.repr _v
      | LITINT _v ->
          Obj.repr _v
      | LITSTRING _v ->
          Obj.repr _v
      | Linha _v ->
          Obj.repr _v
      | MAIOR _v ->
          Obj.repr _v
      | MAIORIGUAL _v ->
          Obj.repr _v
      | MAIS _v ->
          Obj.repr _v
      | MENOR _v ->
          Obj.repr _v
      | MENORIGUAL _v ->
          Obj.repr _v
      | MENOS _v ->
          Obj.repr _v
      | MODULO _v ->
          Obj.repr _v
      | NONE _v ->
          Obj.repr _v
      | NOT _v ->
          Obj.repr _v
      | NOVALINHA ->
          Obj.repr ()
      | OU _v ->
          Obj.repr _v
      | PRINT _v ->
          Obj.repr _v
      | RANGE _v ->
          Obj.repr _v
      | RETURN _v ->
          Obj.repr _v
      | SETA _v ->
          Obj.repr _v
      | STR _v ->
          Obj.repr _v
      | VEZES _v ->
          Obj.repr _v
      | VIRG _v ->
          Obj.repr _v
      | WHILE _v ->
          Obj.repr _v
  
  and default_reduction =
    (8, "\000\000\000\000\022\021\023\024\000\000\000\000\000\029\019\000\000\000\031\000\000\000\030\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000(4\000\003\000\000B\026\025\000\000\000\000\000\000@\000\000\000>\000\000\000\000\000\000\000\000\000\000\000\000\000\000\002\000\000\000\000\000\000\000\000\000\000\000\000\011\n\015\007\t\000\014\000\012\000\r\b\0001\0008\006\000\004\005\000\000\000\000\000\000\000\017\000\000\000\000\000\000\000\016:\018\0002\000\000\000\000\000IHFGE=6\000\000D\000\000\000\000\000\000\000\000)\001\000?\0000*+")
  
  and error =
    (49, "B\128\0008\212\b\000\t\003\192 \000@\004\129\224\016\000 \002@\240\b\000\016\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\0000g\240\003 \240\128\t\003\1920\000@\004\129\224\016\000\"\b\254\000$\022\000\001 x\004\000\b\000\000\000\000\000\000\000\000\000\000\000\000\000$\015\000\128\0010g\240\003 \240\000\t\003\192 \000@\000\000\000\000\000\000\002@\240\b\000\019\006\127\0002\015\000\000\144<\002\000\004\000\000\000\000\000\000\000$\015\000\128\0010g\240\003 \240\000\t\003\192 \000L\025\252\000\200<\000\002@\240\b\000\019\006\127\0002\015\000\000\144<\002\000\004\193\159\192\012\131\192\000$\015\000\128\0010g\240\003 \240\000\t\003\192 \000L\025\252\000\200<\000\002@\240\b\000\019\006\127\0002\015\000\000\144<\002\000\004\193\159\192\012\131\192\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\016\000\000\000\000\000\000\000\006\b\254\000$\022\000\001 x\004\000\b\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\016G\240\001\000\240\000\016\000\000\000\000\000\000\000\001\000\000\bP\000\007\026\000\000\003 x\004\000\b\001\000\000\000\000\000\000\000\000\000\000\000 \207\224\002\001`\000\018\007\128@\000\1363\248\000\128X\000\000\000\000\000\000\000\002@\240\b\000\017\006\127\000\016\011\000\000\144<\002\000\004A\159\192\004\002\192\000$\015\000\128\001\016g\240\001\000\176\000\t\003\192 \000D\017\252\000@<\000\004\000\000\000\000\000\000\000\000@\000\002\020\000\001\198\128\000\000\000\000\000\000\006\000$\015\000\128\001\016g\240\001\000\176\000\000\000\000\000\000\000\004\129\224\016\000\"\b\254\000`\022\000\016\000\000\000\000\000\000\000\000\000\000\004\000H\030\001\000\002`\143\224\002\001`\000\018\007\128@\000\136#\248\000\144X\000\000\000\000\000\016\000\004\000\000\000\000\000\000\000\000@\000\002\020\000\001\198\128\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\004\000\000\000\000\000\000\000\000\000\000\000\001\000\000\000\000\000\000\000\000\000\000\000\000@\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\001\000\000\000\000\000\000\004(\000\003\141\000@\000\000\000\000\000\000\000\000\000\000\000\000\000@\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\001\bP\000\007\026\225\128\000\000\000\000\004\000\001\000\000\000\000\000\000\000\000\016\000\000\133\000\000q\160\000\000\000\000\000\000\004\000\000\000\000\000\000\000\004\129\224\016\000\"\b\254\000 \030\000\002\000\000\000\000\000\000\000\000 \000\001\n\000\000\227@\000\000\000\000\000\000\bB\128\0008\215\012\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000@\000\000\000\000\000\000\000\000\000\001\000\000\000\000\000\000\000\001\000\000\000\000`\000\000\000\000\000\000 \002\002\000\016\002\000\128\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\b\000\000\000\b\000\000\000\000\000\b\000\000\000\000\000\000\000\000\000\000\000\001\000\000\016\000\000\000\000\000\016\016\000\128\016\004\000\000\000\000\000@\000\016\000\000\000\000\000\000\000\001\000\000\bP\000\007\026\000\000\000\000\000\000\000@\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\b\000\000\000\000\000\000\000!@\000\028j\004\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000")
  
  and start =
    1
  
  and action =
    ((16, "\004\128\004\178\004\178\004\178\000\000\000\000\000\000\000\000\000\005\004\178\004\178\003@\004\178\000\000\000\000\004\178\000D\004\178\000\000\004\178\000\138\004\178\000\000\004\178\000\208\004\178\001\022\004\178\001\\\004\178\001\162\004\178\001\232\004\178\002.\004\178\002t\004\178\002\186\000\000\000\000\0009\000\000\003\000\004\178\000\000\000\000\000\000\003@\000\003\000\023\003\248\004\210\000\018\000\000\003\000\004\178\003\134\000\000\004\178\003\172\004\178\003\210\004\178\003\248\004\178\003\210\000\020\000\017\003\248\000[\004\178\004>\000\000\004\178\003\000\000\030\0003\004\178\003\134\004\178\003\248\000#\000\030\000\007\003\248\000\000\000\000\000\000\000\000\000\000\000\"\000\000\000(\000\000\000*\000\000\000\000\000\025\000\000\004\128\000\000\000\000\0000\000\000\000\000\000\021\004d\000\b\000X\0004\003\248\000\022\000\000\004\178\003\248\000^\000:\003\248\000\030\004d\000\000\000\000\000\000\000 \000\000\000:\000\030\000;\0002\000n\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\016\000;\000\000\000F\000\130\000n\000@\000\142\000x\003\248\000Z\000\000\000\000\000n\000\000\004\128\000\000\000\000\000\000"), (16, "\000M\000M\001\030\000&\002\006\000\209\000\170\000M\000M\000\202\002.\000M\000M\000M\000M\000M\000M\000M\000\206\000\218\001\018\001\022\0016\001:\001N\001R\001V\001r\000M\000M\001z\001\130\000M\001\142\001\162\001\174\000\153\0002\000M\000M\000M\000M\001\t\000\153\000\153\001\182\000&\000F\000N\000^\000n\000f\000v\000~\001\186\001\190\001\198\001\214\001\218\002\014\001\226\001\246\001\254\002\002\000\153\000\134\002\n\002\018\000\153\002:\002>\000m\0002\002F\000\142\000\153\000V\000\150\000m\000m\002\022\002J\000F\000m\000m\000m\000m\000m\000m\002N\002V\002\026\002c\000\000\000\000\000\000\000\000\000\000\000\000\000m\000m\002\030\000\000\000m\000\000\000\000\000\141\0002\000\000\000m\000m\000V\000m\000\141\000\141\000\000\000\000\000F\000N\000\141\000\141\000f\000\141\000\141\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\141\000\141\000\000\000\000\000\141\000\000\000\000\000i\0002\000\000\000\141\000\141\000V\000\141\000i\000i\000\000\000\000\000F\000i\000i\000i\000i\000i\000i\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000i\000i\000\000\000\000\000i\000\000\000\000\000\137\0002\000\000\000i\000i\000V\000i\000\137\000\137\000\000\000\000\000F\000N\000\137\000\137\000f\000\137\000\137\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\137\000\137\000\000\000\000\000\137\000\000\000\000\000\133\0002\000\000\000\137\000\137\000V\000\137\000\133\000\133\000\000\000\000\000F\000N\000\133\000\133\000f\000\133\000\133\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\133\000\133\000\000\000\000\000\133\000\000\000\000\000\129\0002\000\000\000\133\000\133\000V\000\133\000\129\000\129\000\000\000\000\000F\000N\000\129\000\129\000f\000\129\000\129\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\129\000\129\000\000\000\000\000\129\000\000\000\000\000}\0002\000\000\000\129\000\129\000V\000\129\000}\000}\000\000\000\000\000F\000N\000^\000n\000f\000v\000~\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000}\000}\000\000\000\000\000}\000\000\000\000\000\149\0002\000\000\000}\000}\000V\000}\000\149\000\149\000\000\000\000\000F\000N\000^\000n\000f\000v\000~\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\149\000\134\000\000\000\000\000\149\000\000\000\000\000\145\0002\000\000\000\149\000\149\000V\000\150\000\145\000\145\000\000\000\000\000F\000N\000^\000n\000f\000v\000~\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\145\000\145\000\000\000\000\000\145\000\000\000\000\000\178\0002\000\000\000\145\000\145\000V\000\145\000>\000\237\000\000\000\000\000F\000N\000^\000n\000f\000v\000~\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\0012\000\134\000\000\000\000\001\001\0002\000\000\000\000\000\000\000\000\000\142\000>\000V\000\150\000\000\000F\000N\000^\000n\000f\000v\000~\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\134\000\000\000\000\000\158\000\000\000\000\001B\0002\000\000\000\142\000\198\000V\000\150\000>\000\234\000\000\000\000\000F\000N\000^\000n\000f\000v\000~\000\000\000\000\0002\000\000\000\000\000\000\000\000\000\000\000>\000\181\000\000\000\134\000F\000N\000^\000n\000f\000v\000~\000\000\000\142\0002\000V\000\150\000\000\000\000\000\000\000>\000\177\000\000\000\134\000F\000N\000^\000n\000f\000v\000~\000\006\000\142\0002\000V\000\150\000\210\000\000\000\226\000>\000\173\000\000\000\134\000F\000N\000^\000n\000f\000v\000~\000\000\000\142\001\014\000V\000\150\000\000\000\238\000\246\000\254\000\000\000\000\000\134\001\006\001\026\001J\001*\000\000\000\000\0002\000\000\000\142\001\210\000V\000\150\000>\001&\000\000\000\000\000F\000N\000^\000n\000f\000v\000~\000\225\000\000\000\000\000\000\000\000\000\225\000\000\000\225\000\000\000\000\000\000\000\134\000\000\000\000\000\006\000\000\000\000\000\000\000\000\000\210\000\142\000\226\000V\000\150\000\000\000\225\000\225\000\225\000\000\000\000\000\000\000\225\000\225\000\000\000\225\000\000\000\225\001\178\001\202\000\238\000\246\000\254\000\000\000\225\000\225\001\006\001\026\000\000\001*\000\n\000\185\000\000\000\014\000\000\000\000\000\000\000\000\001\250\000\217\000\018\000\022\000\026\000\030\000\000\000\233\000\n\000\000\000\000\000\014\000\000\000\000\000\"\000\201\000\000\000\000\000\018\000\022\000\026\000\030\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000*\000\"\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000*"))
  
  and lhs =
    (8, "\000\028\027\026\025\025\025\025\025\025\025\025\025\025\024\023\023\022\021\021\021\021\021\021\021\021\021\021\021\021\021\021\021\021\021\021\021\021\021\021\020\019\019\018\017\016\015\015\014\r\012\012\011\011\n\n\t\t\b\b\007\006\005\004\003\003\002\002\001\001\001\001\001")
  
  and goto =
    ((16, "\000\t\0004\000\144\000\152\000\000\000\000\000\000\000\000\000\000\000,\000\194\000\000\000\202\000\000\000\000\000\244\000\000\000\252\000\000\001&\000\000\001.\000\000\001X\000\000\001|\000\000\001\138\000\000\001\140\000\000\001\142\000\000\001\144\000\000\001\146\000\000\001\148\000\000\000\000\000\000\000\000\000\000\000\000\000^\000\000\000\000\000\000\000\000\000\000\000\000\000L\000f\000\000\000\000\000\000\001\162\000\000\000\000\001\164\000\000\001\166\000\000\001\168\000\000\001\170\000\000\000\000\000\000\000~\000\000\001\172\000\000\000\000\001\186\000\000\000\000\000\000\001\188\000\000\001\190\000\000\000\000\000\000\000\000\000\176\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\001x\000\000\000\000\000\000\000\000\000\000\000\000\000\007\000\000\000\000\000\000\000\226\000\000\000\000\001\192\000\000\000\000\000\000\001\020\000\000\000`\000\000\000\000\000\000\000\000\000\000\000\000\000\000\001\146\000\000\000\006\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\002\000\000\000\000\000\000\000\b\000\000\000\000\000\000\001F\000\000\000\000\000\000\000\000\000\000\000\026\000\000\000\000\000\000"), (8, "W\151X\141\137\145|\000\139Z[\152\\^`\154\156WbX{\157ghj)Z[\155\\^`\154\156*b\000\000\157ghjW,X\000\0001Y\015.Z[\015\\^`z\0006b\000}eghjW,X\000{8Y\015\000Z[\015\\^`\000\000\000b\000keghjW0X\000\000/Y\015\000Z[\015\\^`\000\000\000b\000ceghjW\012X\000\000\014Y\015\000Z[\015\\^`\000\000\000b\000qeghjW\017X\000\000\019Y\015\000Z[\015\\^`\000\000\000b\000xeghjW\021X\000\000\023Y\015\000Z[\015\\^`\000\000\000b\000\149eghjW\025X\000\000\000f\015\000Z[\138\\^`\000\139\000b\027\142eghj\015\029\031!#%'\015\015\015\015\015\015:=?ACI\015\015\015\015\015\015LPRt\000\000\015\015\015\015"))
  
  and semantic_action =
    [|
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let {
          MenhirLib.EngineTypes.semv = _4;
          MenhirLib.EngineTypes.startp = _startpos__4_;
          MenhirLib.EngineTypes.endp = _endpos__4_;
          MenhirLib.EngineTypes.next = {
            MenhirLib.EngineTypes.semv = exprla;
            MenhirLib.EngineTypes.startp = _startpos_exprla_;
            MenhirLib.EngineTypes.endp = _endpos_exprla_;
            MenhirLib.EngineTypes.next = {
              MenhirLib.EngineTypes.semv = _2;
              MenhirLib.EngineTypes.startp = _startpos__2_;
              MenhirLib.EngineTypes.endp = _endpos__2_;
              MenhirLib.EngineTypes.next = {
                MenhirLib.EngineTypes.state = _menhir_s;
                MenhirLib.EngineTypes.semv = id;
                MenhirLib.EngineTypes.startp = _startpos_id_;
                MenhirLib.EngineTypes.endp = _endpos_id_;
                MenhirLib.EngineTypes.next = _menhir_stack;
              };
            };
          };
        } = _menhir_stack in
        let _4 : unit = Obj.magic _4 in
        let exprla : (Sast.expressao) = Obj.magic exprla in
        let _2 : (Lexing.position) = Obj.magic _2 in
        let id : (string *Lexing.position ) = Obj.magic id in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos_id_ in
        let _endpos = _endpos__4_ in
        let _v : (Sast.expressao Ast.comando) =                                                                     ( ATRIBUICAO (EXPVAR id , exprla) ) in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let {
          MenhirLib.EngineTypes.semv = _4;
          MenhirLib.EngineTypes.startp = _startpos__4_;
          MenhirLib.EngineTypes.endp = _endpos__4_;
          MenhirLib.EngineTypes.next = {
            MenhirLib.EngineTypes.semv = xs0;
            MenhirLib.EngineTypes.startp = _startpos_xs0_;
            MenhirLib.EngineTypes.endp = _endpos_xs0_;
            MenhirLib.EngineTypes.next = {
              MenhirLib.EngineTypes.semv = _2;
              MenhirLib.EngineTypes.startp = _startpos__2_;
              MenhirLib.EngineTypes.endp = _endpos__2_;
              MenhirLib.EngineTypes.next = {
                MenhirLib.EngineTypes.state = _menhir_s;
                MenhirLib.EngineTypes.semv = nome;
                MenhirLib.EngineTypes.startp = _startpos_nome_;
                MenhirLib.EngineTypes.endp = _endpos_nome_;
                MenhirLib.EngineTypes.next = _menhir_stack;
              };
            };
          };
        } = _menhir_stack in
        let _4 : (Lexing.position) = Obj.magic _4 in
        let xs0 : (Sast.expressao Ast.expressoes) = Obj.magic xs0 in
        let _2 : (Lexing.position) = Obj.magic _2 in
        let nome : (string *Lexing.position ) = Obj.magic nome in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos_nome_ in
        let _endpos = _endpos__4_ in
        let _v : (Sast.expressao) = let args =
          let xs = xs0 in
              ( xs )
        in
                                                                                    ( EXPCALL (nome, args) ) in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let {
          MenhirLib.EngineTypes.semv = _2;
          MenhirLib.EngineTypes.startp = _startpos__2_;
          MenhirLib.EngineTypes.endp = _endpos__2_;
          MenhirLib.EngineTypes.next = {
            MenhirLib.EngineTypes.state = _menhir_s;
            MenhirLib.EngineTypes.semv = exp;
            MenhirLib.EngineTypes.startp = _startpos_exp_;
            MenhirLib.EngineTypes.endp = _endpos_exp_;
            MenhirLib.EngineTypes.next = _menhir_stack;
          };
        } = _menhir_stack in
        let _2 : unit = Obj.magic _2 in
        let exp : (Sast.expressao) = Obj.magic exp in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos_exp_ in
        let _endpos = _endpos__2_ in
        let _v : (Sast.expressao Ast.comando) =                           ( CHAMADADEFUNCAO(exp) ) in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = stm;
          MenhirLib.EngineTypes.startp = _startpos_stm_;
          MenhirLib.EngineTypes.endp = _endpos_stm_;
          MenhirLib.EngineTypes.next = _menhir_stack;
        } = _menhir_stack in
        let stm : (Sast.expressao Ast.comando) = Obj.magic stm in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos_stm_ in
        let _endpos = _endpos_stm_ in
        let _v : (Sast.expressao Ast.comando) =                          ( stm ) in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = stm;
          MenhirLib.EngineTypes.startp = _startpos_stm_;
          MenhirLib.EngineTypes.endp = _endpos_stm_;
          MenhirLib.EngineTypes.next = _menhir_stack;
        } = _menhir_stack in
        let stm : (Sast.expressao Ast.comando) = Obj.magic stm in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos_stm_ in
        let _endpos = _endpos_stm_ in
        let _v : (Sast.expressao Ast.comando) =                             ( stm ) in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = stm;
          MenhirLib.EngineTypes.startp = _startpos_stm_;
          MenhirLib.EngineTypes.endp = _endpos_stm_;
          MenhirLib.EngineTypes.next = _menhir_stack;
        } = _menhir_stack in
        let stm : (Sast.expressao Ast.comando) = Obj.magic stm in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos_stm_ in
        let _endpos = _endpos_stm_ in
        let _v : (Sast.expressao Ast.comando) =                        ( stm ) in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = stm;
          MenhirLib.EngineTypes.startp = _startpos_stm_;
          MenhirLib.EngineTypes.endp = _endpos_stm_;
          MenhirLib.EngineTypes.next = _menhir_stack;
        } = _menhir_stack in
        let stm : (Sast.expressao Ast.comando) = Obj.magic stm in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos_stm_ in
        let _endpos = _endpos_stm_ in
        let _v : (Sast.expressao Ast.comando) =                             ( stm ) in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = stm;
          MenhirLib.EngineTypes.startp = _startpos_stm_;
          MenhirLib.EngineTypes.endp = _endpos_stm_;
          MenhirLib.EngineTypes.next = _menhir_stack;
        } = _menhir_stack in
        let stm : (Sast.expressao Ast.comando) = Obj.magic stm in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos_stm_ in
        let _endpos = _endpos_stm_ in
        let _v : (Sast.expressao Ast.comando) =                       ( stm ) in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = stm;
          MenhirLib.EngineTypes.startp = _startpos_stm_;
          MenhirLib.EngineTypes.endp = _endpos_stm_;
          MenhirLib.EngineTypes.next = _menhir_stack;
        } = _menhir_stack in
        let stm : (Sast.expressao Ast.comando) = Obj.magic stm in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos_stm_ in
        let _endpos = _endpos_stm_ in
        let _v : (Sast.expressao Ast.comando) =                      ( stm ) in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = stm;
          MenhirLib.EngineTypes.startp = _startpos_stm_;
          MenhirLib.EngineTypes.endp = _endpos_stm_;
          MenhirLib.EngineTypes.next = _menhir_stack;
        } = _menhir_stack in
        let stm : (Sast.expressao Ast.comando) = Obj.magic stm in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos_stm_ in
        let _endpos = _endpos_stm_ in
        let _v : (Sast.expressao Ast.comando) =                       ( stm ) in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let {
          MenhirLib.EngineTypes.semv = _2;
          MenhirLib.EngineTypes.startp = _startpos__2_;
          MenhirLib.EngineTypes.endp = _endpos__2_;
          MenhirLib.EngineTypes.next = {
            MenhirLib.EngineTypes.state = _menhir_s;
            MenhirLib.EngineTypes.semv = stm;
            MenhirLib.EngineTypes.startp = _startpos_stm_;
            MenhirLib.EngineTypes.endp = _endpos_stm_;
            MenhirLib.EngineTypes.next = _menhir_stack;
          };
        } = _menhir_stack in
        let _2 : unit = Obj.magic _2 in
        let stm : (Sast.expressao Ast.comando) = Obj.magic stm in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos_stm_ in
        let _endpos = _endpos__2_ in
        let _v : (Sast.expressao Ast.comando) =                             ( stm ) in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let {
          MenhirLib.EngineTypes.semv = _2;
          MenhirLib.EngineTypes.startp = _startpos__2_;
          MenhirLib.EngineTypes.endp = _endpos__2_;
          MenhirLib.EngineTypes.next = {
            MenhirLib.EngineTypes.state = _menhir_s;
            MenhirLib.EngineTypes.semv = stm;
            MenhirLib.EngineTypes.startp = _startpos_stm_;
            MenhirLib.EngineTypes.endp = _endpos_stm_;
            MenhirLib.EngineTypes.next = _menhir_stack;
          };
        } = _menhir_stack in
        let _2 : unit = Obj.magic _2 in
        let stm : (Sast.expressao Ast.comando) = Obj.magic stm in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos_stm_ in
        let _endpos = _endpos__2_ in
        let _v : (Sast.expressao Ast.comando) =                               ( stm ) in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let {
          MenhirLib.EngineTypes.semv = _2;
          MenhirLib.EngineTypes.startp = _startpos__2_;
          MenhirLib.EngineTypes.endp = _endpos__2_;
          MenhirLib.EngineTypes.next = {
            MenhirLib.EngineTypes.state = _menhir_s;
            MenhirLib.EngineTypes.semv = stm;
            MenhirLib.EngineTypes.startp = _startpos_stm_;
            MenhirLib.EngineTypes.endp = _endpos_stm_;
            MenhirLib.EngineTypes.next = _menhir_stack;
          };
        } = _menhir_stack in
        let _2 : unit = Obj.magic _2 in
        let stm : (Sast.expressao Ast.comando) = Obj.magic stm in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos_stm_ in
        let _endpos = _endpos__2_ in
        let _v : (Sast.expressao Ast.comando) =                               ( stm ) in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = cmd;
          MenhirLib.EngineTypes.startp = _startpos_cmd_;
          MenhirLib.EngineTypes.endp = _endpos_cmd_;
          MenhirLib.EngineTypes.next = _menhir_stack;
        } = _menhir_stack in
        let cmd : (Sast.expressao Ast.comandos) = Obj.magic cmd in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos_cmd_ in
        let _endpos = _endpos_cmd_ in
        let _v : (Sast.expressao Ast.comandos) =                 ( cmd ) in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let {
          MenhirLib.EngineTypes.semv = condEE;
          MenhirLib.EngineTypes.startp = _startpos_condEE_;
          MenhirLib.EngineTypes.endp = _endpos_condEE_;
          MenhirLib.EngineTypes.next = {
            MenhirLib.EngineTypes.semv = _7;
            MenhirLib.EngineTypes.startp = _startpos__7_;
            MenhirLib.EngineTypes.endp = _endpos__7_;
            MenhirLib.EngineTypes.next = {
              MenhirLib.EngineTypes.semv = stm;
              MenhirLib.EngineTypes.startp = _startpos_stm_;
              MenhirLib.EngineTypes.endp = _endpos_stm_;
              MenhirLib.EngineTypes.next = {
                MenhirLib.EngineTypes.semv = _5;
                MenhirLib.EngineTypes.startp = _startpos__5_;
                MenhirLib.EngineTypes.endp = _endpos__5_;
                MenhirLib.EngineTypes.next = {
                  MenhirLib.EngineTypes.semv = _4;
                  MenhirLib.EngineTypes.startp = _startpos__4_;
                  MenhirLib.EngineTypes.endp = _endpos__4_;
                  MenhirLib.EngineTypes.next = {
                    MenhirLib.EngineTypes.semv = _3;
                    MenhirLib.EngineTypes.startp = _startpos__3_;
                    MenhirLib.EngineTypes.endp = _endpos__3_;
                    MenhirLib.EngineTypes.next = {
                      MenhirLib.EngineTypes.semv = exprla;
                      MenhirLib.EngineTypes.startp = _startpos_exprla_;
                      MenhirLib.EngineTypes.endp = _endpos_exprla_;
                      MenhirLib.EngineTypes.next = {
                        MenhirLib.EngineTypes.state = _menhir_s;
                        MenhirLib.EngineTypes.semv = _1;
                        MenhirLib.EngineTypes.startp = _startpos__1_;
                        MenhirLib.EngineTypes.endp = _endpos__1_;
                        MenhirLib.EngineTypes.next = _menhir_stack;
                      };
                    };
                  };
                };
              };
            };
          };
        } = _menhir_stack in
        let condEE : (Sast.expressao Ast.comando option) = Obj.magic condEE in
        let _7 : unit = Obj.magic _7 in
        let stm : (Sast.expressao Ast.comandos) = Obj.magic stm in
        let _5 : unit = Obj.magic _5 in
        let _4 : unit = Obj.magic _4 in
        let _3 : (Lexing.position) = Obj.magic _3 in
        let exprla : (Sast.expressao) = Obj.magic exprla in
        let _1 : (Lexing.position) = Obj.magic _1 in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos__1_ in
        let _endpos = _endpos_condEE_ in
        let _v : (Sast.expressao Ast.comando) =                                                                                                                   ( CONDICAOIF (exprla,stm, condEE) ) in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let {
          MenhirLib.EngineTypes.semv = _6;
          MenhirLib.EngineTypes.startp = _startpos__6_;
          MenhirLib.EngineTypes.endp = _endpos__6_;
          MenhirLib.EngineTypes.next = {
            MenhirLib.EngineTypes.semv = stm;
            MenhirLib.EngineTypes.startp = _startpos_stm_;
            MenhirLib.EngineTypes.endp = _endpos_stm_;
            MenhirLib.EngineTypes.next = {
              MenhirLib.EngineTypes.semv = _4;
              MenhirLib.EngineTypes.startp = _startpos__4_;
              MenhirLib.EngineTypes.endp = _endpos__4_;
              MenhirLib.EngineTypes.next = {
                MenhirLib.EngineTypes.semv = _3;
                MenhirLib.EngineTypes.startp = _startpos__3_;
                MenhirLib.EngineTypes.endp = _endpos__3_;
                MenhirLib.EngineTypes.next = {
                  MenhirLib.EngineTypes.semv = _2;
                  MenhirLib.EngineTypes.startp = _startpos__2_;
                  MenhirLib.EngineTypes.endp = _endpos__2_;
                  MenhirLib.EngineTypes.next = {
                    MenhirLib.EngineTypes.state = _menhir_s;
                    MenhirLib.EngineTypes.semv = _1;
                    MenhirLib.EngineTypes.startp = _startpos__1_;
                    MenhirLib.EngineTypes.endp = _endpos__1_;
                    MenhirLib.EngineTypes.next = _menhir_stack;
                  };
                };
              };
            };
          };
        } = _menhir_stack in
        let _6 : unit = Obj.magic _6 in
        let stm : (Sast.expressao Ast.comandos) = Obj.magic stm in
        let _4 : unit = Obj.magic _4 in
        let _3 : unit = Obj.magic _3 in
        let _2 : (Lexing.position) = Obj.magic _2 in
        let _1 : (Lexing.position) = Obj.magic _1 in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos__1_ in
        let _endpos = _endpos__6_ in
        let _v : (Sast.expressao Ast.comando) =                                                        (CONDICAOElifElse( stm ) ) in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let {
          MenhirLib.EngineTypes.semv = cee;
          MenhirLib.EngineTypes.startp = _startpos_cee_;
          MenhirLib.EngineTypes.endp = _endpos_cee_;
          MenhirLib.EngineTypes.next = {
            MenhirLib.EngineTypes.semv = _7;
            MenhirLib.EngineTypes.startp = _startpos__7_;
            MenhirLib.EngineTypes.endp = _endpos__7_;
            MenhirLib.EngineTypes.next = {
              MenhirLib.EngineTypes.semv = stm;
              MenhirLib.EngineTypes.startp = _startpos_stm_;
              MenhirLib.EngineTypes.endp = _endpos_stm_;
              MenhirLib.EngineTypes.next = {
                MenhirLib.EngineTypes.semv = _5;
                MenhirLib.EngineTypes.startp = _startpos__5_;
                MenhirLib.EngineTypes.endp = _endpos__5_;
                MenhirLib.EngineTypes.next = {
                  MenhirLib.EngineTypes.semv = _4;
                  MenhirLib.EngineTypes.startp = _startpos__4_;
                  MenhirLib.EngineTypes.endp = _endpos__4_;
                  MenhirLib.EngineTypes.next = {
                    MenhirLib.EngineTypes.semv = _3;
                    MenhirLib.EngineTypes.startp = _startpos__3_;
                    MenhirLib.EngineTypes.endp = _endpos__3_;
                    MenhirLib.EngineTypes.next = {
                      MenhirLib.EngineTypes.semv = exprla;
                      MenhirLib.EngineTypes.startp = _startpos_exprla_;
                      MenhirLib.EngineTypes.endp = _endpos_exprla_;
                      MenhirLib.EngineTypes.next = {
                        MenhirLib.EngineTypes.state = _menhir_s;
                        MenhirLib.EngineTypes.semv = _1;
                        MenhirLib.EngineTypes.startp = _startpos__1_;
                        MenhirLib.EngineTypes.endp = _endpos__1_;
                        MenhirLib.EngineTypes.next = _menhir_stack;
                      };
                    };
                  };
                };
              };
            };
          };
        } = _menhir_stack in
        let cee : (Sast.expressao Ast.comando option) = Obj.magic cee in
        let _7 : unit = Obj.magic _7 in
        let stm : (Sast.expressao Ast.comandos) = Obj.magic stm in
        let _5 : unit = Obj.magic _5 in
        let _4 : unit = Obj.magic _4 in
        let _3 : (Lexing.position) = Obj.magic _3 in
        let exprla : (Sast.expressao) = Obj.magic exprla in
        let _1 : (Lexing.position) = Obj.magic _1 in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos__1_ in
        let _endpos = _endpos_cee_ in
        let _v : (Sast.expressao Ast.comando) =    ( CONDICAOIF(exprla,stm,cee) ) in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = f;
          MenhirLib.EngineTypes.startp = _startpos_f_;
          MenhirLib.EngineTypes.endp = _endpos_f_;
          MenhirLib.EngineTypes.next = _menhir_stack;
        } = _menhir_stack in
        let f : (Sast.expressao) = Obj.magic f in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos_f_ in
        let _endpos = _endpos_f_ in
        let _v : (Sast.expressao) =                             ( f 				 ) in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = id;
          MenhirLib.EngineTypes.startp = _startpos_id_;
          MenhirLib.EngineTypes.endp = _endpos_id_;
          MenhirLib.EngineTypes.next = _menhir_stack;
        } = _menhir_stack in
        let id : (string *Lexing.position ) = Obj.magic id in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos_id_ in
        let _endpos = _endpos_id_ in
        let _v : (Sast.expressao) =                          ( EXPVAR(id)    	 ) in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = i;
          MenhirLib.EngineTypes.startp = _startpos_i_;
          MenhirLib.EngineTypes.endp = _endpos_i_;
          MenhirLib.EngineTypes.next = _menhir_stack;
        } = _menhir_stack in
        let i : (int * Lexing.position) = Obj.magic i in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos_i_ in
        let _endpos = _endpos_i_ in
        let _v : (Sast.expressao) =                            ( EXPINT(i)   		 ) in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = s;
          MenhirLib.EngineTypes.startp = _startpos_s_;
          MenhirLib.EngineTypes.endp = _endpos_s_;
          MenhirLib.EngineTypes.next = _menhir_stack;
        } = _menhir_stack in
        let s : (string *Lexing.position ) = Obj.magic s in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos_s_ in
        let _endpos = _endpos_s_ in
        let _v : (Sast.expressao) =                              ( EXPSTRING(s)		 ) in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = f;
          MenhirLib.EngineTypes.startp = _startpos_f_;
          MenhirLib.EngineTypes.endp = _endpos_f_;
          MenhirLib.EngineTypes.next = _menhir_stack;
        } = _menhir_stack in
        let f : (float * Lexing.position) = Obj.magic f in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos_f_ in
        let _endpos = _endpos_f_ in
        let _v : (Sast.expressao) =                              ( EXPFLOAT(f) 	  	 ) in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = b;
          MenhirLib.EngineTypes.startp = _startpos_b_;
          MenhirLib.EngineTypes.endp = _endpos_b_;
          MenhirLib.EngineTypes.next = _menhir_stack;
        } = _menhir_stack in
        let b : (bool * Lexing.position) = Obj.magic b in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos_b_ in
        let _endpos = _endpos_b_ in
        let _v : (Sast.expressao) =                            ( EXPBOOL (b)	 ) in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let {
          MenhirLib.EngineTypes.semv = e;
          MenhirLib.EngineTypes.startp = _startpos_e_;
          MenhirLib.EngineTypes.endp = _endpos_e_;
          MenhirLib.EngineTypes.next = {
            MenhirLib.EngineTypes.state = _menhir_s;
            MenhirLib.EngineTypes.semv = pos0;
            MenhirLib.EngineTypes.startp = _startpos_pos0_;
            MenhirLib.EngineTypes.endp = _endpos_pos0_;
            MenhirLib.EngineTypes.next = _menhir_stack;
          };
        } = _menhir_stack in
        let e : (Sast.expressao) = Obj.magic e in
        let pos0 : (Lexing.position) = Obj.magic pos0 in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos_pos0_ in
        let _endpos = _endpos_e_ in
        let _v : (Sast.expressao) = let op =
          let pos = pos0 in
                        ( (NEGACAO, pos) 		)
        in
                                                               ( EXPOPU (op,e) 	 ) in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let {
          MenhirLib.EngineTypes.semv = e;
          MenhirLib.EngineTypes.startp = _startpos_e_;
          MenhirLib.EngineTypes.endp = _endpos_e_;
          MenhirLib.EngineTypes.next = {
            MenhirLib.EngineTypes.state = _menhir_s;
            MenhirLib.EngineTypes.semv = pos0;
            MenhirLib.EngineTypes.startp = _startpos_pos0_;
            MenhirLib.EngineTypes.endp = _endpos_pos0_;
            MenhirLib.EngineTypes.next = _menhir_stack;
          };
        } = _menhir_stack in
        let e : (Sast.expressao) = Obj.magic e in
        let pos0 : (Lexing.position) = Obj.magic pos0 in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos_pos0_ in
        let _endpos = _endpos_e_ in
        let _v : (Sast.expressao) = let op =
          let pos = pos0 in
                          ( (SUBTRACAO, pos ) )
        in
                                                               ( EXPOPU (op,e) 	 ) in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let {
          MenhirLib.EngineTypes.semv = e2;
          MenhirLib.EngineTypes.startp = _startpos_e2_;
          MenhirLib.EngineTypes.endp = _endpos_e2_;
          MenhirLib.EngineTypes.next = {
            MenhirLib.EngineTypes.semv = pos0;
            MenhirLib.EngineTypes.startp = _startpos_pos0_;
            MenhirLib.EngineTypes.endp = _endpos_pos0_;
            MenhirLib.EngineTypes.next = {
              MenhirLib.EngineTypes.state = _menhir_s;
              MenhirLib.EngineTypes.semv = e1;
              MenhirLib.EngineTypes.startp = _startpos_e1_;
              MenhirLib.EngineTypes.endp = _endpos_e1_;
              MenhirLib.EngineTypes.next = _menhir_stack;
            };
          };
        } = _menhir_stack in
        let e2 : (Sast.expressao) = Obj.magic e2 in
        let pos0 : (Lexing.position) = Obj.magic pos0 in
        let e1 : (Sast.expressao) = Obj.magic e1 in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos_e1_ in
        let _endpos = _endpos_e2_ in
        let _v : (Sast.expressao) = let op =
          let pos = pos0 in
                                ( (ADICAO, pos)	)
        in
                                                                      ( EXPOPB (op,e1,e2) ) in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let {
          MenhirLib.EngineTypes.semv = e2;
          MenhirLib.EngineTypes.startp = _startpos_e2_;
          MenhirLib.EngineTypes.endp = _endpos_e2_;
          MenhirLib.EngineTypes.next = {
            MenhirLib.EngineTypes.semv = pos0;
            MenhirLib.EngineTypes.startp = _startpos_pos0_;
            MenhirLib.EngineTypes.endp = _endpos_pos0_;
            MenhirLib.EngineTypes.next = {
              MenhirLib.EngineTypes.state = _menhir_s;
              MenhirLib.EngineTypes.semv = e1;
              MenhirLib.EngineTypes.startp = _startpos_e1_;
              MenhirLib.EngineTypes.endp = _endpos_e1_;
              MenhirLib.EngineTypes.next = _menhir_stack;
            };
          };
        } = _menhir_stack in
        let e2 : (Sast.expressao) = Obj.magic e2 in
        let pos0 : (Lexing.position) = Obj.magic pos0 in
        let e1 : (Sast.expressao) = Obj.magic e1 in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos_e1_ in
        let _endpos = _endpos_e2_ in
        let _v : (Sast.expressao) = let op =
          let pos = pos0 in
                                 ( (SUBTRACAO,	pos)	)
        in
                                                                      ( EXPOPB (op,e1,e2) ) in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let {
          MenhirLib.EngineTypes.semv = e2;
          MenhirLib.EngineTypes.startp = _startpos_e2_;
          MenhirLib.EngineTypes.endp = _endpos_e2_;
          MenhirLib.EngineTypes.next = {
            MenhirLib.EngineTypes.semv = pos0;
            MenhirLib.EngineTypes.startp = _startpos_pos0_;
            MenhirLib.EngineTypes.endp = _endpos_pos0_;
            MenhirLib.EngineTypes.next = {
              MenhirLib.EngineTypes.state = _menhir_s;
              MenhirLib.EngineTypes.semv = e1;
              MenhirLib.EngineTypes.startp = _startpos_e1_;
              MenhirLib.EngineTypes.endp = _endpos_e1_;
              MenhirLib.EngineTypes.next = _menhir_stack;
            };
          };
        } = _menhir_stack in
        let e2 : (Sast.expressao) = Obj.magic e2 in
        let pos0 : (Lexing.position) = Obj.magic pos0 in
        let e1 : (Sast.expressao) = Obj.magic e1 in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos_e1_ in
        let _endpos = _endpos_e2_ in
        let _v : (Sast.expressao) = let op =
          let pos = pos0 in
                                 ( (MULTIPLICACAO,pos)	)
        in
                                                                      ( EXPOPB (op,e1,e2) ) in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let {
          MenhirLib.EngineTypes.semv = e2;
          MenhirLib.EngineTypes.startp = _startpos_e2_;
          MenhirLib.EngineTypes.endp = _endpos_e2_;
          MenhirLib.EngineTypes.next = {
            MenhirLib.EngineTypes.semv = pos0;
            MenhirLib.EngineTypes.startp = _startpos_pos0_;
            MenhirLib.EngineTypes.endp = _endpos_pos0_;
            MenhirLib.EngineTypes.next = {
              MenhirLib.EngineTypes.state = _menhir_s;
              MenhirLib.EngineTypes.semv = e1;
              MenhirLib.EngineTypes.startp = _startpos_e1_;
              MenhirLib.EngineTypes.endp = _endpos_e1_;
              MenhirLib.EngineTypes.next = _menhir_stack;
            };
          };
        } = _menhir_stack in
        let e2 : (Sast.expressao) = Obj.magic e2 in
        let pos0 : (Lexing.position) = Obj.magic pos0 in
        let e1 : (Sast.expressao) = Obj.magic e1 in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos_e1_ in
        let _endpos = _endpos_e2_ in
        let _v : (Sast.expressao) = let op =
          let pos = pos0 in
                                   ( (DIVISAO, pos)		)
        in
                                                                      ( EXPOPB (op,e1,e2) ) in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let {
          MenhirLib.EngineTypes.semv = e2;
          MenhirLib.EngineTypes.startp = _startpos_e2_;
          MenhirLib.EngineTypes.endp = _endpos_e2_;
          MenhirLib.EngineTypes.next = {
            MenhirLib.EngineTypes.semv = pos0;
            MenhirLib.EngineTypes.startp = _startpos_pos0_;
            MenhirLib.EngineTypes.endp = _endpos_pos0_;
            MenhirLib.EngineTypes.next = {
              MenhirLib.EngineTypes.state = _menhir_s;
              MenhirLib.EngineTypes.semv = e1;
              MenhirLib.EngineTypes.startp = _startpos_e1_;
              MenhirLib.EngineTypes.endp = _endpos_e1_;
              MenhirLib.EngineTypes.next = _menhir_stack;
            };
          };
        } = _menhir_stack in
        let e2 : (Sast.expressao) = Obj.magic e2 in
        let pos0 : (Lexing.position) = Obj.magic pos0 in
        let e1 : (Sast.expressao) = Obj.magic e1 in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos_e1_ in
        let _endpos = _endpos_e2_ in
        let _v : (Sast.expressao) = let op =
          let pos = pos0 in
                                ( (MOD, 	pos)		)
        in
                                                                      ( EXPOPB (op,e1,e2) ) in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let {
          MenhirLib.EngineTypes.semv = e2;
          MenhirLib.EngineTypes.startp = _startpos_e2_;
          MenhirLib.EngineTypes.endp = _endpos_e2_;
          MenhirLib.EngineTypes.next = {
            MenhirLib.EngineTypes.semv = pos0;
            MenhirLib.EngineTypes.startp = _startpos_pos0_;
            MenhirLib.EngineTypes.endp = _endpos_pos0_;
            MenhirLib.EngineTypes.next = {
              MenhirLib.EngineTypes.state = _menhir_s;
              MenhirLib.EngineTypes.semv = e1;
              MenhirLib.EngineTypes.startp = _startpos_e1_;
              MenhirLib.EngineTypes.endp = _endpos_e1_;
              MenhirLib.EngineTypes.next = _menhir_stack;
            };
          };
        } = _menhir_stack in
        let e2 : (Sast.expressao) = Obj.magic e2 in
        let pos0 : (Lexing.position) = Obj.magic pos0 in
        let e1 : (Sast.expressao) = Obj.magic e1 in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos_e1_ in
        let _endpos = _endpos_e2_ in
        let _v : (Sast.expressao) = let op =
          let pos = pos0 in
                                    ( (EHIGUAL, pos)		)
        in
                                                                      ( EXPOPB (op,e1,e2) ) in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let {
          MenhirLib.EngineTypes.semv = e2;
          MenhirLib.EngineTypes.startp = _startpos_e2_;
          MenhirLib.EngineTypes.endp = _endpos_e2_;
          MenhirLib.EngineTypes.next = {
            MenhirLib.EngineTypes.semv = pos0;
            MenhirLib.EngineTypes.startp = _startpos_pos0_;
            MenhirLib.EngineTypes.endp = _endpos_pos0_;
            MenhirLib.EngineTypes.next = {
              MenhirLib.EngineTypes.state = _menhir_s;
              MenhirLib.EngineTypes.semv = e1;
              MenhirLib.EngineTypes.startp = _startpos_e1_;
              MenhirLib.EngineTypes.endp = _endpos_e1_;
              MenhirLib.EngineTypes.next = _menhir_stack;
            };
          };
        } = _menhir_stack in
        let e2 : (Sast.expressao) = Obj.magic e2 in
        let pos0 : (Lexing.position) = Obj.magic pos0 in
        let e1 : (Sast.expressao) = Obj.magic e1 in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos_e1_ in
        let _endpos = _endpos_e2_ in
        let _v : (Sast.expressao) = let op =
          let pos = pos0 in
                                 ( (MAIORQ, 	pos)	)
        in
                                                                      ( EXPOPB (op,e1,e2) ) in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let {
          MenhirLib.EngineTypes.semv = e2;
          MenhirLib.EngineTypes.startp = _startpos_e2_;
          MenhirLib.EngineTypes.endp = _endpos_e2_;
          MenhirLib.EngineTypes.next = {
            MenhirLib.EngineTypes.semv = pos0;
            MenhirLib.EngineTypes.startp = _startpos_pos0_;
            MenhirLib.EngineTypes.endp = _endpos_pos0_;
            MenhirLib.EngineTypes.next = {
              MenhirLib.EngineTypes.state = _menhir_s;
              MenhirLib.EngineTypes.semv = e1;
              MenhirLib.EngineTypes.startp = _startpos_e1_;
              MenhirLib.EngineTypes.endp = _endpos_e1_;
              MenhirLib.EngineTypes.next = _menhir_stack;
            };
          };
        } = _menhir_stack in
        let e2 : (Sast.expressao) = Obj.magic e2 in
        let pos0 : (Lexing.position) = Obj.magic pos0 in
        let e1 : (Sast.expressao) = Obj.magic e1 in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos_e1_ in
        let _endpos = _endpos_e2_ in
        let _v : (Sast.expressao) = let op =
          let pos = pos0 in
                                   ( (MAIORIGUALQ, pos)	)
        in
                                                                      ( EXPOPB (op,e1,e2) ) in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let {
          MenhirLib.EngineTypes.semv = e2;
          MenhirLib.EngineTypes.startp = _startpos_e2_;
          MenhirLib.EngineTypes.endp = _endpos_e2_;
          MenhirLib.EngineTypes.next = {
            MenhirLib.EngineTypes.semv = pos0;
            MenhirLib.EngineTypes.startp = _startpos_pos0_;
            MenhirLib.EngineTypes.endp = _endpos_pos0_;
            MenhirLib.EngineTypes.next = {
              MenhirLib.EngineTypes.state = _menhir_s;
              MenhirLib.EngineTypes.semv = e1;
              MenhirLib.EngineTypes.startp = _startpos_e1_;
              MenhirLib.EngineTypes.endp = _endpos_e1_;
              MenhirLib.EngineTypes.next = _menhir_stack;
            };
          };
        } = _menhir_stack in
        let e2 : (Sast.expressao) = Obj.magic e2 in
        let pos0 : (Lexing.position) = Obj.magic pos0 in
        let e1 : (Sast.expressao) = Obj.magic e1 in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos_e1_ in
        let _endpos = _endpos_e2_ in
        let _v : (Sast.expressao) = let op =
          let pos = pos0 in
                                ( (MENORQ, 	pos)	)
        in
                                                                      ( EXPOPB (op,e1,e2) ) in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let {
          MenhirLib.EngineTypes.semv = e2;
          MenhirLib.EngineTypes.startp = _startpos_e2_;
          MenhirLib.EngineTypes.endp = _endpos_e2_;
          MenhirLib.EngineTypes.next = {
            MenhirLib.EngineTypes.semv = pos0;
            MenhirLib.EngineTypes.startp = _startpos_pos0_;
            MenhirLib.EngineTypes.endp = _endpos_pos0_;
            MenhirLib.EngineTypes.next = {
              MenhirLib.EngineTypes.state = _menhir_s;
              MenhirLib.EngineTypes.semv = e1;
              MenhirLib.EngineTypes.startp = _startpos_e1_;
              MenhirLib.EngineTypes.endp = _endpos_e1_;
              MenhirLib.EngineTypes.next = _menhir_stack;
            };
          };
        } = _menhir_stack in
        let e2 : (Sast.expressao) = Obj.magic e2 in
        let pos0 : (Lexing.position) = Obj.magic pos0 in
        let e1 : (Sast.expressao) = Obj.magic e1 in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos_e1_ in
        let _endpos = _endpos_e2_ in
        let _v : (Sast.expressao) = let op =
          let pos = pos0 in
                                    ( (MENORIGUALQ,	pos))
        in
                                                                      ( EXPOPB (op,e1,e2) ) in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let {
          MenhirLib.EngineTypes.semv = e2;
          MenhirLib.EngineTypes.startp = _startpos_e2_;
          MenhirLib.EngineTypes.endp = _endpos_e2_;
          MenhirLib.EngineTypes.next = {
            MenhirLib.EngineTypes.semv = pos0;
            MenhirLib.EngineTypes.startp = _startpos_pos0_;
            MenhirLib.EngineTypes.endp = _endpos_pos0_;
            MenhirLib.EngineTypes.next = {
              MenhirLib.EngineTypes.state = _menhir_s;
              MenhirLib.EngineTypes.semv = e1;
              MenhirLib.EngineTypes.startp = _startpos_e1_;
              MenhirLib.EngineTypes.endp = _endpos_e1_;
              MenhirLib.EngineTypes.next = _menhir_stack;
            };
          };
        } = _menhir_stack in
        let e2 : (Sast.expressao) = Obj.magic e2 in
        let pos0 : (Lexing.position) = Obj.magic pos0 in
        let e1 : (Sast.expressao) = Obj.magic e1 in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos_e1_ in
        let _endpos = _endpos_e2_ in
        let _v : (Sast.expressao) = let op =
          let pos = pos0 in
                                   ( (EHDIFERENTE, pos)	)
        in
                                                                      ( EXPOPB (op,e1,e2) ) in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let {
          MenhirLib.EngineTypes.semv = e2;
          MenhirLib.EngineTypes.startp = _startpos_e2_;
          MenhirLib.EngineTypes.endp = _endpos_e2_;
          MenhirLib.EngineTypes.next = {
            MenhirLib.EngineTypes.semv = pos0;
            MenhirLib.EngineTypes.startp = _startpos_pos0_;
            MenhirLib.EngineTypes.endp = _endpos_pos0_;
            MenhirLib.EngineTypes.next = {
              MenhirLib.EngineTypes.state = _menhir_s;
              MenhirLib.EngineTypes.semv = e1;
              MenhirLib.EngineTypes.startp = _startpos_e1_;
              MenhirLib.EngineTypes.endp = _endpos_e1_;
              MenhirLib.EngineTypes.next = _menhir_stack;
            };
          };
        } = _menhir_stack in
        let e2 : (Sast.expressao) = Obj.magic e2 in
        let pos0 : (Lexing.position) = Obj.magic pos0 in
        let e1 : (Sast.expressao) = Obj.magic e1 in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos_e1_ in
        let _endpos = _endpos_e2_ in
        let _v : (Sast.expressao) = let op =
          let pos = pos0 in
                             ( (AND, 	pos)		)
        in
                                                                      ( EXPOPB (op,e1,e2) ) in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let {
          MenhirLib.EngineTypes.semv = e2;
          MenhirLib.EngineTypes.startp = _startpos_e2_;
          MenhirLib.EngineTypes.endp = _endpos_e2_;
          MenhirLib.EngineTypes.next = {
            MenhirLib.EngineTypes.semv = pos0;
            MenhirLib.EngineTypes.startp = _startpos_pos0_;
            MenhirLib.EngineTypes.endp = _endpos_pos0_;
            MenhirLib.EngineTypes.next = {
              MenhirLib.EngineTypes.state = _menhir_s;
              MenhirLib.EngineTypes.semv = e1;
              MenhirLib.EngineTypes.startp = _startpos_e1_;
              MenhirLib.EngineTypes.endp = _endpos_e1_;
              MenhirLib.EngineTypes.next = _menhir_stack;
            };
          };
        } = _menhir_stack in
        let e2 : (Sast.expressao) = Obj.magic e2 in
        let pos0 : (Lexing.position) = Obj.magic pos0 in
        let e1 : (Sast.expressao) = Obj.magic e1 in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos_e1_ in
        let _endpos = _endpos_e2_ in
        let _v : (Sast.expressao) = let op =
          let pos = pos0 in
                             ( (OR, 		pos)	)
        in
                                                                      ( EXPOPB (op,e1,e2) ) in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let {
          MenhirLib.EngineTypes.semv = _3;
          MenhirLib.EngineTypes.startp = _startpos__3_;
          MenhirLib.EngineTypes.endp = _endpos__3_;
          MenhirLib.EngineTypes.next = {
            MenhirLib.EngineTypes.semv = e;
            MenhirLib.EngineTypes.startp = _startpos_e_;
            MenhirLib.EngineTypes.endp = _endpos_e_;
            MenhirLib.EngineTypes.next = {
              MenhirLib.EngineTypes.state = _menhir_s;
              MenhirLib.EngineTypes.semv = _1;
              MenhirLib.EngineTypes.startp = _startpos__1_;
              MenhirLib.EngineTypes.endp = _endpos__1_;
              MenhirLib.EngineTypes.next = _menhir_stack;
            };
          };
        } = _menhir_stack in
        let _3 : (Lexing.position) = Obj.magic _3 in
        let e : (Sast.expressao) = Obj.magic e in
        let _1 : (Lexing.position) = Obj.magic _1 in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos__1_ in
        let _endpos = _endpos__3_ in
        let _v : (Sast.expressao) =                                             ( e 		    	 ) in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let {
          MenhirLib.EngineTypes.semv = _12;
          MenhirLib.EngineTypes.startp = _startpos__12_;
          MenhirLib.EngineTypes.endp = _endpos__12_;
          MenhirLib.EngineTypes.next = {
            MenhirLib.EngineTypes.semv = cmd;
            MenhirLib.EngineTypes.startp = _startpos_cmd_;
            MenhirLib.EngineTypes.endp = _endpos_cmd_;
            MenhirLib.EngineTypes.next = {
              MenhirLib.EngineTypes.semv = _10;
              MenhirLib.EngineTypes.startp = _startpos__10_;
              MenhirLib.EngineTypes.endp = _endpos__10_;
              MenhirLib.EngineTypes.next = {
                MenhirLib.EngineTypes.semv = _9;
                MenhirLib.EngineTypes.startp = _startpos__9_;
                MenhirLib.EngineTypes.endp = _endpos__9_;
                MenhirLib.EngineTypes.next = {
                  MenhirLib.EngineTypes.semv = _8;
                  MenhirLib.EngineTypes.startp = _startpos__8_;
                  MenhirLib.EngineTypes.endp = _endpos__8_;
                  MenhirLib.EngineTypes.next = {
                    MenhirLib.EngineTypes.semv = retorno;
                    MenhirLib.EngineTypes.startp = _startpos_retorno_;
                    MenhirLib.EngineTypes.endp = _endpos_retorno_;
                    MenhirLib.EngineTypes.next = {
                      MenhirLib.EngineTypes.semv = _6;
                      MenhirLib.EngineTypes.startp = _startpos__6_;
                      MenhirLib.EngineTypes.endp = _endpos__6_;
                      MenhirLib.EngineTypes.next = {
                        MenhirLib.EngineTypes.semv = _5;
                        MenhirLib.EngineTypes.startp = _startpos__5_;
                        MenhirLib.EngineTypes.endp = _endpos__5_;
                        MenhirLib.EngineTypes.next = {
                          MenhirLib.EngineTypes.semv = xs0;
                          MenhirLib.EngineTypes.startp = _startpos_xs0_;
                          MenhirLib.EngineTypes.endp = _endpos_xs0_;
                          MenhirLib.EngineTypes.next = {
                            MenhirLib.EngineTypes.semv = _3;
                            MenhirLib.EngineTypes.startp = _startpos__3_;
                            MenhirLib.EngineTypes.endp = _endpos__3_;
                            MenhirLib.EngineTypes.next = {
                              MenhirLib.EngineTypes.semv = nome;
                              MenhirLib.EngineTypes.startp = _startpos_nome_;
                              MenhirLib.EngineTypes.endp = _endpos_nome_;
                              MenhirLib.EngineTypes.next = {
                                MenhirLib.EngineTypes.state = _menhir_s;
                                MenhirLib.EngineTypes.semv = _1;
                                MenhirLib.EngineTypes.startp = _startpos__1_;
                                MenhirLib.EngineTypes.endp = _endpos__1_;
                                MenhirLib.EngineTypes.next = _menhir_stack;
                              };
                            };
                          };
                        };
                      };
                    };
                  };
                };
              };
            };
          };
        } = _menhir_stack in
        let _12 : unit = Obj.magic _12 in
        let cmd : (Sast.expressao Ast.comandos) = Obj.magic cmd in
        let _10 : unit = Obj.magic _10 in
        let _9 : unit = Obj.magic _9 in
        let _8 : (Lexing.position) = Obj.magic _8 in
        let retorno : (Ast.tipo) = Obj.magic retorno in
        let _6 : (Lexing.position) = Obj.magic _6 in
        let _5 : (Lexing.position) = Obj.magic _5 in
        let xs0 : ((Ast.identificador Ast.pos * Ast.tipo) list) = Obj.magic xs0 in
        let _3 : (Lexing.position) = Obj.magic _3 in
        let nome : (string *Lexing.position ) = Obj.magic nome in
        let _1 : (Lexing.position) = Obj.magic _1 in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos__1_ in
        let _endpos = _endpos__12_ in
        let _v : (Sast.expressao Ast.instrucao) = let args =
          let xs = xs0 in
              ( xs )
        in
             (
   	 	Funcao {
   	 		fn_nome = nome;
   	 		fn_tiporet = retorno;
   	 		fn_formais = args;
   	 		fn_corpo = cmd
   	 	}
   	 ) in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = func;
          MenhirLib.EngineTypes.startp = _startpos_func_;
          MenhirLib.EngineTypes.endp = _endpos_func_;
          MenhirLib.EngineTypes.next = _menhir_stack;
        } = _menhir_stack in
        let func : (Sast.expressao Ast.instrucao) = Obj.magic func in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos_func_ in
        let _endpos = _endpos_func_ in
        let _v : (Sast.expressao Ast.instrucao) =                        (     func 	) in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = cmd;
          MenhirLib.EngineTypes.startp = _startpos_cmd_;
          MenhirLib.EngineTypes.endp = _endpos_cmd_;
          MenhirLib.EngineTypes.next = _menhir_stack;
        } = _menhir_stack in
        let cmd : (Sast.expressao Ast.comando) = Obj.magic cmd in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos_cmd_ in
        let _endpos = _endpos_cmd_ in
        let _v : (Sast.expressao Ast.instrucao) =                    ( ACMD(cmd) ) in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let {
          MenhirLib.EngineTypes.semv = exp;
          MenhirLib.EngineTypes.startp = _startpos_exp_;
          MenhirLib.EngineTypes.endp = _endpos_exp_;
          MenhirLib.EngineTypes.next = {
            MenhirLib.EngineTypes.state = _menhir_s;
            MenhirLib.EngineTypes.semv = _1;
            MenhirLib.EngineTypes.startp = _startpos__1_;
            MenhirLib.EngineTypes.endp = _endpos__1_;
            MenhirLib.EngineTypes.next = _menhir_stack;
          };
        } = _menhir_stack in
        let exp : (Sast.expressao) = Obj.magic exp in
        let _1 : (Lexing.position) = Obj.magic _1 in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos__1_ in
        let _endpos = _endpos_exp_ in
        let _v : (Sast.expressao Ast.comando) =                                         ( LEIAF exp ) in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let {
          MenhirLib.EngineTypes.semv = exp;
          MenhirLib.EngineTypes.startp = _startpos_exp_;
          MenhirLib.EngineTypes.endp = _endpos_exp_;
          MenhirLib.EngineTypes.next = {
            MenhirLib.EngineTypes.state = _menhir_s;
            MenhirLib.EngineTypes.semv = _1;
            MenhirLib.EngineTypes.startp = _startpos__1_;
            MenhirLib.EngineTypes.endp = _endpos__1_;
            MenhirLib.EngineTypes.next = _menhir_stack;
          };
        } = _menhir_stack in
        let exp : (Sast.expressao) = Obj.magic exp in
        let _1 : (Lexing.position) = Obj.magic _1 in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos__1_ in
        let _endpos = _endpos_exp_ in
        let _v : (Sast.expressao Ast.comando) =                                         ( LEIAI exp ) in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let {
          MenhirLib.EngineTypes.semv = exp;
          MenhirLib.EngineTypes.startp = _startpos_exp_;
          MenhirLib.EngineTypes.endp = _endpos_exp_;
          MenhirLib.EngineTypes.next = {
            MenhirLib.EngineTypes.state = _menhir_s;
            MenhirLib.EngineTypes.semv = _1;
            MenhirLib.EngineTypes.startp = _startpos__1_;
            MenhirLib.EngineTypes.endp = _endpos__1_;
            MenhirLib.EngineTypes.next = _menhir_stack;
          };
        } = _menhir_stack in
        let exp : (Sast.expressao) = Obj.magic exp in
        let _1 : (Lexing.position) = Obj.magic _1 in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos__1_ in
        let _endpos = _endpos_exp_ in
        let _v : (Sast.expressao Ast.comando) =                                         ( LEIAS exp ) in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let _menhir_s = _menhir_env.MenhirLib.EngineTypes.current in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _endpos = _startpos in
        let _v : (Sast.expressao Ast.instrucoes) =     ( [] ) in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let {
          MenhirLib.EngineTypes.semv = xs;
          MenhirLib.EngineTypes.startp = _startpos_xs_;
          MenhirLib.EngineTypes.endp = _endpos_xs_;
          MenhirLib.EngineTypes.next = {
            MenhirLib.EngineTypes.state = _menhir_s;
            MenhirLib.EngineTypes.semv = x;
            MenhirLib.EngineTypes.startp = _startpos_x_;
            MenhirLib.EngineTypes.endp = _endpos_x_;
            MenhirLib.EngineTypes.next = _menhir_stack;
          };
        } = _menhir_stack in
        let xs : (Sast.expressao Ast.instrucoes) = Obj.magic xs in
        let x : (Sast.expressao Ast.instrucao) = Obj.magic x in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos_x_ in
        let _endpos = _endpos_xs_ in
        let _v : (Sast.expressao Ast.instrucoes) =     ( x :: xs ) in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let {
          MenhirLib.EngineTypes.semv = _14;
          MenhirLib.EngineTypes.startp = _startpos__14_;
          MenhirLib.EngineTypes.endp = _endpos__14_;
          MenhirLib.EngineTypes.next = {
            MenhirLib.EngineTypes.semv = stm;
            MenhirLib.EngineTypes.startp = _startpos_stm_;
            MenhirLib.EngineTypes.endp = _endpos_stm_;
            MenhirLib.EngineTypes.next = {
              MenhirLib.EngineTypes.semv = _12;
              MenhirLib.EngineTypes.startp = _startpos__12_;
              MenhirLib.EngineTypes.endp = _endpos__12_;
              MenhirLib.EngineTypes.next = {
                MenhirLib.EngineTypes.semv = _11;
                MenhirLib.EngineTypes.startp = _startpos__11_;
                MenhirLib.EngineTypes.endp = _endpos__11_;
                MenhirLib.EngineTypes.next = {
                  MenhirLib.EngineTypes.semv = _10;
                  MenhirLib.EngineTypes.startp = _startpos__10_;
                  MenhirLib.EngineTypes.endp = _endpos__10_;
                  MenhirLib.EngineTypes.next = {
                    MenhirLib.EngineTypes.semv = _9;
                    MenhirLib.EngineTypes.startp = _startpos__9_;
                    MenhirLib.EngineTypes.endp = _endpos__9_;
                    MenhirLib.EngineTypes.next = {
                      MenhirLib.EngineTypes.semv = exprfim;
                      MenhirLib.EngineTypes.startp = _startpos_exprfim_;
                      MenhirLib.EngineTypes.endp = _endpos_exprfim_;
                      MenhirLib.EngineTypes.next = {
                        MenhirLib.EngineTypes.semv = _7;
                        MenhirLib.EngineTypes.startp = _startpos__7_;
                        MenhirLib.EngineTypes.endp = _endpos__7_;
                        MenhirLib.EngineTypes.next = {
                          MenhirLib.EngineTypes.semv = exprcomeco;
                          MenhirLib.EngineTypes.startp = _startpos_exprcomeco_;
                          MenhirLib.EngineTypes.endp = _endpos_exprcomeco_;
                          MenhirLib.EngineTypes.next = {
                            MenhirLib.EngineTypes.semv = _5;
                            MenhirLib.EngineTypes.startp = _startpos__5_;
                            MenhirLib.EngineTypes.endp = _endpos__5_;
                            MenhirLib.EngineTypes.next = {
                              MenhirLib.EngineTypes.semv = _4;
                              MenhirLib.EngineTypes.startp = _startpos__4_;
                              MenhirLib.EngineTypes.endp = _endpos__4_;
                              MenhirLib.EngineTypes.next = {
                                MenhirLib.EngineTypes.semv = _3;
                                MenhirLib.EngineTypes.startp = _startpos__3_;
                                MenhirLib.EngineTypes.endp = _endpos__3_;
                                MenhirLib.EngineTypes.next = {
                                  MenhirLib.EngineTypes.semv = expid;
                                  MenhirLib.EngineTypes.startp = _startpos_expid_;
                                  MenhirLib.EngineTypes.endp = _endpos_expid_;
                                  MenhirLib.EngineTypes.next = {
                                    MenhirLib.EngineTypes.state = _menhir_s;
                                    MenhirLib.EngineTypes.semv = _1;
                                    MenhirLib.EngineTypes.startp = _startpos__1_;
                                    MenhirLib.EngineTypes.endp = _endpos__1_;
                                    MenhirLib.EngineTypes.next = _menhir_stack;
                                  };
                                };
                              };
                            };
                          };
                        };
                      };
                    };
                  };
                };
              };
            };
          };
        } = _menhir_stack in
        let _14 : unit = Obj.magic _14 in
        let stm : (Sast.expressao Ast.comandos) = Obj.magic stm in
        let _12 : unit = Obj.magic _12 in
        let _11 : unit = Obj.magic _11 in
        let _10 : (Lexing.position) = Obj.magic _10 in
        let _9 : (Lexing.position) = Obj.magic _9 in
        let exprfim : (Sast.expressao) = Obj.magic exprfim in
        let _7 : (Lexing.position) = Obj.magic _7 in
        let exprcomeco : (Sast.expressao) = Obj.magic exprcomeco in
        let _5 : (Lexing.position) = Obj.magic _5 in
        let _4 : (Lexing.position) = Obj.magic _4 in
        let _3 : (Lexing.position) = Obj.magic _3 in
        let expid : (Sast.expressao) = Obj.magic expid in
        let _1 : (Lexing.position) = Obj.magic _1 in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos__1_ in
        let _endpos = _endpos__14_ in
        let _v : (Sast.expressao Ast.comando) =                                                                                                                                                                              ( FORLOOP(expid,exprcomeco,exprfim,stm)) in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let {
          MenhirLib.EngineTypes.semv = _7;
          MenhirLib.EngineTypes.startp = _startpos__7_;
          MenhirLib.EngineTypes.endp = _endpos__7_;
          MenhirLib.EngineTypes.next = {
            MenhirLib.EngineTypes.semv = stm;
            MenhirLib.EngineTypes.startp = _startpos_stm_;
            MenhirLib.EngineTypes.endp = _endpos_stm_;
            MenhirLib.EngineTypes.next = {
              MenhirLib.EngineTypes.semv = _5;
              MenhirLib.EngineTypes.startp = _startpos__5_;
              MenhirLib.EngineTypes.endp = _endpos__5_;
              MenhirLib.EngineTypes.next = {
                MenhirLib.EngineTypes.semv = _4;
                MenhirLib.EngineTypes.startp = _startpos__4_;
                MenhirLib.EngineTypes.endp = _endpos__4_;
                MenhirLib.EngineTypes.next = {
                  MenhirLib.EngineTypes.semv = _3;
                  MenhirLib.EngineTypes.startp = _startpos__3_;
                  MenhirLib.EngineTypes.endp = _endpos__3_;
                  MenhirLib.EngineTypes.next = {
                    MenhirLib.EngineTypes.semv = exprla;
                    MenhirLib.EngineTypes.startp = _startpos_exprla_;
                    MenhirLib.EngineTypes.endp = _endpos_exprla_;
                    MenhirLib.EngineTypes.next = {
                      MenhirLib.EngineTypes.state = _menhir_s;
                      MenhirLib.EngineTypes.semv = _1;
                      MenhirLib.EngineTypes.startp = _startpos__1_;
                      MenhirLib.EngineTypes.endp = _endpos__1_;
                      MenhirLib.EngineTypes.next = _menhir_stack;
                    };
                  };
                };
              };
            };
          };
        } = _menhir_stack in
        let _7 : unit = Obj.magic _7 in
        let stm : (Sast.expressao Ast.comandos) = Obj.magic stm in
        let _5 : unit = Obj.magic _5 in
        let _4 : unit = Obj.magic _4 in
        let _3 : (Lexing.position) = Obj.magic _3 in
        let exprla : (Sast.expressao) = Obj.magic exprla in
        let _1 : (Lexing.position) = Obj.magic _1 in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos__1_ in
        let _endpos = _endpos__7_ in
        let _v : (Sast.expressao Ast.comando) =                                                                                                 ( WHILELOOP(exprla,stm) ) in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let _menhir_s = _menhir_env.MenhirLib.EngineTypes.current in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _endpos = _startpos in
        let _v : (Sast.expressao Ast.expressoes) =     ( [] ) in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = x;
          MenhirLib.EngineTypes.startp = _startpos_x_;
          MenhirLib.EngineTypes.endp = _endpos_x_;
          MenhirLib.EngineTypes.next = _menhir_stack;
        } = _menhir_stack in
        let x : (Sast.expressao Ast.expressoes) = Obj.magic x in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos_x_ in
        let _endpos = _endpos_x_ in
        let _v : (Sast.expressao Ast.expressoes) =     ( x ) in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let _menhir_s = _menhir_env.MenhirLib.EngineTypes.current in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _endpos = _startpos in
        let _v : ((Ast.identificador Ast.pos * Ast.tipo) list) =     ( [] ) in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = x;
          MenhirLib.EngineTypes.startp = _startpos_x_;
          MenhirLib.EngineTypes.endp = _endpos_x_;
          MenhirLib.EngineTypes.next = _menhir_stack;
        } = _menhir_stack in
        let x : ((Ast.identificador Ast.pos * Ast.tipo) list) = Obj.magic x in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos_x_ in
        let _endpos = _endpos_x_ in
        let _v : ((Ast.identificador Ast.pos * Ast.tipo) list) =     ( x ) in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = x;
          MenhirLib.EngineTypes.startp = _startpos_x_;
          MenhirLib.EngineTypes.endp = _endpos_x_;
          MenhirLib.EngineTypes.next = _menhir_stack;
        } = _menhir_stack in
        let x : (Sast.expressao Ast.comando) = Obj.magic x in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos_x_ in
        let _endpos = _endpos_x_ in
        let _v : (Sast.expressao Ast.comandos) =     ( [ x ] ) in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let {
          MenhirLib.EngineTypes.semv = xs;
          MenhirLib.EngineTypes.startp = _startpos_xs_;
          MenhirLib.EngineTypes.endp = _endpos_xs_;
          MenhirLib.EngineTypes.next = {
            MenhirLib.EngineTypes.state = _menhir_s;
            MenhirLib.EngineTypes.semv = x;
            MenhirLib.EngineTypes.startp = _startpos_x_;
            MenhirLib.EngineTypes.endp = _endpos_x_;
            MenhirLib.EngineTypes.next = _menhir_stack;
          };
        } = _menhir_stack in
        let xs : (Sast.expressao Ast.comandos) = Obj.magic xs in
        let x : (Sast.expressao Ast.comando) = Obj.magic x in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos_x_ in
        let _endpos = _endpos_xs_ in
        let _v : (Sast.expressao Ast.comandos) =     ( x :: xs ) in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let _menhir_s = _menhir_env.MenhirLib.EngineTypes.current in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _endpos = _startpos in
        let _v : (Sast.expressao Ast.comando option) =     ( None ) in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = x;
          MenhirLib.EngineTypes.startp = _startpos_x_;
          MenhirLib.EngineTypes.endp = _endpos_x_;
          MenhirLib.EngineTypes.next = _menhir_stack;
        } = _menhir_stack in
        let x : (Sast.expressao Ast.comando) = Obj.magic x in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos_x_ in
        let _endpos = _endpos_x_ in
        let _v : (Sast.expressao Ast.comando option) =     ( Some x ) in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let _menhir_s = _menhir_env.MenhirLib.EngineTypes.current in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _endpos = _startpos in
        let _v : (Sast.expressao option) =     ( None ) in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = x;
          MenhirLib.EngineTypes.startp = _startpos_x_;
          MenhirLib.EngineTypes.endp = _endpos_x_;
          MenhirLib.EngineTypes.next = _menhir_stack;
        } = _menhir_stack in
        let x : (Sast.expressao) = Obj.magic x in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos_x_ in
        let _endpos = _endpos_x_ in
        let _v : (Sast.expressao option) =     ( Some x ) in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let {
          MenhirLib.EngineTypes.semv = tp;
          MenhirLib.EngineTypes.startp = _startpos_tp_;
          MenhirLib.EngineTypes.endp = _endpos_tp_;
          MenhirLib.EngineTypes.next = {
            MenhirLib.EngineTypes.semv = _2;
            MenhirLib.EngineTypes.startp = _startpos__2_;
            MenhirLib.EngineTypes.endp = _endpos__2_;
            MenhirLib.EngineTypes.next = {
              MenhirLib.EngineTypes.state = _menhir_s;
              MenhirLib.EngineTypes.semv = id;
              MenhirLib.EngineTypes.startp = _startpos_id_;
              MenhirLib.EngineTypes.endp = _endpos_id_;
              MenhirLib.EngineTypes.next = _menhir_stack;
            };
          };
        } = _menhir_stack in
        let tp : (Ast.tipo) = Obj.magic tp in
        let _2 : (Lexing.position) = Obj.magic _2 in
        let id : (string *Lexing.position ) = Obj.magic id in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos_id_ in
        let _endpos = _endpos_tp_ in
        let _v : (Ast.identificador Ast.pos * Ast.tipo) =                                   ( (id,tp) ) in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let {
          MenhirLib.EngineTypes.semv = _3;
          MenhirLib.EngineTypes.startp = _startpos__3_;
          MenhirLib.EngineTypes.endp = _endpos__3_;
          MenhirLib.EngineTypes.next = {
            MenhirLib.EngineTypes.semv = exprla;
            MenhirLib.EngineTypes.startp = _startpos_exprla_;
            MenhirLib.EngineTypes.endp = _endpos_exprla_;
            MenhirLib.EngineTypes.next = {
              MenhirLib.EngineTypes.state = _menhir_s;
              MenhirLib.EngineTypes.semv = _1;
              MenhirLib.EngineTypes.startp = _startpos__1_;
              MenhirLib.EngineTypes.endp = _endpos__1_;
              MenhirLib.EngineTypes.next = _menhir_stack;
            };
          };
        } = _menhir_stack in
        let _3 : unit = Obj.magic _3 in
        let exprla : (Sast.expressao) = Obj.magic exprla in
        let _1 : (Lexing.position) = Obj.magic _1 in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos__1_ in
        let _endpos = _endpos__3_ in
        let _v : (Sast.expressao Ast.comando) =                                                     (PRINT(exprla) ) in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let {
          MenhirLib.EngineTypes.semv = _2;
          MenhirLib.EngineTypes.startp = _startpos__2_;
          MenhirLib.EngineTypes.endp = _endpos__2_;
          MenhirLib.EngineTypes.next = {
            MenhirLib.EngineTypes.state = _menhir_s;
            MenhirLib.EngineTypes.semv = ins;
            MenhirLib.EngineTypes.startp = _startpos_ins_;
            MenhirLib.EngineTypes.endp = _endpos_ins_;
            MenhirLib.EngineTypes.next = _menhir_stack;
          };
        } = _menhir_stack in
        let _2 : unit = Obj.magic _2 in
        let ins : (Sast.expressao Ast.instrucoes) = Obj.magic ins in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos_ins_ in
        let _endpos = _endpos__2_ in
        let _v : (Sast.expressao Ast.programa) =      (Programa ins ) in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let {
          MenhirLib.EngineTypes.semv = _3;
          MenhirLib.EngineTypes.startp = _startpos__3_;
          MenhirLib.EngineTypes.endp = _endpos__3_;
          MenhirLib.EngineTypes.next = {
            MenhirLib.EngineTypes.semv = expr;
            MenhirLib.EngineTypes.startp = _startpos_expr_;
            MenhirLib.EngineTypes.endp = _endpos_expr_;
            MenhirLib.EngineTypes.next = {
              MenhirLib.EngineTypes.state = _menhir_s;
              MenhirLib.EngineTypes.semv = _1;
              MenhirLib.EngineTypes.startp = _startpos__1_;
              MenhirLib.EngineTypes.endp = _endpos__1_;
              MenhirLib.EngineTypes.next = _menhir_stack;
            };
          };
        } = _menhir_stack in
        let _3 : unit = Obj.magic _3 in
        let expr : (Sast.expressao option) = Obj.magic expr in
        let _1 : (Lexing.position) = Obj.magic _1 in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos__1_ in
        let _endpos = _endpos__3_ in
        let _v : (Sast.expressao Ast.comando) =                                                   ( RETORNO(expr) ) in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = x;
          MenhirLib.EngineTypes.startp = _startpos_x_;
          MenhirLib.EngineTypes.endp = _endpos_x_;
          MenhirLib.EngineTypes.next = _menhir_stack;
        } = _menhir_stack in
        let x : (Sast.expressao) = Obj.magic x in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos_x_ in
        let _endpos = _endpos_x_ in
        let _v : (Sast.expressao Ast.expressoes) =     ( [ x ] ) in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let {
          MenhirLib.EngineTypes.semv = xs;
          MenhirLib.EngineTypes.startp = _startpos_xs_;
          MenhirLib.EngineTypes.endp = _endpos_xs_;
          MenhirLib.EngineTypes.next = {
            MenhirLib.EngineTypes.semv = _2;
            MenhirLib.EngineTypes.startp = _startpos__2_;
            MenhirLib.EngineTypes.endp = _endpos__2_;
            MenhirLib.EngineTypes.next = {
              MenhirLib.EngineTypes.state = _menhir_s;
              MenhirLib.EngineTypes.semv = x;
              MenhirLib.EngineTypes.startp = _startpos_x_;
              MenhirLib.EngineTypes.endp = _endpos_x_;
              MenhirLib.EngineTypes.next = _menhir_stack;
            };
          };
        } = _menhir_stack in
        let xs : (Sast.expressao Ast.expressoes) = Obj.magic xs in
        let _2 : (Lexing.position) = Obj.magic _2 in
        let x : (Sast.expressao) = Obj.magic x in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos_x_ in
        let _endpos = _endpos_xs_ in
        let _v : (Sast.expressao Ast.expressoes) =     ( x :: xs ) in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = x;
          MenhirLib.EngineTypes.startp = _startpos_x_;
          MenhirLib.EngineTypes.endp = _endpos_x_;
          MenhirLib.EngineTypes.next = _menhir_stack;
        } = _menhir_stack in
        let x : (Ast.identificador Ast.pos * Ast.tipo) = Obj.magic x in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos_x_ in
        let _endpos = _endpos_x_ in
        let _v : ((Ast.identificador Ast.pos * Ast.tipo) list) =     ( [ x ] ) in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let {
          MenhirLib.EngineTypes.semv = xs;
          MenhirLib.EngineTypes.startp = _startpos_xs_;
          MenhirLib.EngineTypes.endp = _endpos_xs_;
          MenhirLib.EngineTypes.next = {
            MenhirLib.EngineTypes.semv = _2;
            MenhirLib.EngineTypes.startp = _startpos__2_;
            MenhirLib.EngineTypes.endp = _endpos__2_;
            MenhirLib.EngineTypes.next = {
              MenhirLib.EngineTypes.state = _menhir_s;
              MenhirLib.EngineTypes.semv = x;
              MenhirLib.EngineTypes.startp = _startpos_x_;
              MenhirLib.EngineTypes.endp = _endpos_x_;
              MenhirLib.EngineTypes.next = _menhir_stack;
            };
          };
        } = _menhir_stack in
        let xs : ((Ast.identificador Ast.pos * Ast.tipo) list) = Obj.magic xs in
        let _2 : (Lexing.position) = Obj.magic _2 in
        let x : (Ast.identificador Ast.pos * Ast.tipo) = Obj.magic x in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos_x_ in
        let _endpos = _endpos_xs_ in
        let _v : ((Ast.identificador Ast.pos * Ast.tipo) list) =     ( x :: xs ) in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = _1;
          MenhirLib.EngineTypes.startp = _startpos__1_;
          MenhirLib.EngineTypes.endp = _endpos__1_;
          MenhirLib.EngineTypes.next = _menhir_stack;
        } = _menhir_stack in
        let _1 : (Lexing.position) = Obj.magic _1 in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos__1_ in
        let _endpos = _endpos__1_ in
        let _v : (Ast.tipo) =            ( BOOLEAN 	) in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = _1;
          MenhirLib.EngineTypes.startp = _startpos__1_;
          MenhirLib.EngineTypes.endp = _endpos__1_;
          MenhirLib.EngineTypes.next = _menhir_stack;
        } = _menhir_stack in
        let _1 : (Lexing.position) = Obj.magic _1 in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos__1_ in
        let _endpos = _endpos__1_ in
        let _v : (Ast.tipo) =           ( INTEIRO 	) in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = _1;
          MenhirLib.EngineTypes.startp = _startpos__1_;
          MenhirLib.EngineTypes.endp = _endpos__1_;
          MenhirLib.EngineTypes.next = _menhir_stack;
        } = _menhir_stack in
        let _1 : (Lexing.position) = Obj.magic _1 in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos__1_ in
        let _endpos = _endpos__1_ in
        let _v : (Ast.tipo) =            ( REAL 		) in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = _1;
          MenhirLib.EngineTypes.startp = _startpos__1_;
          MenhirLib.EngineTypes.endp = _endpos__1_;
          MenhirLib.EngineTypes.next = _menhir_stack;
        } = _menhir_stack in
        let _1 : (Lexing.position) = Obj.magic _1 in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos__1_ in
        let _endpos = _endpos__1_ in
        let _v : (Ast.tipo) =            ( NONE 		) in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = _1;
          MenhirLib.EngineTypes.startp = _startpos__1_;
          MenhirLib.EngineTypes.endp = _endpos__1_;
          MenhirLib.EngineTypes.next = _menhir_stack;
        } = _menhir_stack in
        let _1 : (Lexing.position) = Obj.magic _1 in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos__1_ in
        let _endpos = _endpos__1_ in
        let _v : (Ast.tipo) =                  ( STRING 	) in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
    |]
  
  and trace =
    None
  
end

module MenhirInterpreter = struct
  
  module TI = MenhirLib.TableInterpreter.Make (Tables)
  
  include TI
  
end

let programa =
  fun lexer lexbuf ->
    (Obj.magic (MenhirInterpreter.entry 0 lexer lexbuf) : (Sast.expressao Ast.programa))

module Incremental = struct
  
  let programa =
    fun initial_position ->
      (Obj.magic (MenhirInterpreter.start 0 initial_position) : (Sast.expressao Ast.programa) MenhirInterpreter.checkpoint)
  
end
  

