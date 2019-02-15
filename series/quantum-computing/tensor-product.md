---
layout: post
title:  "テンソル積"
tags:
  - 量子コンピュータ
---

2019年2月7日

量子コンピュータ入門 [目次](index.html) [<前\|](introduction-to-linear-algebra.html)

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

量子計算ではテンソル積が重要な役割を果たす．
そのことを理解するための準備として，有限次元ベクトル空間のテンソル積を定義しよう．
一般にテンソル積は圏論的な普遍性で定義されるが，有限次元ベクトル空間に限って考えればそれほど高級な道具は必要ない．
## ベクトル空間のテンソル積
$V, W$ を次元がそれぞれ$m, n$である有限次元ベクトル空間とし，
$ \{v_1 , \dots, v_m\} $と$ \{w_1 , \dots, w_n\} $をそれぞれ$V, W$の基底とする．
このとき，$V$と$W$のテンソル積$V \otimes W$とは基底

$$
\begin{split}
& \{ v_i \otimes w_j \}_{i = 1, \dots, m, \ j = 1, \dots, n} \\
& =
\left\{ \begin{array}{c}
v_1 \otimes w_1, v_1 \otimes w_2, \dots, v_1 \otimes w_n \\
\vdots \\
v_m \otimes w_1, v_m \otimes w_2, \dots, v_m \otimes w_n
\end{array} \right\}
\end{split}
$$

で生成されるベクトル空間のことである．

定義より $V \otimes W$ の任意の元は

$$ \sum_{i,j} c_{i,j} v_i \otimes w_j  \ c_{i,j} \in \C $$

の形に書けることに注意する．
また基底の大きさは$m \times n$なので$V \otimes W$の次元は$m \times n$である．

## ベクトル空間の直積とテンソル積
ベクトル空間の直積$V \times W$とテンソル積の関係を調べる．
ベクトル空間の直積とは，集合としての直積$ V \times W $に次のような和とスカラー倍を定めることにより得られるベクトル空間のことであった：
任意の$v,v' \in V$，$w,w' \in W$，$\lambda \in \C$に対して

$$
\begin{split}
  (v, w) + (v', w') & \defeq (v + v', w + w'), \\
  \lambda (v,w) & \defeq (\lambda v, \lambda w).
\end{split}
$$

今，$$ \{ e_i \}_{ i=1 }^{ m } $$ を$$V$$の基底，
$$\{d_j\}_{j=1}^{n}$$を$$W$$の基底とする．
$$V \times W$$ から$$ V \otimes W $$への次で定まる線形写像がある．

$$
\begin{split}
  \phi : & V \times W \to V \otimes W \\
  & \left( \sum_{i} a_i e_i, \sum_{j} b_j d_j \right) \mapsto \sum_{i,j} a_i b_j e_i \otimes d_j
\end{split}
$$

今後，$$ (v,w) \in V \times W$$に対して$$\phi(v,w)$$のことを単に$$ v \otimes w $$と書くことにする．

## 例
$$ V = \C^2 $$，$$ W = \C^2 $$ とする．
$$ V $$の基底を
$$ e_0 \defeq \left( \begin{array}{c} 1 \\ 0 \end{array} \right) ,
\ e_1 \defeq \left( \begin{array}{c} 0 \\ 1 \end{array} \right)$$，
$$ W $$の基底を
$$ d_0 \defeq \left( \begin{array}{c} 1 \\ 0 \end{array} \right) ,
\ d_1 \defeq \left( \begin{array}{c} 0 \\ 1 \end{array} \right)$$
とする．
$$ V \otimes W $$の基底は
$$ e_0 \otimes d_0, \ e_1 \otimes d_0, \ e_0 \otimes d_1, \ e_1 \otimes d_1 $$
である．
$$ V \otimes W $$は次の線形写像により$$\C^4$$と同型となる：

$$
\begin{split}
  \Phi : & V \otimes W \to \C^4 \\
  & e_0 \otimes d_0 \mapsto c_0 \\
  & e_1 \otimes d_0 \mapsto c_1 \\
  & e_0 \otimes d_1 \mapsto c_2 \\
  & e_1 \otimes d_1 \mapsto c_3
\end{split}
$$

ここで$$\{c_k\}_{k=0}^{3}$$は$$\C^4$$の標準基底である．
今後はこの方法で$$ \C^2 \otimes \C^2 $$と$$\C^4$$を同一視する．
つまり，例えば

$$
v \defeq
\left( \begin{array}{c}
  a_0 \\ a_1 \\ a_2 \\ a_4
\end{array} \right)
\in \C^2 \otimes \C^2
$$

と書いたら，

$$
v \defeq \Phi^{-1} \left(
\begin{array}{c}
  a_0 \\ a_1 \\ a_2 \\ a_4
\end{array} \right)
= a_0 e_0 \otimes d_0 + 
a_1 e_1 \otimes d_0 + 
a_2 e_0 \otimes d_1 + 
a_3 e_1 \otimes d_1
\in \C^2 \otimes \C^2
$$

を意味するものとする．

この記法を使えば

