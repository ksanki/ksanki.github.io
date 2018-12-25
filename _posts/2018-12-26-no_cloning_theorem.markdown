---
layout: post
title:  "量子複製不可能定理"
tags:
  - 量子力学
---
$$
\def\bra#1{\mathinner{\left\langle{#1}\right|}}
\def\ket#1{\mathinner{\left|{#1}\right\rangle}}
\def\braket#1#2{\mathinner{\left\langle{#1}\middle|#2\right\rangle}}

\def\C{\mathbb{C}}
\def\Qbit{\C^{\oplus 2}}
$$

2つの量子系$A, B$があるとする．
量子計算では，量子系$A$の一般の状態を，$A$の状態を保ったまま$B$にコピーすることは不可能である．
これを量子複製不可能定理(no-cloning theorem)という．
このことは以下のように簡単に証明できる．

## 量子複製不可能定理の主張の形式化
量子系$A, B$に対応するヒルベルト空間は
どちらも$H := \Qbit = \langle \ket{0}, \ket{1} \rangle$であるとする．
このときユニタリ作用素$U$であって，
$A$の量子状態を，$A$の状態を保ったまま${B}にコピーするようなものは存在しない．
つまり任意の状態$\ket{\phi}_A \in H$について

$$
U \ket{\phi}_A \ket{0}_B = \ket{\phi}_A \ket{\phi}_B
$$

を満たすものは存在しない．

## 証明
状態をコピーできるようなユニタリ作用素$U$が存在すると仮定して矛盾を導く．
$ \ket{\phi}_A := \alpha \ket{0}_A + \beta \ket{1}_A $
とおいて計算すると

$$
\begin{align*}
  U \ket{\phi}_A \ket{0}_B
  &= U (\alpha \ket{0}_A + \beta \ket{1}_A) \ket{0}_B \\
  &= \alpha U \ket{0}_A \ket{0}_B + \beta U \ket{1}_A \ket{0}_B \\
  &= \alpha \ket{0}_A \ket{0}_B + \beta \ket{1}_A \ket{1_B}
\end{align*}
$$

である．
一方，

$$
\begin{align*}
  U \ket{\phi}_A \ket{0}_B
  =& \ket{\phi}_A \ket{\phi}_B \\
  =& (\alpha \ket{0}_A + \beta \ket{1}_A) (\alpha \ket{0}_B + \beta \ket{1}_B) \\
  =& \alpha^2 \ket{0}_A \ket{0}_B + \alpha \beta \ket{0}_A \ket{1}_B \\
  &  + \beta \alpha \ket{1}_A \ket{0}_B + \beta^2 \ket{1}_A \ket{1}_B \\
\end{align*}
$$

も得られるが，明らかにこれら2つの式の右辺は異なる．
よって量子状態を複製するようなユニタリ作用素$U$は存在しない．

## 量子状態の移動
量子複製不可能定理は量子状態のコピーを作ることができないことを主張している．
しかし，量子状態を系$A$から系$B$へ（系$A$の状態を破壊して）移動させることは可能である．
これは量子テレポーテーションを用いて行うことができる．

## 参考文献
細谷暁夫. 量子コンピュータの基礎 [第2版]. *SGCライブラリ* Vol. 69, 2009.
