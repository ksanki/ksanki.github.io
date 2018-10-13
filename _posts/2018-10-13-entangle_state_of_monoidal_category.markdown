---
layout: post
title:  "モノイダル圏のエンタングル状態"
tags:
  - 量子力学
  - モノイダル圏
  - ヒルベルト空間
---
$$
\def\bra#1{\mathinner{\left\langle{#1}\right|}}
\def\ket#1{\mathinner{\left|{#1}\right\rangle}}
\def\braket#1#2{\mathinner{\left\langle{#1}\middle|#2\right\rangle}}

\def\C{\mathbb{C}}
\def\Qbit{\C^{\oplus 2}}
\def\cat#1{\mathscr{#1}}
\def\id{\mathrm{id}}
$$

量子力学ではヒルベルト空間のエンタングル状態を考える．
これをモノイダル圏に一般化してみる．

## ヒルベルト空間のエンタングル状態
### 定義（ヒルベルト空間の積状態，エンタングル状態）
$ H, K $を系$ A, B $に対応するヒルベルト空間とする．
すると$ A, B $の複合量子系に対応するヒルベルト空間はテンソル積$ H \otimes K $となる．
$ \ket{\phi} \in H $と$ \ket{\psi} \in K $によって$ \ket{\phi} \otimes \ket{\psi} $と表されるような$ H \otimes K $の元を積状態と呼ぶ．
一方，そのように表されない$ H \otimes K $の元をエンタングル状態と呼ぶ．

### 例
$ \Qbit $の基底を$ \ket{0}, \ket{1} $とする．
$ \Qbit \otimes \Qbit $の状態$ \ket{00} = \ket{0} \otimes \ket{0} $は定義から積状態である．
一方$ \frac{1}{\sqrt{2}}\ket{00} + \frac{1}{\sqrt{2}}\ket{11} $はエンタングル状態である．

これは明らかだが，念のため証明する．
仮に
\\[
\ket{\phi} \otimes \ket{\psi} = \frac{1}{\sqrt{2}}\ket{00} + \frac{1}{\sqrt{2}}\ket{11}
\\]
と表されたとする．
$ \ket{\phi} = a_{0}\ket{0} + a_{1}\ket{1},
\ket{\psi} = b_{0}\ket{0} + b_{1}\ket{1} $とおく．
するとテンソル積は

$$
\begin{align*}
  \ket{\phi} \otimes \ket{\psi}
  & = (a_{0}\ket{0} + a_{1}\ket{1}) \otimes (b_{0}\ket{0} + b_{1}\ket{1}) \\
  & = a_{0}b_{0}\ket{00} + a_{0}b_{1}\ket{01} + a_{1}b_{0}\ket{10} + a_{1}b_{1}\ket{11}
\end{align*}
$$

と計算される．
すると係数の比較から

$$
\begin{align*}
a_{0}b_{0} = a_{1}b_{1} &= \frac{1}{\sqrt{2}}, \\
a_{0}b_{1} = a_{1}b_{0} &= 0
\end{align*}
$$

でなければならないが，これはありえないので結局
$ \frac{1}{\sqrt{2}}\ket{00} + \frac{1}{\sqrt{2}}\ket{11} $
がエンタングル状態であることが証明された．

## モノイダル圏
まずモノイダル圏を復習する．
### 定義（モノイダル圏）
圏$ \cat{C} $がモノイダル圏であるとは，次のデータを持ち，かつコヒーレンス則を満たすことを言う．

- 関手$ \otimes : \cat{C} \times \cat{C} \to \cat{C} $（これをモノイダル圏のテンソル積という）
- 単位対象$ I \in \cat{C} $
- 自然同型
  $$ \alpha =  \{ \alpha_{A,B,C} : A \otimes (B \otimes C) \to (A \otimes B) \otimes C \}_{ A,B,C \in \cat{C} } $$
- 自然同型
  $$ \lambda = \{ \lambda_{A} : I \otimes A \to A \}_{ A \in \cat{C} } $$
- 自然同型
  $$ \rho = \{ \rho_{A} : A \otimes I \to A \}_{ A \in \cat{C} } $$

