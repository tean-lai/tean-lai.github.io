+++
title = "Avoid redundant allocations in OCaml"
+++

It's easy to make redudant memory allocations in OCaml. It's common to prioritize correctness over performance.

However, we can't always overlook performance.

Observe this pattern:
```ocaml
match x with
  | None -> Some 0
  | Some n -> Some n  (* <--- this can be a problem *)
```

The branch reallocates a new object in memory that is structurally the same.

A more-performant, but structurally equal is to change that line to:
```ocaml
  | Some n -> x
```

It's a small change, but it can make a difference.
