---
layout: post
title:  "線形論理の健全性定理"
tags:
  - 線形論理
---
$$
\DeclareMathOperator{\par}{\unicode{8523}}
\DeclareMathOperator{\linimp}{\unicode{8888}}
\DeclareMathOperator{\with}{\&}
\DeclareMathOperator{\Form}{\mathrm{Form}}
\DeclareMathOperator{\Fact}{\mathrm{Fact}}
\def\zero{\mathbf{0}}
\def\one{\mathbf{1}}
$$

「[線形論理の相意味論](/2018/10/15/phase_semantics_of_linear_logic.html)」で健全性定理の主張を紹介した．
この定理を実際に証明する．
健全性定理の証明は基本的に単純な（しかし面倒な）帰納法である．

## 健全性定理
シークエント$ \vdash \Gamma $がシークエント計算で証明可能ならば，$\Gamma$はトートロジーである．
つまり，$ \vdash \Gamma $が証明可能ならば，任意の相構造$\mathcal{S} = (M, \bot, S)$について$1_{M} \in S(\Gamma)$である．

## 証明
$\mathcal{S} = (M, \bot, S)$を任意の相構造とする．
証明の長さに関する帰納法で証明する．

1. 証明の根の部分が$
  \displaystyle{
    \frac{}
    {\vdash A, A^{\bot}}
    \text{(Identity)}
  }
  $のとき．
  $A \par A^{\bot} = A \linimp A^{\bot}$である．
  任意の$N \subseteq M$について$1 \in N \linimp N$であるから，特に$1 \in S(A) \linimp S(A) = S(A \linimp A) = S(\Gamma)$である．
1. 証明の根の部分が$
  \displaystyle{
    \frac{\vdash \Gamma, A \quad \vdash A^{\bot}, \Delta}
    {\vdash \Gamma, \Delta }
    \text{(Cut)}
  }
  $のとき．
  $1 \in S(\Gamma \par A), \ 1 \in S(\Delta \par A^{\bot})$として$1 \in S(\Gamma \par \Delta)$を示せばよい．
  $S(\Gamma \par A) = S(\Gamma^{\bot}) \linimp S(A)$かつ$S(\Delta \par A^{\bot}) = S(A) \linimp S(\Delta)$であることに注意する．
  $1 \in S(\Gamma^{\bot}) \linimp S(\Delta)$を示せばよいが，そのためには任意の$m \in S(\Gamma^{\bot})$に対して$m \in S(\Delta)$であることを示せばよい．
  $m \in S(\Gamma^{\bot})$が任意に与えられたとする．
  まず$1 \in S(\Gamma^{\bot}) \linimp S(A)$より$m \in S(A)$である．
  次に$1 \in S(A) \linimp S(\Delta)$と$m \in S(A)$より$m \in S(\Delta)$である．
  今$m$は任意だったから，示された．
1. 証明の根の部分が$
  \displaystyle{
    \frac{}
    {\vdash \one}
    \text{($\one$)}
  }$のとき．
  $1 \in \\{ 1 \\}^{\bot\bot} = S(\one)$であるからよい．
1. 証明の根の部分が$
  \displaystyle{
    \frac{ \vdash \Gamma }
    {\vdash \Gamma, \bot}
    \text{($\bot$)}
  }$のとき．
  $1 \in S(\Gamma)$を仮定して$1 \in S(\Gamma \par \bot) = S(\Gamma) \par \bot$を示せばよい．
  より一般に$1 \in N \subseteq M$のとき$1 \in N \par \bot$を示せばよい．
  $N \par \bot = N^{\bot} \linimp \bot$である．
  任意に$m \in N^{\bot}$が与えられたとして$m \in \bot$を示せばよい．
  今$m \in N^{\bot}$なので，任意の$n \in N$に対して$mn \in \bot$が成り立つ．
  $1 \in N$なので$n = 1$ととれば$m = m \cdot 1 \in \bot$が成り立つ．
  よって$ 1 \in N^{\bot} \linimp \bot = N \par \bot$である．
