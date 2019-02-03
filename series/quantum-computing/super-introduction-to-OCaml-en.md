---
layout: post
title:  "Super Introduction to OCaml"
tags:
  - Quantum Computer
---

Feb. 1, 2019.

Let's Implement Quantum Computer! [Index](index-en.html) [\|Next>](introduction-to-linear-algebra-en.html)

$$
\def\blo#1{\mathop{\mathcal{L}}(#1)}
\def\C{\mathbb{C}}
\def\H{\mathcal{H}}
\def\K{\mathcal{K}}
\def\defeq{:=}
\def\bra#1{\mathinner{\left\langle{#1}\right|}}
\def\ket#1{\mathinner{\left|{#1}\right\rangle}}
\def\braket#1#2{\mathinner{\left\langle{#1}\middle|#2\right\rangle}}
\def\abs#1{\left| #1 \right|}
\def\norm#1{\left\| #1 \right\|}
$$

We adopt OCaml, a functional programming language, to write a simulator for quantum computer
because the compatibility between quantum case analysis and functional programming is good.
OCaml is a functional programming language.
However fortunately (or unfortunately) we can easily write procedural codes.
We explain how to write OCaml code in this article for the readers who have not written codes in OCaml.
Note that the grammar explained followings is minimum for our purpose.
Some important part of OCaml are not refered.

## Grammar
In OCaml, a string enclosed by `(*` `*)` is a comment.
```ocaml
(* Hello, OCaml. This is a comment. *)
```

### Atomic Types and Operations
`+`, `-`, and `*` are operators on two integer.
We use keyword `let` to bind an integer to a variable:
```ocaml
let iplus = 1 + 2 (* 3 *)
let isub = 1 - 2 (* -1 *)
let imul = 2 * 3 (* 6 *)
```
The type for integer is `int`.

Of course, we can operate on two floating point numbers.
But we have to use another operator.
The type system of OCaml requires this rule.
```ocaml
let fplus = 1. +. 2.5 (* 3.5 *)
let fsub = 1.2 -. 2.5 (* -1.3 *)
let fmul = 2. *. 3. (* 6. *)
```
The type of double precision floating point is `float`.

OCaml also has boolean value.
To check if two values are equal or not, we use `=`.
(If you know C, corresponding symbol is `==`.)
To check if two values are not equal or not, we use `<>`.
(If you know C, corresponding symbol is `!=`.)
```ocaml
let tt = true
let ff = false
let b0 = 1 = 1 (* true *)
let b1 = 2 <> 2 (* false *)
let and_tf = true && false (* false *)
let or_tf = true || false (* true *)
```
The type of boolean value is `bool`.


### Conditional
We use `if ... then ... else ...` to express conditional.
Unlike other procedure procedural languages, we do not omit `else`.
We have to place expressions that have the same type after `then` and `else`.
```ocaml
let res0 = if 0 <= 100 then 1 else -1 (* 1 *)
let res0 = if 0 <= -100 then 1 else -1 (* -1 *)
```

### Function
To define functions, We use `let` and write a function name and name of argumants.
A function from type `a` to type `b` has the type `a -> b`.
For example, a function that returns the sign for givin integer is written as follows:
```ocaml
let sign n =
  if n = 0
  then 0
  else
    if n > 0
	then 1
	else -1
```
The type of this function is `int -> int`
Recalling variable binding again, we can think of it as a function taking zero arguments.

We can bind temporal variables in `let` by using `let`.
We write `let x = ... in ...` in `let` expression.
For example, a program to check if there exists a real number solution for given polynomial $a x^2 + bx + c = 0$ can be written as follows:
```ocaml
let discr a b c =
  let d = b *. b - 4. *. a *. c in
  d >= 0
  (* true if ond only if there exists a real number solution for ax^2 + bx + c = 0 *)
let d0 = discr 1. 2. 3. (* false *)
let d1 = discr 1. 5. 3. (* true *)
```
The type of this function is `float -> float -> float -> bool`.
Looking into this type in detail.
`->` is right-associative, so we can rewrite it and get `float -> (float -> (float -> bool))`.．
That is, `discr` is a function that takes one argument of type `float` and returns a value of type `float -> (float -> bool)`.n
What does this mean?
Now, Assume that we would like a function to check if there exists a real-number solution for given monic polynomial of degree two.
It is tedious to write again similar code above.
Fortunately, we can avoid such iteration by using `discr`:
```ocaml
let discr_for_monic = discr 1.
```
We give `discr` `1.`, and get desired function.
We think of multi argument function `discr` as one that takes single argument and returns a function.
This is *currying*.

