---
layout: post
title:  "ヒルベルト空間のテンソル積"
tags:
  - 関数解析
---
$$
\def\C{\mathbb{C}}
$$

$H, K$をヒルベルト空間とする．
この$2$つのヒルベルト空間のテンソル積がどんなものであるか調べる．

## ベクトル空間としてのテンソル積
テンソル積を定義するために思いつく方法は，$H, K$の$\C$上のベクトル空間としてのテンソル積をとることだが，実はこれだけでは不十分である．
というのも，このようにして作られた空間の内積から定まるノルムは完備性をもたない．
このことを確認しよう．

$H \otimes_{\mathrm{alg}} K$を$H,K$のベクトル空間としてのテンソル積とする．
$\sum_{i} a_i s_i \otimes t_i,\ \sum_{j} b_j u_j \otimes v_j \in H \otimes_{\mathrm{alg}} K$（$a_i, b_i \in \C, \ s_i, u_j \in H, \ t_j, v_j \in K $）の内積は

$$
\left(\sum_{i} a_i s_i \otimes t_i, \sum_{j} b_j u_j \otimes v_j\right)
:= \sum_{i} \sum_{j} a_i b_j (s_i, u_j) (t_i, v_j)
$$

というようにそれぞれのヒルベルト空間の内積の積として定める．
$ d = \\{ d_i \\} _ {i = 1}^{\infty} $を$ H $の正規直交系，$ e = \\{ e_j \\} _ {j = 1}^{\infty} $を$ K $の正規直交系とする．
$$
c_n := \sum_{k = 1}^{n} \frac{1}{2^k} d_k \otimes e_k
$$
と定める．
すると$m > n$ とするとき，

$$
\begin{align*}
  \| c_m - c_n \|
  & = \left\| \sum_{k = n+1}^{m} \frac{1}{2^k} d_k \otimes e_k \right\| \\
  & = \left( \sum_{k = n+1}^{m} \frac{1}{2^k} d_k \otimes e_k, \sum_{k = n+1}^{m} \frac{1}{2^k} d_k \otimes e_k \right) \\
  & = \sum_{k = n+1}^{m}\sum_{l = n+1}^{m} \frac{1}{2^k} \frac{1}{2^l} (d_k \otimes e_k, d_l \otimes e_l) \\
  & = \sum_{k = n+1}^{m}\sum_{l = n+1}^{m} \frac{1}{2^k} \frac{1}{2^l} (d_k, d_l) (e_k, e_l) \\
  & = \sum_{k = n+1}^{m} \frac{1}{4^k}
  < \sum_{k = n+1}^{\infty} \frac{1}{4^k}
  < \frac{1}{4^n}
\end{align*}
$$

であるから$c = \\{ c_n \\} _ {n = 1} ^{\infty} $はCauchy列である．

## 完備化
ベクトル空間では「無限個の元の線型結合」が許されていないため，$c$の収束先となると期待する「$c_{\infty} := \sum_{k = 1}^{\infty} \frac{1}{2^k} d_k \otimes e_k$」が存在しないということが起こる．
よって$ H \otimes_{\mathrm{alg}} K $を完備化した空間を$ H \otimes K $とし，これをヒルベルト空間$H, K$のテンソル積として定める必要がある．
また，このとき完備化の性質から$ H \otimes_{\mathrm{alg}} K $は$ H \otimes K $の稠密な部分空間となっている．
