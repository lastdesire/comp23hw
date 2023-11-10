type constant = CInt of int [@@deriving show { with_path = false }]

type binop =
  | Add (** + *)
  | Sub (** - *)
  | Mul (** * *)
  | Eq (** = *)
[@@deriving show { with_path = false }]

type expression =
  | Const of constant
  | Var of string
  | BinOp of binop * expression * expression
  | IfThenElse of expression * expression * expression
  | Application of expression * expression * expression list
[@@deriving show { with_path = false }]

type declaration = string * string list * expression

type func =
  | Function of declaration
  | RecFunction of declaration
