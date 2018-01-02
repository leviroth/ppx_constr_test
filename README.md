This simple ppx rewriter allows you to test if a variant instance matches a
given constructor. `[%constr_test <constructor>] x` returns true iff
`<constructor>` is the constructor of `x`. For example,

```ocaml
[%constr_test None] None        = true
[%constr_test None] (Some 1)    = false

[%constr_test Some __] (Some 1) = true
[%constr_test Some __] None     = false
```

For constructors that take arguments, an argument pattern such as `__` must be
included; otherwise, the rewriter cannot infer the arity of the constructor.