1. 証明の根の部分が$
  \displaystyle{
    \frac{\vdash \Gamma, A \quad \vdash B, \Delta}
    {\vdash \Gamma, A \otimes B, \Delta}
    \text{($\otimes$)}
  }
  $のとき．
  $1 \in S(\Gamma) \par S(A)$，$1 \in S(\Delta) \par S(B)$を仮定して$1 \in S(\Gamma) \par S(\Delta) \par (S(A) \otimes S(B))$を示せばよい．
  $S(\Gamma) \par S(A) = S(\Gamma)^{\bot} \linimp S(A)$，$S(\Delta) \par S(B) = S(\Delta)^{\bot} \linimp S(B)$，$S(\Gamma) \par S(\Delta) \par (S(A) \otimes S(B)) = S(\Gamma)^{\bot} \linimp (S(\Delta)^{\bot} \linimp (S(A) \otimes S(B)))$であることに注意する．
  このことから，より一般に$H,K,L,N \subseteq M$が$1 \in H \linimp K$，$1 \in L \linimp N$を満たしているならば$1 \in H \linimp (L \linimp K \otimes N)$となることを示せばよい．
  $h \in H$が任意に与えられたとする．
  $h \in L \linimp K \otimes N$を示せばよい．
  そのためには，任意に$l \in L$が与えられたとして$ hl \in K \otimes N$を示せばよい．
  今，$h \in H$と$1 \in H \linimp K$より$h \in K$，$l \in L$と$1 \in L \linimp N$より$h \in N$が成り立つので$hl \in KN = K \otimes N$である．
  ゆえに$1 \in H \linimp (L \linimp K \otimes N)$が成り立つ．
1. 証明の根の部分が$
  \displaystyle{
    \frac{\vdash \Gamma, A, B}
    {\vdash \Gamma, A \par B}
    \text{($\par$)}
  }
  $のとき．
  これは定義より$S(\Gamma, A, B) = S(\Gamma, A \par B)$だからよい．
1. 証明の根の部分が$
  \displaystyle{
    \frac{}
    {\vdash \Gamma, \top}
    \text{($\top$)}
  }
  $のとき．
  $S(\top) = \top = M$であった．
  任意の$N \subseteq M$に対して$1 \in N \linimp M $が成り立つ．
  したがって，$1 \in S(\Gamma)^{\bot} \linimp M = S(\Gamma) \par \top$が成り立つ．
1. 証明の根の部分が$
  \displaystyle{
    \frac{\vdash \Gamma, A \quad \vdash \Gamma, B}
    {\vdash \Gamma, A \& B}
    \text{($\&$)}
  }
  $のとき．
  $N, L, K \subseteq M$が$ 1 \in N \linimp L$，$1 \in N \linimp K$を満たすとする．
  このとき$1 \in N \linimp (N \with K)$を示す．
  任意に$ n \in N $が与えられたとする．
  $n \in N \with K = N \cap K$を示せばよい．
  今，$ 1 \in N \linimp L$より$n \in L$であり，$ 1 \in N \linimp K$より$n \in K$である．
  したがって$ n \in L \cap K $である．
  よって$ 1 \in N \linimp (N \with K)$である．
  あとは$N = S(\Gamma)^{\bot}$，$L = S(A)$，$K = S(B)$とすればよい．
1. 証明の根の部分が$
  \displaystyle{
    \frac{\vdash \Gamma, A_i}
    {\vdash \Gamma, A_1 \oplus A_2}
    \text{($\oplus$-$i$)}
  }
  $のとき．
  $i=1$のときだけ示す（$i = 2$のときも同様）．
  $N, L, K \subseteq M$が$1 \in N \linimp L$を満たすとする．
  このとき$1 \in N \linimp (L \oplus K)$を示す．
  任意に$n \in N$が与えられたとする．
  $n \in L \oplus K = (L^{\bot} \cap K^{\bot})^{\bot}$を示せばよい．
  そのためには，任意に$l \in L^{\bot} \cap K^{\bot}$が与えられたとして$nl \in \bot$を示せばよい．
  今，$1 \in N \linimp L$より$n \in L$である．
  また$ l \in L^{\bot} = L \linimp \bot$なので$ nl = ln = \bot $である．
  したがって$1 \in N \linimp (L \oplus K)$が示された．
  あとは$N = S(\Gamma)^{\bot}$，$L = A_1$，$K = A_2$とすればよい．
1. 証明の根の部分が$
  \displaystyle{
    \frac{\vdash \Gamma, A}
    {\vdash \Gamma, ?A}
    \text{($?$D)}
  }
  $のとき．
  $ N, K \subseteq M$が$1 \in N \linimp K$を満たすならば$1 \in N \linimp ?K = N \linimp(K^{\bot} \cap I)^{\bot}$であることを示せばよいが，これは($\oplus$-$i$)の場合と同様の議論を行えばよい．
