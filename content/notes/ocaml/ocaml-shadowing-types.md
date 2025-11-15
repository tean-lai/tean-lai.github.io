+++
title = "Shadowing types in OCaml"
+++

One weird thing in OCaml is that like variables, you can shadow types.

Shadowing types is NOT the same as overriding a type.

Here is an example:

```ocaml
let x = 3
type int = Type
let y = Type
let z = 10
let w : int = 2
```
Here, the original int type still technically exists, but you just can't access it through the type `int` anymore. `z` can still be defined, because OCaml can still infer it's got the original int type, but we can't define `w` like that, because the type annotation for `int` now means something else.


## It can get funky in utop

Utop can show some weird things when you shadow types. I will overshadow ints again as an example. Check out the following experiment in utop. The curious thing is that here, since the original `int` type got overshadowed twice, typing in an integer will say it's got type `int/3`, because it's matches the type of the third to last `int` definition.
```ocaml
──────────┬─────────────────────────────────────────────────────────────┬───────────
          │ Welcome to utop version 2.16.0 (using OCaml version 5.3.0)! │
          └─────────────────────────────────────────────────────────────┘

Type #utop_help for help about using utop.

─( 00:11:41 )─< command 0 >──────────────────────────────────────────{ counter: 0 }─
utop # type int = A;;
type int = A
─( 00:11:41 )─< command 1 >──────────────────────────────────────────{ counter: 0 }─
utop # let a = A;;
val a : int = A
─( 00:11:56 )─< command 2 >──────────────────────────────────────────{ counter: 0 }─
utop # type int = B;;
type int = B
─( 00:11:59 )─< command 3 >──────────────────────────────────────────{ counter: 0 }─
utop # let b = B;;
val b : int = B
─( 00:12:03 )─< command 4 >──────────────────────────────────────────{ counter: 0 }─
utop # a;;
- : int/2 = A
─( 00:12:06 )─< command 5 >──────────────────────────────────────────{ counter: 0 }─
utop # 10;;
- : int/3 = 10
─( 00:12:07 )─< command 6 >──────────────────────────────────────────{ counter: 0 }─
```