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
  | Let of func * expression
[@@deriving show { with_path = false }]

and declaration = string * string list * expression
[@@deriving show { with_path = false }]

and func =
  | Function of declaration
  | RecFunction of declaration
[@@deriving show { with_path = false }]

let func_name = function
  | Function (name, _, _)
  | RecFunction (name, _, _) -> name