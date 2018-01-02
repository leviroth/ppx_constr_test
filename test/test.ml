type t =
  | No_arg
  | One_arg of int
  | Two_args of int * int

let%test "no_arg_true" = [%constr_test No_arg] No_arg
let%test "no_arg_false" = not @@ [%constr_test No_arg] (One_arg 1)
let%test "one_arg_true" = [%constr_test One_arg __] (One_arg 1)
let%test "one_arg_false" = not @@ [%constr_test One_arg __] (Two_args (1, 2))
let%test "two_args_true" = [%constr_test Two_args __] (Two_args (1, 2))
let%test "two_args_false" = not @@ [%constr_test Two_args __] (One_arg 1)

let%test "alternate_pattern_name" = [%constr_test One_arg x] (One_arg 1)
let%test "multiple_pattern_names" = [%constr_test Two_args (x, y)] (Two_args (1, 2))

let () =
  Ppx_inline_test_lib.Runtime.exit ()
