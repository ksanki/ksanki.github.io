---
layout: post
title:  "モノイダル圏の well-pointed 性"
tags:
  - モノイダル圏
---
$$
\def\Z{\mathbb{Z}}
\def\cat#1{\mathscr{#1}}
\def\id{\mathrm{id}}
$$

$\cat{C}=(\cat{C}, \otimes, I, \alpha, \lambda, \rho)$をモノイダル圏とする．
モノイダル圏の定義については「[モノイダル圏のエンタングル状態](/2018/10/13/entangle_state_of_monoidal_category.html)」を参照のこと．
$\cat{C}$が well-pointed であるというのは直観的には射の恒等性の判定が点ごとの計算によってできるということである．
[[1](#Heunen-Vicary)]には well-pointed なモノイダル圏の例はあるが well-pointed でないモノイダル圏の例がないので，この記事では後者の例を与える．

## 定義（Well-pointed）
モノイダル圏$\cat{C}$が well-pointed であるとは，任意の射$f,g : A \to B $に対して次が同値であることである：
$f=g$であるとき，またそのときのみ任意の射$a : I \to A$に対して$f \circ a = g \circ a$が成り立つ．

## 例
集合と写像のなす圏$\mathbf{Set}$は well-pointed なモノイダル圏である．
また，ヒルベルト空間と有界線型写像のなす圏$\mathbf{Hilb}$も well-pointed なモノイダル圏である．

一方，可換環と環準同型のなすモノイダル圏$\mathbf{CRing}$（テンソル積は可換環の$\Z$代数としてのテンソル積$\otimes_{\Z}$）は well-pointed ではない．
このことを証明する．
可換環のなすモノイダル圏では$ I := \Z $である．
$A = B = \Z \times \Z $とし，$f := \id : \Z \times \Z \to \Z \times \Z$とする．
また，$g : \Z \times \Z \to \Z \times \Z$を$g(a,b):=(b,a)$で定める．
すると$f \ne g$である．
環準同型$\Z \to \Z \times \Z$は一つしかなく，それは$\iota(n) := n \cdot 1_{\Z \times \Z} = (n, n)$で定まる環準同型$\iota : \Z \to \Z \times \Z$である．
このことから一つしかない射$\iota : \Z \to \Z \times \Z$に対して$f \circ \iota = g \circ \iota$が成り立つ．
よって可換環と環準同型のなす圏$\mathbf{CRing}$は well-pointed ではない．

## 参考文献
1. <a name="Heunen-Vicary"></a>Chris Heunen and Jamie Vicary. *Lectures on Categorical Quantum Mechanics*. 2012. URL: [https://www.cs.ox.ac.uk/files/4551/cqm-notes.pdf](https://www.cs.ox.ac.uk/files/4551/cqm-notes.pdf)