$$
\left( \begin{array}{c}
  1 \\ -1 \\ 2 \\ 3
\end{array} \right)
= e_0 \otimes d_0 - e_1 \otimes d_0 + 2 e_0 \otimes d_1 + 3 e_1 \otimes d_1
$$

である．
また，

$$
\left( \begin{array}{c}
1 \\ 2
\end{array} \right)
\otimes
\left( \begin{array}{c}
3 \\ 4
\end{array} \right)
= 3 e_0 \otimes d_0 + 6 e_1 \otimes d_0 + 4 e_0 \otimes d_1 + 8 e_1 \otimes d_1
= \left( \begin{array}{c}
3 \\ 6 \\ 4 \\ 8
\end{array} \right)
$$

である．

複数個のベクトル空間のテンソル積を考えることももちろんできる．
上では$$ \C^2 \otimes \C^2 $$を扱ったが，さらに$$ \C^2 $$をテンソルして$$ (\C^2 \otimes \C^2) \otimes \C^2$$を考えることができる．
$$ (\C^2 \otimes \C^2) \otimes \C^2$$と$$ \C^2 \otimes (\C^2 \otimes \C^2)$$は同型なので区別しなくてよい．
よって今後はこれらのことを括弧を省略して$$ \C^2 \otimes \C^2 \otimes \C^2$$と書くことにする．
また一般にベクトル空間$$ V $$を$$n$$個テンソルしたもののことを
$$ \bigotimes_{i=1}^{n} V $$や$$V^{\otimes n}$$と書くことにする．
$$ \C^2 \otimes \C^2 \otimes \C^2 = {\C^2}^{\otimes 3}$$の基底は

$$
\begin{split}
  & \left( \begin{array}{c}
  1 \\ 0
  \end{array} \right)
  \otimes
  \left( \begin{array}{c}
  1 \\ 0
  \end{array} \right)
  \otimes
  \left( \begin{array}{c}
  1 \\ 0
  \end{array} \right),
  
  \ \left( \begin{array}{c}
  0 \\ 1
  \end{array} \right)
  \otimes
  \left( \begin{array}{c}
  1 \\ 0
  \end{array} \right)
  \otimes
  \left( \begin{array}{c}
  1 \\ 0
  \end{array} \right),
  
  \ \left( \begin{array}{c}
  1 \\ 0
  \end{array} \right)
  \otimes
  \left( \begin{array}{c}
  0 \\ 1
  \end{array} \right)
  \otimes
  \left( \begin{array}{c}
  1 \\ 0
  \end{array} \right),
  
  \ \left( \begin{array}{c}
  0 \\ 1
  \end{array} \right)
  \otimes
  \left( \begin{array}{c}
  0 \\ 1
  \end{array} \right)
  \otimes
  \left( \begin{array}{c}
  1 \\ 0
  \end{array} \right), \\

  & \left( \begin{array}{c}
  1 \\ 0
  \end{array} \right)
  \otimes
  \left( \begin{array}{c}
  1 \\ 0
  \end{array} \right)
  \otimes
  \left( \begin{array}{c}
  0 \\ 1
  \end{array} \right),
  
  \ \left( \begin{array}{c}
  0 \\ 1
  \end{array} \right)
  \otimes
  \left( \begin{array}{c}
  1 \\ 0
  \end{array} \right)
  \otimes
  \left( \begin{array}{c}
  0 \\ 1
  \end{array} \right),
  
  \ \left( \begin{array}{c}
  1 \\ 0
  \end{array} \right)
  \otimes
  \left( \begin{array}{c}
  0 \\ 1
  \end{array} \right)
  \otimes
  \left( \begin{array}{c}
  0 \\ 1
  \end{array} \right),

  \ \left( \begin{array}{c}
  0 \\ 1
  \end{array} \right)
  \otimes
  \left( \begin{array}{c}
  0 \\ 1
  \end{array} \right)
  \otimes
  \left( \begin{array}{c}
  0 \\ 1
  \end{array} \right)
\end{split}
$$

である．
一般に$$ {\C^2}^{\otimes n} $$は$$2^n$$次元ベクトル空間である．

## 量子計算との関連
量子計算では$$ \C^2 $$とそのテンソル積が重要である．
$$ \C^2 $$は古典的ビットの「空間」$$\{ 0, 1 \}$$の量子版である．
今後，$$ \left(\begin{array}{c} 1 \\ 0 \end{array}\right)$$が古典ビット$$0$$の，
$$ \left(\begin{array}{c} 0 \\ 1 \end{array}\right) $$が古典ビット$$1$$の量子的対応物であることが分かるだろう．
また
$$ \alpha \left(\begin{array}{c} 1 \\ 0 \end{array}\right) + \beta \left(\begin{array}{c} 0 \\ 1 \end{array}\right) $$
のような複数のベクトルの線型結合で表されるベクトルを（標準基底に関する）重ね合わせ状態という．
量子コンピュータの計算のスピードアップは，$$n$$個の$$\C^2$$のテンソル積の次元が$$2^n$$次元であることを利用して，「$$2^n$$個の状態が重ね合わさった状況を同時に扱う」ような方法でなされる．

量子コンピュータ入門 [目次](index.html) [<前\|](introduction-to-linear-algebra.html)
