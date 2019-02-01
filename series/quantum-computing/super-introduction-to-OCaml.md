---
layout: post
title:  "OCaml 超入門"
tags:
  - 量子コンピュータ
---

2019年2月1日

量子コンピュータ入門 [目次](index.html) [\|次>](introduction-to-linear-algebra.html)

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

量子コンピュータのシミュレーションを行うためのプログラミング言語として OCaml を採用する．
その理由は，量子的場合分け文の表記と関数型プログラミングの相性がよいからだ．
OCaml は関数型言語でありながら手続き的な処理も非常に簡単に書ける（書けてしまう）．
OCaml でコードを書いたことがなくても理解できるようここで必要な構文などを説明する．
ただし以下で説明することは，この記事を読むにあたって必要最小限のことのみであり，
OCaml を普通に学ぶにあたって重要なことのうちいくつか（例えばリストなど）は省略されている．

## 文法
OCaml では `(*` `*)` で挟まれた文字列はコメントである．
```ocaml
(* Hello, OCaml. This is a comment. *)
```

### 基本的な型と演算
2 つの整数に演算を行なって変数に束縛するには `let` を使って次のように書く：
```ocaml
let iplus = 1 + 2 (* 3 *)
let isub = 1 - 2 (* -1 *)
let imul = 2 * 3 (* 6 *)
```
整数型は`int`である．

2 つの浮動小数点数を扱うことももちろんできる．
ただし演算子は整数のときとは別のものを使わなければならない．
これは OCaml の型システムの要請だ．
```ocaml
let fplus = 1. +. 2.5 (* 3.5 *)
let fsub = 1.2 -. 2.5 (* -1.3 *)
let fmul = 2. *. 3. (* 6. *)
```
倍精度浮動小数点数の型は `float` である．

真偽値型の値もある．
値が同じかどうかの比較には `=` を用いる（C言語を知っているならこれは`==`のことである）．
また値が等しくないことのチェックには `<>` を用いる（C言語を知っているならこれは`!=`のことである）．
```ocaml
let tt = true
let ff = false
let b0 = 1 = 1 (* true *)
let b1 = 2 <> 2 (* false *)
let and_tf = true && false (* false *)
let or_tf = true || false (* true *)
```
真偽値型は `bool` である．


### 条件分岐
条件分岐には `if ... then ... else ...` を用いる．
（他の手続き型言語と違って）基本的に `else` は省略せず，`then` と `else` の後にはそれぞれ同じ型を持つ式がなければならない．
```ocaml
let res0 = if 0 <= 100 then 1 else -1 (* 1 *)
let res0 = if 0 <= -100 then 1 else -1 (* -1 *)
```


### 関数
関数を定義するには `let` を使って，関数名の後に続けて引数の名前を記述する．
`a` という型から `b` という型への関数は `a -> b` という型を持つ．
例えば与えられた整数の符号を返す関数は
```ocaml
let sign n =
  if n = 0
  then 0
  else
    if n > 0
	then 1
	else -1
```
と書ける．この関数の型は`int -> int`である．
ここで変数束縛を再び思い出すと，変数束縛は $0$ 個の引数をとる関数のことだと理解できる．

`let` の中で，一時的に使用する変数を `let` で束縛することができる．
そのときは `let x = ... in ...` とする．
例えば二次方程式 $a x^2 + bx + c = 0$ の実数解が存在するかどうかの判定は次のように書ける．
```ocaml
let discr a b c =
  let d = b *. b - 4. *. a *. c in
  d >= 0
  (* true if ond only if there exists a real number solution for ax^2 + bx + c = 0 *)
let d0 = discr 1. 2. 3. (* false *)
let d1 = discr 1. 5. 3. (* true *)
```
この関数の型は `float -> float -> float -> bool` である．
この型について詳しく調べよう．
`->`は右結合なので括弧をつけると`float -> (float -> (float -> bool))` である．
つまり `discr` は `float` 型の引数を 1 つとって，`float -> (float -> bool)` 型の値を返す関数だと言っている．
これはどういうことだろうか．
今，モニック $2$ 次多項式（$a = 1$である $2$ 次多項式）の実数解判定が欲しくなったとしよう．
上で書いたような処理を再び書くことは面倒臭い．
幸運なことに既にある `discr` を用いて書けば面倒を避けることができる．
```ocaml
let discr_for_monic = discr 1.
```
これは `discr` に `1.` を与えて，多項式 $x^2 + bx + c = 0$ の実数解の存在判定を行う関数を得ている．
このように複数引数の関数を$1$引数の関数として扱うことを*カリー化*という．

