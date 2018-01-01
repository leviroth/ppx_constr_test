type t =
  | No_arg
  | One_arg of int
  | Two_args of int * int

let () =
  assert ([%constr_test No_arg] No_arg);
  assert (not ([%constr_test No_arg] (One_arg 1)));
  assert ([%constr_test One_arg __] (One_arg 1));
  assert ([%constr_test Two_args __] (Two_args (1, 2)));
  assert (not ([%constr_test One_arg __] (Two_args (1, 2))))


