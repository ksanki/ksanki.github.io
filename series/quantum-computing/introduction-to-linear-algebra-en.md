---
layout: post
title:  "Review of Linear Algebra"
tags:
  - Quantum Computer
---
Jan. 29, 2019. Let's Implement Quantum Computer! [index](index-en.html)

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

In this series of articles, a vector space is assumed to be the vector space over the complex number field.
In general, we use separable Hilbert spaces in quantum mechanics, but in this articles we use only finite dimensional spaces.
Hence we are not worry about completeness of vector spaces.
Don't you know the word "separable", "Hilbert space", or "completeness"?
No problem.
You can understand following articles without knowing meanings of these words.

## Notations and Definitions
When we define $A$ as $B$, we write $ A \defeq B $.

### Bracket Notation
We write $\ket{\phi}$ for a vector in vector space $V$.
For example, the standard basis in $\C^2$ is
$$
\ket{0} \defeq \begin{pmatrix} 1 \\ 0 \end{pmatrix},
\ \ket{1} \defeq \begin{pmatrix} 0 \\ 1 \end{pmatrix}.
$$

For a vector $\ket{\phi} \in V$, We write $\bra{\phi}$ for the conjugate transposed vector of $\ket{\phi}$.
For example, we get following equations:

$$
\bra{0} = \begin{pmatrix} 1 & 0 \end{pmatrix},
\ \bra{1} = \begin{pmatrix} 0 & 1 \end{pmatrix}.
$$

In general, for a vector

$$ \ket{\phi} \defeq \begin{pmatrix} a_1 \\ \vdots \\ a_n \end{pmatrix}, $$

we get

$$ \bra{\phi} = \begin{pmatrix} \bar{a_1} & \cdots & \bar{a_n} \end{pmatrix} $$

where $\bar{a}$ is the conjugate of $a \in \C$.

### Inner Product and Norm
Let $ \ket{\phi}, \ket{\psi} \in \C^2 $ be vectors.
We define the inner product of these vectors as $\braket{\phi}{\psi} \defeq \bra{\phi}\ket{\psi}$.
This is the same as well-known definition of usual inner product of vectors.
For example, we have

$$
\braket{0}{0}
= \bra{0}\ket{0}
= \begin{pmatrix} 1 & 0 \end{pmatrix} \begin{pmatrix} 1 \\ 0 \end{pmatrix}
= 1.
$$

We define the norm of a vector $\ket{\phi} \in V$ as $ \sqrt{\braket{\phi}{\phi}}$.
This is also the same as well-known definition of norm.
For example, for a vector

$$ \ket{\phi} \defeq \begin{pmatrix} a_1 \\ \vdots \\ a_n \end{pmatrix}, $$

we can calculate its norm as follows:

$$
\norm{\ket{\phi}}
= \sqrt{
    \begin{pmatrix} \bar{a_1} & \cdots & \bar{a_n} \end{pmatrix}
    \begin{pmatrix} a_1 \\ \vdots \\ a_n \end{pmatrix}
  }
= \sqrt{\bar{a_1}a_1 + \cdots + \bar{a_n}a_n}
= \sqrt{\abs{a_1}^2 + \cdots + \abs{a_n}^2}.
$$

### Matrix
For example, for a matrix $$X \defeq \begin{pmatrix} 0 & 1 \\ 1 & 0 \end{pmatrix}$$, we can easily check $X\ket{0} = \ket{1}$.

Let $A$ be a $n \times n$ matrix over $\C$.
We call matrix (linear) operator.
We write $A^{\dagger}$ for the adjoint operator of $A$.
In finite dimensional space, $A^{\dagger}$ is the conjugate transpose operator of $A$.
For example, for $$ A \defeq \begin{pmatrix} a_{11} & a_{12} \\ a_{21} & a_{22} \end{pmatrix} $$, we get $$ A^{\dagger} = \begin{pmatrix} \bar{a_{11}} & \bar{a_{21}} \\ \bar{a_{12}} & \bar{a_{22}} \end{pmatrix} $$.

We say operator $A$ is unitary when $ A^{\dagger} A = A A^{\dagger} = I $, where $I$ is the identity operator (unit matrix).
For example, $$ X \defeq \begin{pmatrix} 0 & 1 \\ 1 & 0 \end{pmatrix} $$ is unitary because it satisfies

$$
X^{\dagger} X
= X X^{\dagger}
= \begin{pmatrix} 0 & 1 \\ 1 & 0 \end{pmatrix} \begin{pmatrix} 0 & 1 \\ 1 & 0 \end{pmatrix}
= \begin{pmatrix} 1 & 0 \\ 0 & 1 \end{pmatrix}.
$$