### Recursion
Recursion is the one of most important notion of functional programming.
In OCaml, we use `let rec` to write recursive function.
For example, to get $n$th Fibonacci number we write as follows:
```ocaml
let rec fib n =
  if n <= 0
  then 1
  else (fib (n - 1)) + (fib (n - 2))
```
This code is very simple, but unfortunately too inefficient.
To improve efficiency, we should write as follows:
(Note that strictly speaking, the upper code and the lower code have different semantics.
For example, when we give the programs `-1` as `n`, how do they behave?
We left it to the readers to modify the code so as to be safe against such mean input.)
```ocaml
let fib n =
  let rec fib' a b i =
    if i = n
	then b
	else fib' b (a + b) (i + 1) in
  fib' 0 1 0
```

### Array
In ordinary article introducing OCaml (or functional programming), explanation of list, not array, should be placed here.
Now, However, we explain array for the purpose of simulating quantum computer here.

We can construct an array by enumerating elements in `[|` `|]`.
We use `;` to separate elements.
```ocaml
let three_three_four = [| 3; 3; 4 |]
```
The type of `three_three_four` is `int array`.
The index of an array starts from $0$.
We can access the $n$th element as follows:
```ocaml
let three_three_four_0 = h.(0) (* 3 *)
let three_three_four_1 = h.(3 - 2) (* 3 *)
let three_three_four_2 = h.(2) (* 4 *)
```

We can get the length of an array by using a function `Array.length` in the standard library.
```ocaml
let len_ttf = Array.length three_three_four (* 3 *)
```

We can construct two dimensional array:
```ocaml
let m = [|
  [| 1; 2; 3|];
  [| 4; 5; 6; 7 |];
  [| 8 |]           |]
```
The type of `m` is `int array array`.
We can access the elements as follows:
```ocaml
let m00 = m.(0).(0) (* 1 *)
let m12 = m.(1).(2) (* 6 *)
let m1 = m.(1) (* [| 4; 5; 6; 7 |] *)
```

### Higher Function
In OCaml, functions are value like integer, floating point number, or boolean value.
This means that we can define naturally a function taking functions as arguments or one returning a function.
Let's see examples.
We have a function `Array.map` in the standard library.
The type of this function is `('a -> 'b) -> 'a array -> 'b array`,
where `a` `b` are type variables, which can be replaced by arbitrary concrete types.
As we can guess from the type, `Array` takes functions and array and returns the array generated by applying the function to the each element in the array.
```ocaml
let ttf =
  let add1 n = 1 + n in
  Array.map add1 [| 2; 2; 3 |]
  (* [| 3; 3; 4 |] *)
```
OCaml has a notation for us to write concisely temporal function such as `add1`.
We can rewrite `ttf` as folows:
```ocaml
let ttf = Array.map (fun n -> 1 + n) [| 2; 2; 3 |]
```
The additive operation `+` on two integers is also a function.
If we would like to use it as an ordinal function, we write `(+)`:
```ocaml
let three = (+) 1 2 (* 3 *)
```
We can rewrite `ttf` as follows using this notation:
```ocaml
let ttf = Array.map ((+) 1) [| 2; 2; 3 |]
```

Let's see another example.
We can use `Array.init` to generate an array with specified length.
The type of this function is `int -> (int -> 'a) -> 'a array`.
It takes an integer of the length and a function to initialize the array, and returns the initialized array.
```ocaml
let one_two_three = Array.init 3 ((+) 1) (* [| 1; 2; 3 |] *)
```

## References
In addition to features explained here,
there are many ones in OCaml.
Especially, we did not explain how to receive input and output a result.
We explain them as necessary.
If you would like to know in detail, see [The OCaml system 
release 4.07: Documentation and user’s manual](http://caml.inria.fr/pub/docs/manual-ocaml/#sec544)


Let's Implement Quantum Computer! [Index](index.html) [\|Next>](introduction-to-linear-algebra-en.html)
