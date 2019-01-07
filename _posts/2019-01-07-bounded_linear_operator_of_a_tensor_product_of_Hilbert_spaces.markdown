---
layout: post
title:  "2つのヒルベルト空間のテンソル積の有界線型作用素"
tags:
  - ヒルベルト空間
---
$$
\def\blo#1{\mathop{\mathcal{L}}(#1)}
\def\H{\mathcal{H}}
\def\K{\mathcal{K}}
$$

ヒルベルト空間のテンソル積の間の有界線型作用素の表示について基本的な主張を証明する．

## 定理
$$ \H, \K $$ をヒルベルト空間とする．
$$ \H \otimes \K $$ 上の有界線型作用素 $$ F \in \blo{ \H \otimes \K }$$ が与えられているとする．
このとき，有界線型作用素の族$$ \{ A_k \} \subset \blo{ \H } $$ と $$ \{ B_k \} \subset \blo{ \K } $$ が存在して，

$$
F = \sum_k A_k \otimes B_k
$$

が成り立つ．

## 証明
$$ \{ e_i \} \subset \H $$，$$ \{ f_j \} \subset \K $$ をそれぞれ $$ \H, \K $$ の完全正規直交系(CONS)とする．

$$
F( e_i \otimes f_j ) = \sum_{p,q} a^{ij}_{pq} e_p \otimes f_q \quad a^{ij}_{pq} \in \mathbb{C}
$$

と書ける．
そこで $$ A_{ijq} : \H \to \H $$ を

$$
A_{ijq}(e_s) := \delta_{si} \sum_{p} a^{ij}_{pq} e_p
$$

で定める．また，$$ B_{jq} : \K \to \K $$ を

$$
B_{jq}(f_t) := \delta_{tj} f_q
$$

で定める．
これらは有界線型作用素である．
このとき，

$$
\begin{align*}
  \sum_q (A_{ijq} \otimes B_{jq}) (e_s \otimes f_t)
  &= \sum_q ( (\delta_{si} \sum_p \sum_{p} a^{ij}_{pq} e_p) \otimes (\delta_{tj}f_q) ) \\
  &= \delta_{si} \delta_{sj} \sum_{pq} a^{ij}_{pq} e_p \otimes f_q
\end{align*}
$$

である．よって $$ F = \sum_{i,j,q} (A_{ijq} \otimes B_{jq}) $$ である．
