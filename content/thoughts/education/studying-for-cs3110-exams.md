+++
title = "My tips for studying for CS 3110 exams"
+++

These are some of my thoughts on what I found helpful when studying for this class.

**Be able to teach each learning objective.** This is a more general studying tip. You can teach to a rubby ducky or a person, it doesn't really matter. It's an active learning exercise. If you *can* teach it, you likely understand it well. But if you stuggle with this, it's okay, now you know what to work on! The purpose is to identify your knowledge gaps by attempting to teach, and when you succeed, you are in better shape!

**Practice written problems.** The exam involves writing a lot of code. You want to be comfortable writing code on paper. It's NOT the same to practice via typing. Writing involves more connected mental structure in order to form the words.

**You want to be like utop.** Utop can tell what expressions are valid, what types the well-formed expressions are, and what well-formed expressions evaluate to. A lot of the exam involves being able to understand how code is processed. My recomendation: write the code first, anticipate what will happen, verify with utop. Another advantage of utop is that it provides a fast feedback loop.

**Master first principles.** Know what let statements are syntactic sugar for. Know that multi-argument functions are also syntactic sugar, and for what. Know that everything can be boiled down to a ton of anonymous functions. You don't have to always view problems this way, but sometimes it can be helpful.

**Be cautious of using sugar.** Syntactic sugar is nice, but it's sometimes easy to make silly mistakes with them. Just because it exists, doesn't mean you *need* to use them. Personally, I avoided a lot of sugar until I was comfortable with what the sugar stood for.

The following functions are the same:
```ocaml
let f x y = x + y

let g x = (fun y -> x + y)

let h = (fun x -> (fun y -> x + y))
```

**Know how abstractions are implemented.** You are given many abstractions, like `List.map` for example and linked lists. You should know how they are implemented. This is related to mastering first principles. Sometimes it might help to be able to deconstruct a problem into smaller components. Sometimes, it might not help.

**Be able to use different mental models when convenient and switch around.** This is a general tip. Be able to use different mental models where they are most useful. Sometimes you might make more progress thinking of `List.fold_right` intuitively, but sometimes you might make more progress thinking of it through its implementation. Having more mental models gives you more options to reason with.

**Write your cheat sheet by hand.** Some iterations of this course allow you a cheatsheet. I would recommend writing it by hand, over typing it or printing slides. Cheatsheets are best served as a study tool, being a reference is its secondary purpose. Writing things down is the best way to commit things to memory.

**When in doubt, add parenthesis.** This is usually relevant for operators, and where you put parenthesis depends on associativity. Observe the following examples for right-associative operations.

- `int -> int -> int` is the same as `int -> (int -> int)`
- `1 :: 2 :: lst` is the same as `1 :: (2 :: lst)`