### 再帰
再帰は関数型プログラミングでは非常に重要だ．
OCaml では再帰を書くためには `let rec` という構文を使う．
例えば $n$ 番目のフィボナッチ数を求めるには次のように書く：
```ocaml
let rec fib n =
  if n <= 0
  then 1
  else (fib (n - 1)) + (fib (n - 2))
```
このコードは非常に簡潔だが，残念なことに効率が悪すぎる．
効率を改善するためには次のように書くべきだ：
（注意：上のコードと下のコードでは厳密にはプログラムの意味が異なっている．
例えば `n` として `-1` を与えたときにどうなるだろうか．
このような意地悪な入力に対して安全な振る舞いをするようにコードを変更することは練習問題とする．）
```ocaml
let fib n =
  let rec fib' a b i =
    if i = n
	then b
	else fib' b (a + b) (i + 1) in
  fib' 0 1 0
```

### 配列
普通のOCamlの入門記事では（あるいは関数型プログラミングの入門記事では）ここにはリストの説明が来るべきである．
しかし今は量子コンピュータのシミュレーションという目的のために，リストではなく配列を説明する．
配列は `[|` `|]` の中に同じ型の要素を列挙することで記述できる．区切り文字として`;`を用いる．
```ocaml
let three_three_four = [| 3; 3; 4 |]
```
`three_three_four` の型は`int array`である．
配列の要素のインデックスは $0$ から始まっている．
$n$番目の要素にアクセスするには次のようにする：
```ocaml
let three_three_four_0 = h.(0) (* 3 *)
let three_three_four_1 = h.(3 - 2) (* 3 *)
let three_three_four_2 = h.(2) (* 4 *)
```

配列の長さを得るには標準ライブラリの `Array.length` を用いる．
```ocaml
let len_ttf = Array.length three_three_four (* 3 *)
```

$2$次元配列も作ることができる：
```ocaml
let m = [|
  [| 1; 2; 3|];
  [| 4; 5; 6; 7 |];
  [| 8 |]           |]
```
`m` の型は `int array array` である．
要素には次のようにアクセスできる：
```ocaml
let m00 = m.(0).(0) (* 1 *)
let m12 = m.(1).(2) (* 6 *)
let m1 = m.(1) (* [| 4; 5; 6; 7 |] *)
```


### 高階関数
OCaml では関数は整数や浮動小数点数や真偽値と同じく値である．
このことは関数を引数にとる関数や，関数を返す関数などを自然に定義することができることを意味している．
具体的に見ていこう．
標準ライブラリに `Array.map` という関数がある．
この関数の型は `('a -> 'b) -> 'a array -> 'b array` である．
ここで　`'a` `'b` は型変数であり，任意の他の具体的な型で置き換えられることを示している．
さて，型から推測できるように `Array.map` は関数と配列を受け取り，その関数を配列の各要素に適用して得られる配列を返す．
```ocaml
let ttf =
  let add1 n = 1 + n in
  Array.map add1 [| 2; 2; 3 |]
  (* [| 3; 3; 4 |] *)
```
OCaml には `add1` のような一時的に用いる関数を簡潔に書くための記法が用意されている．
それを使うと `ttf` は次のように書ける．
```ocaml
let ttf = Array.map (fun n = 1 + n) [| 2; 2; 3 |]
```
整数の加法演算`+`は実は関数である．
普通の関数のように扱うときには`(+)`と書く．
```ocaml
let three = (+) 1 2 (* 3 *)
```
これを用いると`ttf`は次のようにも書ける．
```ocaml
let ttf = Array.map ((+) 1) [| 2; 2; 3 |]
```

他の例を見よう．
指定された長さの配列を作るには `Array.init` を使う．
この関数の型は `int -> (int -> 'a) -> 'a array` である．
長さを表す整数と，各要素を初期化するための関数を取り，初期化された配列を返す．
```ocaml
let one_two_three = Array.init 3 ((+) 1) (* [| 1; 2; 3 |] *)
```

## 文献など
この他にも OCaml の説明すべき機能はいろいろある．
特に入出力の方法を書かなかった．
これらは必要に応じて説明することにする．
OCaml の詳しい機能が知りたい場合は[OCaml のマニュアル](http://caml.inria.fr/pub/docs/manual-ocaml/#sec544)や，日本語で書かれた説明としては，五十嵐淳. *プログラミング in OCaml 〜関数型プログラミングの基礎からGUI構築まで〜*. 技術評論社. 2007. がよい．

量子コンピュータ入門 [目次](index.html) [\|次>](introduction-to-linear-algebra.html)
