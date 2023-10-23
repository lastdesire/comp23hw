exception Parsed_tree_error of string
val parsed_tree_error : string -> 'a
type constant = CInt of int
type binop = Add | Sub | Mul | Eq
type expression =
    Const of constant
  | Var of string
  | BinOp of binop * expression * expression
  | IfThenElse of expression * expression * expression
  | Application of expression * expression * expression list
type declaration = string * string list * expression
type func = Function of declaration | RecFunction of declaration
