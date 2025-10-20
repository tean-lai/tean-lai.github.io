+++
title = "Avoiding redundant allocations in OCaml"
+++

It's easy to make redudant memory allocations in OCaml. It's common to prioritize correctness over performance.

However, we can't always overlook performance.

Observe this pattern:
```ocaml
match x with
  | None -> Some 0
  | Some n -> Some n  (* <--- this can be a problem *)
```

Line 3 is the problem, there the branch reallocates a new object in memory that is structurally the same.

A more-performant, but structurally equal implmenetation is the following alternative:
```ocaml
match x with
  | None -> Some 0
  | Some n -> x
```

It's a small change, but it can make a difference at a large scale.

## Hash-consing
Sometimes it's hard to avoid reallocating objects with the same structure.

For example, you might have a pure function `f : 'a -> 'b`, which will always produce a new allocation.

Instead of avoiding the reallocation, you can also avoid keeping the extra allocations around.

Hash-consing is one technique to do this. Essentially, you keep a hash table that maps each element to itself. When you allocate a new object, you can check if one that is structurally the same already exists by checking the hash table. If you find one, you use the original allocation instead, allowing the new allocation to be freed by the garbage collector.

Below is some code that could be used to implement this.

```ocaml
let table = Hashtbl.create 10 in

let remove_extra_alloc maybe_repeat =
  match Hashtbl.find_opt table maybe_repeat with
    (* was a repeat, use original *)
    | Some original -> original
    (* was not a repeat, add itself to the table as the original *)
    | None -> Hashtbl.add table maybe_repeat 
```

This does introduce overhead due to hash table checking, but in some programs, it can dramatically reduce memory pressure, leading to improved performance.

