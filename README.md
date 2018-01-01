This simple ppx rewriter allows you to test if a variant instance matches a given constructor. For example,

```ocaml
type t = Int of int | Char of char

let () =
  assert ([%constr_test Int __] (Int 1))
```

A placeholder such as `__` must be used to tell the rewriter if the desired constructor takes arguments.
