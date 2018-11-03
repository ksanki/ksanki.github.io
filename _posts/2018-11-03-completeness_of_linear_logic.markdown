---
layout: post
title:  "線形論理の完全性定理"
tags:
  - 線形論理
---
$$
\DeclareMathOperator{\par}{\unicode{8523}}
\DeclareMathOperator{\linimp}{\unicode{8888}}
\DeclareMathOperator{\with}{\&}
\DeclareMathOperator{\Form}{\mathrm{Form}}
\DeclareMathOperator{\Fact}{\mathrm{Fact}}
\DeclareMathOperator{\Pr}{\mathrm{Pr}}
\def\zero{\mathbf{0}}
\def\one{\mathbf{1}}
$$

「[線形論理の相意味論](/2018/10/15/phase_semantics_of_linear_logic.html)」で完全性定理の主張を紹介した．
この記事ではこれを証明する．
証明のポイントは適切な相構造を統語論的な情報から構成することである．

## 完全性定理
論理式$A$がトートロジーならば，シークエント$ \vdash A $はシークエント計算で証明可能である．
つまり，任意の相構造$\mathcal{S} = (M, \bot, S)$について$1_{M} \in S(A)$であるならば，$\vdash A$は証明可能である．

## 証明
$M$を論理式の（有限）多重集合のなすモノイドとする．
モノイドの演算は集合の多重集合の和である．
また単位元$1_M$は空集合$\emptyset$である．
また，$\bot \subseteq M$を$\bot := \\{ \Delta \in M \mid \text{$\vdash \Delta$ is provable} \\}$で定める．

論理式の多重集合$\Sigma$に対して，$\Pr(\Sigma) := \\{ \Delta \in M \mid \text{$\vdash \Delta, \Sigma$ is provable} \\}$と定める．
まず論理式$A$に対して$\Pr(A)$がファクトであることを示す．
そのためには$\Pr(A) = \Pr(A^{\bot})^{\bot}$を示せば十分である．
$B \in \Pr(A)$とする．
$C \in \Pr(A^{\bot})$が任意に与えられたとする．
$\vdash B, A$と$\vdash C, A^{\bot}$が証明可能である．
カット規則を用いると$\vdash B, C$が証明可能である．
よって$B, C \in \bot$であるから，$B \in \Pr(\Sigma^{\bot})^{\bot}$である．
ゆえに$\Pr(A) \subseteq \Pr(A^{\bot})^{\bot}$．
逆に$B \in \Pr(A^{\bot})^{\bot}$とする．
$\vdash A, A^{\bot}$は証明可能なので$A \in \Pr(A^{\bot})$である．
したがって$B, A \in \bot$であり$\vdash B, A$は証明可能である．
これは$B \in \Pr(A)$を意味する．
ゆえに$\Pr(A) \supseteq \Pr(A^{\bot})^{\bot}$．
よって$\Pr(A) = \Pr(A^{\bot})^{\bot}$である．

各命題記号$a$に対して$S(a) := \Pr(a)$と定めると，任意の論理式$A$について$S(A) = \Pr(A)$であることが帰納法によって証明できる．
これによって相構造$(M, \bot, S)$を定めることができた．
今，論理式$A$がトートロジーであるとする．
すると$\emptyset \in S(A) = \Pr(A)$であり，これは$\vdash A$がシークエント計算で証明可能であることを意味する．

## 参考文献
- J.-Y. Girard. Linear logic. *Theoretical Computer Science*, Vol. 50, pp. 1-102, 1987.
- J.-Y. Girard. Linear logic: Its syntax and semantics. In J.-Y. Girard, Y. Lafont, and L. Regnier, editors, *Advances in Linear Logic*, pp. 1-42. Cambridge University Press, 1995.
