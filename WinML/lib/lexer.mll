{
  open Lexing
  open Parser
}

let digit = ['0' - '9']
let space = [' ' '\t' '\n' '\r']
let const_int = digit+

let ident = ['a'-'z'] ['a'-'z' 'A'-'Z' '0'-'9' '_']*

rule token = parse
 | space+  { token lexbuf }
 | const_int   { INT (int_of_string (lexeme lexbuf)) }
 (* | "true"  { BOOL(true) } *)
 (* | "false" { BOOL(false) } *)
 | ident   { IDENT (lexeme lexbuf) }
 | "let"   { LET }
 | "if"    { IF }
 | "then"  { THEN }
 | "else"  { ELSE }
 | "rec"   { REC }
 (* | "in"    { IN } *)
 (* | ";"     { SEMICOLON } *)
 | '('     { LPAREN }
 | ')'     { RPAREN }
 (* | "not"   { NOT } *)
 | '='     { EQUAL }
 | "=="    { EQUAL_EQUAL }
 | '-'     { MINUS }
 | '+'     { PLUS }
 | '*'     { MULT }
 (* | '/'     { DIV } *)
 (* | "!="    { NOT_EQUAL } *)
 (* | "<="    { LESS_EQUAL } *)
 (* | ">="    { GREATER_EQUAL } *)
 (* | '<'     { LESS } *)
 (* | '>'     { GREATER } *)
 | eof     { EOF }
 | _ { raise (Failure ("Unexpected token " ^ Lexing.lexeme lexbuf)) }
