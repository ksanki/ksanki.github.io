---
layout: post
title:  "線形論理のシークエント計算"
tags:
  - 線形論理
---
$$
\DeclareMathOperator{\par}{\unicode{8523}}
\DeclareMathOperator{\linimp}{\unicode{8888}}
\def\zero{\mathbf{0}}
\def\one{\mathbf{1}}
$$

命題線形論理の統語論を定めて，シークエント計算を導入する．

## 線形論理の命題論理式
まず，命題記号の集合$ \Phi = \\{ a, b, c, \dots \\} $を固定する．
各命題記号$a \in \Phi$に対して，対応する記号$ a^{\bot} $があるものとする．
このとき線形論理の命題論理式は次で定義される．
- 命題記号$a \in \Phi$と$a^{\bot}$は論理式である．
- $A, B$が論理式ならば次も論理式である．
  - 乗法的連言，選言，真，偽： $ A \otimes B, A \par B, \mathbf{1}, \bot $
  - 加法的連言，選言，真，偽： $ A \& B, A \otimes B, \top, \mathbf{0} $
- 指数関数的結合子： $!A, ?B$

論理式$A$に対して，その線形否定$ A^{\bot} $はドモルガンの法則を用いて再帰的に定義する：
- $ \one^{\bot} := \bot, \ \bot^{\bot} := \one, \ \top^{\bot} := \zero, \ \zero^{\bot} := \top $
- $ a^{\bot \bot} := a $
- $$ \begin{align*}
  (A \otimes B)^{\bot} := A^{\bot} \par B^{\bot}, & \ (A \par B)^{\bot} := A^{\bot} \otimes B^{\bot} \\
  (A \oplus  B)^{\bot} := A^{\bot} \&   B^{\bot}, & \ (A \&   B)^{\bot} := A^{\bot} \oplus B^{\bot}
  \end{align*} $$
- $ (!A)^{\bot} := ? A^{\bot}, \ (?A)^{\bot} := !A^{\bot} $

また線形含意$A \linimp B$を$A^{\bot} \par B$で定める．

## シークエント計算
$ \Gamma $を線形論理式の多重集合とする．
線形論理のシークエントとは$ \vdash \Gamma $という表示のことである．
さて，線形論理の証明体系であるシークエント計算を定義しよう．
次の規則によりシークエント$ \vdash \Gamma $を導出できるとき，$ \vdash \Gamma $は証明可能であるという．

$$
\displaystyle{
  \frac{}
  {\vdash A, A^{\bot}}
  \text{(Identity)}
}, \
\displaystyle{
  \frac{\vdash \Gamma, A \quad \vdash A^{\bot}, \Delta}
  {\vdash \Gamma, \Delta }
  \text{(Cut)}
},
$$

$$
\begin{array}{cc}
  \displaystyle{
    \frac{}
    {\vdash \one}
    \text{($\one$)}
  }, &
  \displaystyle{
    \frac{ \vdash \Gamma }
    {\vdash \Gamma, \bot}
    \text{($\bot$)}
  }, \\
  \displaystyle{
    \frac{\vdash \Gamma, A \quad \vdash B, \Delta}
    {\vdash \Gamma, A \otimes B, \Delta}
    \text{($\otimes$)}
  }, &
  \displaystyle{
    \frac{\vdash \Gamma, A, B}
    {\vdash \Gamma, A \par B}
    \text{($\par$)}
  },
\end{array}
$$

$$
\begin{array}{cc}
  \displaystyle{
    \frac{}
    {\vdash \Gamma, \top}
    \text{($\top$)}
  }, &
  \text{no rule for $\zero$},
  \\
  \displaystyle{
    \frac{\vdash \Gamma, A \quad \vdash \Gamma, B}
    {\vdash \Gamma, A \& B}
    \text{($\&$)}
  }, &
  \displaystyle{
    \frac{\vdash \Gamma, A_i}
    {\vdash \Gamma, A_1 \oplus A_2}
    \text{($\oplus$-$i$)}
  },
\end{array}
$$

$$
\begin{array}{cc}
  \displaystyle{
    \frac{\vdash \Gamma, A}
    {\vdash \Gamma, ?A}
    \text{($?$D)}
  }, &
  \displaystyle{
    \frac{\vdash \Gamma, ?A, ?A}
    {\vdash \Gamma, ?A}
    \text{($?$C)}
  },
  \\
  \displaystyle{
    \frac{\vdash \Gamma}
    {\vdash \Gamma, ?A}
    \text{($?$W)}
  }, &
  \displaystyle{
    \frac{\vdash ?\Gamma, A}
    {\vdash ?\Gamma, !A}
    \text{($!$)}
  }
\end{array}
$$

ここで$\Gamma = A_1, \dots, A_n$のとき$?\Gamma := ?A_1, \dots, ?A_n$とする．

これでシークエント計算を定義できた．
今後，線形論理の相意味論や，シークエント計算の相意味論に関する健全性・完全性定理についての記事を書く予定．

2018-10-15 追記:
相意味論の記事を書いた：「[線形論理の相意味論](/2018/10/15/phase_semantics_of_linear_logic.html)」

## 参考文献
- J.-Y. Girard. Linear logic. *Theoretical Computer Science*, Vol. 50, pp. 1-102, 1987.
- J.-Y. Girard. Linear logic: Its syntax and semantics. In J.-Y. Girard, Y. Lafont, and L. Regnier, editors, *Advances in Linear Logic*, pp. 1-42. Cambridge University Press, 1995.
- 照井一成. 線形論理の誕生. 数学, 62巻1号, p. 115-132, 2010.
