type constant =
  | CInt of int

type binop = 
  | Add (** + *)
  | Div (** - *)
  | Mul (** * *)

  | Eq (** = *)

type expression =
  | Const of constant
  | BinOp of binop * expression * expression
  | IfThenElse of expression * expression * expression
  | Application of expression * expression * expression list

type declaration = string * string list * expression

type func =
  | Function of declaration
  | RecFunction of declaration
