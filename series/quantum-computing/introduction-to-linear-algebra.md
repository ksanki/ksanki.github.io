---
layout: post
title:  "線型代数の復習"
tags:
  - 量子コンピュータ
---

2019年1月29日

量子コンピュータ入門 [目次](index.html) [<前\|](super-introduction-to-OCaml.html) [\|次>](tensor-product.html)

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

このシリーズではベクトル空間といえば複素数体$\C$上のベクトル空間のこととする．
また，量子力学では一般には可分なヒルベルト空間を扱うようであるが，ここでは有限次元で十分である．
ゆえにあまり完備性などを気にする必要はない．
（ここでの「可分」「ヒルベルト空間」「完備性」の意味が分からなくても，以降の記事を読むのに差し支えないようになっている）

## 表記法と定義
左辺の$A$を右辺の$B$によって定義するという意味の等式を
$$ A \defeq B $$
と書くことにする．

### ブラケット表記
ベクトル空間 $V$ のベクトルのことを $\ket{\phi}$ と書く．
例えば$ \C^2 $の標準基底を次のように書く：

$$
\ket{0} \defeq \begin{pmatrix} 1 \\ 0 \end{pmatrix},
\ \ket{1} \defeq \begin{pmatrix} 0 \\ 1 \end{pmatrix}.
$$

またベクトル$\ket{\phi} \in V$について，その共役転置ベクトル（つまり各成分について複素共役をとり，転置したベクトル）を$\bra{\phi}$と書く．
例えば以下が成り立つ：

$$
\bra{0} = \begin{pmatrix} 1 & 0 \end{pmatrix},
\ \bra{1} = \begin{pmatrix} 0 & 1 \end{pmatrix}.
$$

より一般的には

$$ \ket{\phi} \defeq \begin{pmatrix} a_1 \\ \vdots \\ a_n \end{pmatrix} $$

に対して

$$ \bra{\phi} = \begin{pmatrix} \bar{a_1} & \cdots & \bar{a_n} \end{pmatrix} $$

である．ただし，ここで$\bar{a}$は$a \in \C$の複素共役を表す．

### 内積・ノルム
ベクトル$ \ket{\phi}, \ket{\psi} \in \C^2 $があるとする．
それらの内積は$\braket{\phi}{\psi} \defeq \bra{\phi}\ket{\psi}$である．
これは線型代数の教科書でよく見る内積をブラケット記法で表しただけだ．
例えば

$$
\braket{0}{0} = \bra{0}\ket{0} = \begin{pmatrix} 1 & 0 \end{pmatrix} \begin{pmatrix} 1 \\ 0 \end{pmatrix} = 1
$$

である．

ベクトル$\ket{\phi} \in V$のノルムを$\norm{\ket{\phi}} \defeq \sqrt{\braket{\phi}{\phi}}$で定義する．
これも我々がよく目にするノルムの定義をブラケットを用いて書いただけだ．
例えばベクトル

$$ \ket{\phi} \defeq \begin{pmatrix} a_1 \\ \vdots \\ a_n \end{pmatrix} $$

に対して

$$
\norm{\ket{\phi}}
= \sqrt{
    \begin{pmatrix} \bar{a_1} & \cdots & \bar{a_n} \end{pmatrix}
    \begin{pmatrix} a_1 \\ \vdots \\ a_n \end{pmatrix}
  }
= \sqrt{\bar{a_1}a_1 + \cdots + \bar{a_n}a_n}
= \sqrt{\abs{a_1}^2 + \cdots + \abs{a_n}^2}.
$$

### 行列
$A$を$\C$係数$n \times n$行列とする．行列のことを（線型）作用素ともいう．
$\ket{\phi} \in \C^n$のとき，$A\ket{\phi}$で行列のベクトルへの通常の作用を表す．
例えば$$X \defeq \begin{pmatrix} 0 & 1 \\ 1 & 0 \end{pmatrix}$$のとき$X\ket{0} = \ket{1}$である．

作用素$A$の随伴作用素（有限次元では共役転置行列のこと）を$A^{\dagger}$と書く．
例えば$$ A \defeq \begin{pmatrix} a_{11} & a_{12} \\ a_{21} & a_{22} \end{pmatrix} $$のとき，$$ A^{\dagger} = \begin{pmatrix} \bar{a_{11}} & \bar{a_{21}} \\ \bar{a_{12}} & \bar{a_{22}} \end{pmatrix} $$である．

作用素$$A$$がユニタリであるとは$$ A^{\dagger} A = A A^{\dagger} = I $$が成り立つことをいう．ここで$I$は恒等作用素（単位行列）である．
例えば$$ X \defeq \begin{pmatrix} 0 & 1 \\ 1 & 0 \end{pmatrix} $$は

$$
X^{\dagger} X
= X X^{\dagger}
= \begin{pmatrix} 0 & 1 \\ 1 & 0 \end{pmatrix} \begin{pmatrix} 0 & 1 \\ 1 & 0 \end{pmatrix}
= \begin{pmatrix} 1 & 0 \\ 0 & 1 \end{pmatrix}
$$

を満たすのでユニタリ作用素である．

量子コンピュータ入門 [目次](index.html) [<前\|](super-introduction-to-OCaml.html) [\|次>](tensor-product.html)