コヒーレンス則は次の図式が可換になるという条件のことである：
$$
\begin{xy}
\xymatrix{
  & (\cat{A} \otimes \cat{B}) \otimes (\cat{C} \otimes \cat{D}) \ar[dr]^{\alpha} & \\
  \cat{A} \otimes (\cat{B} \otimes (\cat{C} \otimes \cat{D})) \ar[ur]^{\alpha} \ar[d]^{\id \otimes \alpha}& & ((\cat{A} \otimes \cat{B}) \otimes \cat{C}) \otimes \cat{D} \\
  \cat{A} \otimes ((\cat{B} \otimes \cat{C}) \otimes \cat{D}) \ar[rr]^{\alpha} & & (\cat{A} \otimes (\cat{B} \otimes \cat{C})) \otimes \cat{D} \ar[u]^{\alpha \otimes \id}
}
\end{xy}
$$

$$
\begin{xy}
\xymatrix{
  (\cat{A} \otimes I) \otimes \cat{B} \ar[rr]^{\alpha} \ar[dr]^{\rho \otimes \id} & & \cat{A} \otimes (I \otimes \cat{B}) \ar[dl]^{\id \otimes \lambda} \\
  & \cat{A} \otimes \cat{B} &
}
\end{xy}
$$

### 例
集合と写像のなす圏$ \mathbf{Set} $は集合の直積をテンソル積とすることでモノイダル圏になる．
また，ヒルベルト空間と有界線型作用素のなす圏$ \mathbf{Hilb} $は通常のテンソル積をモノイダル圏のテンソル積とすることでモノイダル圏となる．

## モノイダル圏のエンタングル状態
### 定義（モノイダル圏の状態，積状態，エンタングル状態）
$\cat{C}$をモノイダル圏とする．
対象$A \in \cat{C}$の状態とは射$ s : I \to A $のことである．
また対象$ A, B \in \cat{C} $に対して状態$ I \to A \otimes B $のことを$A$と$B$の joint 状態と呼ぶ．
joint 状態$ s : I \to A \otimes B $が積状態であるとは，
ある状態$ a : I \to A，b : I \to B$ が存在して，$s = (a \otimes b) \circ \lambda_{I}^{-1} : I \to I \otimes I \to A \otimes B $と表されることを言う．
積状態ではない joint 状態をエンタングル状態という．

### 例
まず，最初に定義したヒルベルト空間のエンタングル状態と，ヒルベルト空間のモノイダル圏としてのエンタングル状態の概念が同一であることをみる．
ヒルベルト空間$ H，K \in \mathbf{Hilb} $を固定する．
ヒルベルト空間のモノイダル圏としての単位対象は$\C$であるから，$H$の状態は有界線型作用素$s : \C \to H$である．
線型性より$s$は$1$の像を決めることにより定まる．
よって$H$の状態は$H$の元$s = s(1)$と同一視できる．
このことに注意して状態$ s : I \to H \times K $を考える．
$s$がモノイダル圏としての積状態であることは，
ある$a : I \to H, b : I \to K $が存在して$ s = a \otimes b $と書けるということであるが，
これはまさに最初に定義したヒルベルト空間の積状態の定義と一致する．

集合と写像の圏$ \mathbf{Set} $について考えてみる．
$ A, B \in \mathbf{Set} $とする．
$A$の状態は$ a : I \to A$のことである．
$ \mathbf{Set} $において$I$は一点集合$\{\star\}$なので$a$は$a(\star)$により決定される．
よって$A$の状態は$A$の元$a = a(\star)$と同一視できる．
このことに注意して，状態$ s : I \to A \times B $を考える．
$ s(\star) = (a, b) \in A \times B $とおく．
$a : I \to A, b : I \to B$と思うと$s = a \times b$であるから$s$は積状態である．
つまり$ \mathbf{Set} $ではエンタングル状態は存在しない．

## 参考文献
1. Chris Heunen. *Foundations of Quantum Programming*. Elsevier, 2016.
1. Chris Heunen and Jamie Vicary. *Lectures on Categorical Quantum Mechanics*. 2012. URL: [https://www.cs.ox.ac.uk/files/4551/cqm-notes.pdf](https://www.cs.ox.ac.uk/files/4551/cqm-notes.pdf)
1. Saunders Mac Lane. *Categories for the Working Mathematician*. Springer, 2nd edition, 1971.
