open Ppx_core

let name = "constr_test"

let expand ~loc ~path constructor constructor_argument =
  let (module A) = Ast_builder.make loc in
  let pattern_argument = Option.map constructor_argument ~f:(Fn.const A.ppat_any) in
  let pattern = A.(ppat_construct (Located.mk constructor) pattern_argument) in
  [%expr function | [%p pattern] -> true | _ -> false]

let ext =
  Extension.declare
    name
    Extension.Context.expression
    Ast_pattern.(single_expr_payload (pexp_construct __ __))
    expand

let () = Ppx_driver.register_transformation name ~extensions:[ext]

