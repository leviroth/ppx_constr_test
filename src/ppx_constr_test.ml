open Ppx_core

let name = "constr_test"

let expand ~loc ~path:_ (constructor : string) constructor_argument =
  let (module A) = Ast_builder.make loc in
  let pattern_argument = Option.map constructor_argument ~f:(fun _ -> A.ppat_any) in
  let pattern = A.(ppat_construct {txt = lident constructor; loc} pattern_argument) in
  [%expr function | [%p pattern] -> true | _ -> false]

let ext =
  Extension.declare
    name
    Extension.Context.expression
    Ast_pattern.(single_expr_payload (pexp_construct (lident __) __))
    expand

let () = Ppx_driver.register_transformation name ~extensions:[ext]

