---
layout: post
title:  "線形論理の相意味論"
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

「[線形論理のシークエント計算](/2018/10/14/seaquent_calculus_of_linear_logic.html)」を前提とする．

## 相空間
まずは意味論を与えるための構造を定義する．

### 定義（相空間，ファクト，妥当性）
相空間（phase space）とは$P = (M, \bot_M)$である．
ここで，$ M $は可換モノイド，$ \bot_M $は$ M $の部分集合である．
文脈から明らかなときは$ \bot_M $を単に$ \bot $と書く．
また，$ M $の単位元を$ 1_M = 1 $と書く．
$X, Y$を$M$の部分集合とする．
- $ X, Y $に対して，$ X \linimp Y := \\{m \in M \mid \forall n \in X, mn \in Y \\} $と定める．
- $ X^{\bot} := X \linimp \bot $とする．
- $ X $がファクト（fact）であるとは$ X^{\bot\bot} = X $を満たすこととする．
  相空間$ P $のファクト全体の集合を$\Fact(P)$とする．
- $ X $が妥当（valid）であるとは$ 1 \in X $を満たすこととする．

### 相空間の性質
$P = (M, \bot)$を相空間とすると次が成り立つ：
1. 任意の$ X \subseteq M $に対して，$ X \subseteq X^{\bot\bot} $である．
2. 任意の$ X, Y \subseteq M $に対して，$ X \subseteq Y $ならば$ Y^{\bot} \subseteq X^{\bot} $である．
3. $ X \subseteq M $がファクトであることと，ある$Y \subseteq M $が存在して$X = Y^{\bot} $となることは同値．
4. ファクトは共通部分をとる操作で閉じている．つまり，$ \\{ X_i \\} _ { i \in I } $ を $ P $のファクトの族とすると$ \bigcap_{i \in I} X_i $もファクトである．

これらは定義からすぐに分かることだが，念のため(3)を証明しておく．

$X$がファクトであるとする．
すると定義から$ X = (X^{\bot})^{\bot} $なので$ Y := X^{\bot} $とすればよい．

逆に$ X = Y^{\bot} $となる$ Y \subseteq M $があるとする．
$ X = X^{\bot\bot} $を示したい．
(1)より$ X \subseteq X^{\bot\bot} $はよい．
$ m \in X^{\bot\bot} = Y^{\bot\bot\bot} $が任意に与えられたとする．
今，任意の$ n \in Y $に対して，$ Y \subseteq Y^{\bot\bot} $であるから$ n \in Y^{\bot\bot} $である．
よって$ m \in (Y^{\bot\bot})^{\bot} $であるから$ mn \in \bot $である．
いま$ n $は$Y$の任意の元であったから$ m \in Y^{\bot} = X$である．
したがって$ X^{\bot\bot} \subseteq X $．
ゆえに$ X^{\bot\bot} = X $であり，$ X $はファクトである．

## 論理式の解釈

### 相構造
線形論理の命題変数の集合を$\Phi$，論理式全体の集合を$\Form(\Phi)$とする．
線形論理の言語に対する相構造（phase structure）とは$\mathcal{S} = (P, S)$である．
ここで$P = (M, \bot)$は相空間であり，$S$は命題変数から$P$のファクトへの写像$ S : \Phi \to \Fact(P) $である．

### ファクトの演算
ファクト$X,Y$に対して，次のように定める．

- $ X \otimes Y := (XY)^{\bot\bot} = \\{ mn \mid m \in X, n \in Y \\}^{\bot\bot} $
- $ X \par Y := (X^{\bot} \otimes Y^{\bot})^{\bot} $
- $ \one := \\{ 1 \\}^{\bot\bot} $
- $ X \with Y := X \cap Y $
- $ X \oplus Y := (X^{\bot} \with Y^{\bot})^{\bot} $
- $ \top := \emptyset^{\bot} = M $
- $ \zero := \top^{\bot} = \emptyset^{\bot\bot} $
- $ ! X := (X \cap I)^{\bot\bot} $，ここで$I = \\{ m \in \one \mid mm = m \\}$は$M$のべき等元で$\one$に属するもの全体の集合である．
- $ ? X := (X^{\bot} \cap I)^{\bot} $

### 論理式の妥当性
ファクトの演算より，$ S : \Phi \to \Fact(P) $は$ \bar{S} : \Form(\Phi) \to \Fact(P) $へと自然に拡張される．
今後$S$と$\bar{S}$を同一視する．
こうして論理式$A$の相空間での解釈$S(A)$が定まった．
また，$ \Gamma = A_1, \dots , A_n $を多重集合とするとき，$S(\Gamma) := S(A_1 \par \cdots \par A_n)$と定める．

論理式$A$に対して以下のように定める．
- $A$が相構造$\mathcal{S} = (P, S)$で妥当（valid）であるとは，
  $1 \in S(A)$であることとする．
- $A$がトートロジーであるとは，
  任意の相構造$\mathcal{S}$で$A$が妥当であることとする．

多重集合$\Gamma$に対しても同様に定める．

こうして線形論理の相意味論が定義された．

## 健全性定理・完全性定理
この相意味論により実はシークエント計算の健全性・完全性が成り立つ．

### 健全性定理
$ \vdash \Gamma $が証明可能ならば$\Gamma$はトートロジーである．

### 完全性定理
$ \vdash \Gamma $が証明可能であることと$\Gamma$はトートロジーであることは同値である．

今後，この健全性定理・完全性定理の証明を書く予定．

## 参考文献
- J.-Y. Girard. Linear logic. *Theoretical Computer Science*, Vol. 50, pp. 1-102, 1987.
- J.-Y. Girard. Linear logic: Its syntax and semantics. In J.-Y. Girard, Y. Lafont, and L. Regnier, editors, *Advances in Linear Logic*, pp. 1-42. Cambridge University Press, 1995.