1. 証明の根の部分が$
  \displaystyle{
    \frac{\vdash \Gamma, ?A, ?A}
    {\vdash \Gamma, ?A}
    \text{($?$C)}
  }
  $のとき．
  $N, L \subseteq M$とする．
  さらに$1 \in N \par ?L \par ?L = (L^{\bot} \cap I) \linimp ((L^{\bot} \cap I) \linimp N)$とする．
  このとき$1 \in N \par ?L = (L^{\bot} \cap I) \linimp N$を示す．
  任意に$l \in L^{\bot} \cap I$が与えられたとして$l \in N$を示せばよい．
  $1 \in (L^{\bot} \cap I) \linimp ((L^{\bot} \cap I) \linimp N)$より任意の$ m \in L^{\bot} \cap I$に対して$lm \in N$が成り立つ．
  特に$ ll \in N $が成り立つ．
  今$l \in I$なので$l = ll$である．
  よって$l = ll \in N$である．
  したがって$1 \in N \par ?L$が示された．
  あとは$N = S(\Gamma)$，$L = S(A)$とすればよい．
1. 証明の根の部分が$
  \displaystyle{
    \frac{\vdash \Gamma}
    {\vdash \Gamma, ?A}
    \text{($?$W)}
  }
  $のとき．
  $N, L \subseteq M, \ 1 \in N$とする．
  $1 \in N^{\bot} \linimp ?L = N^{\bot} \linimp (L^{\bot} \cap I)^{\bot}$を示す．
  任意に$n \in N^{\bot}$と$l \in L^{\bot} \cap I $が与えられたとして，$nl \in \bot$を示せばよい．
  $n \in N^{\bot} $と$1 \in N$より$ n = n \cdot 1 \in \bot$である．
  また$l \in I$より$l \in \\{ 1 \\}^{\bot\bot} = \bot \linimp \bot$である．
  よって$ nl = ln \in \bot $である．
  したがって$1 \in N^{\bot} \linimp ?L$が証明された．
  あとは$N = S(\Gamma)$，$L = S(A)$とすればよい．
1. 証明の根の部分が$
  \displaystyle{
    \frac{\vdash ?\Gamma, A}
    {\vdash ?\Gamma, !A}
    \text{($!$)}
  }
  $のとき．
  $\Gamma = A_1 , \dots , A_n$であるとする．
  $ N_1, \dots , N_k, L \subseteq M$とする．
  $1 \in ?N_1 \par \cdots \par ?N_k \par L$として$1 \in ?N_1 \par \cdots \par ?N_k \par L$を示す．
  $1 \in ?N_1 \par \cdots \par ?N_k \par L = (N_1 \cap I) \linimp \cdots \linimp (N_k \cap I) \linimp L$より，任意に$ n_1 \in N_1 \cap I , \ \dots ,\ n_k \in N_k \cap I$が与えられたとき$n_1 \cdots n_k \in L$である．
  この$n_i$たちについて$n_1 \cdots n_k \in !L = (L \cap I)^{\bot\bot}$を示せばよい．
  特に$n_1 \cdots n_k \in L \cap I$を示せばよい．
  $n_1 \cdots n_k \in L$はすでに示したので残りは$n_1 \cdots n_k \in I$を示すことである．
  $(n_1 \cdots n_k)(n_1 \cdots n_k) = n_1 n_1 \cdots n_k n_k = n_1 \cdots n_k $なので$n_1 \cdots n_k$はべき等元である．
  また各$i$について$n_i \in \\{ 1 \\}^{\bot\bot} = \bot \linimp \bot$なので$n_1 \cdots n_k \in \\{1 \\}^{\bot\bot}$が分かる．
  したがって$n_1 \cdots n_k \in I$である．
  よって$1 \in ?N_1 \par \cdots \par ?N_k \par L$が示された．
  あとは$N_i = S(A_i)$，$L = S(A)$とすればよい．

これで健全性定理が証明された．

## 参考文献
- J.-Y. Girard. Linear logic. *Theoretical Computer Science*, Vol. 50, pp. 1-102, 1987.
- J.-Y. Girard. Linear logic: Its syntax and semantics. In J.-Y. Girard, Y. Lafont, and L. Regnier, editors, *Advances in Linear Logic*, pp. 1-42. Cambridge University Press, 1995.
