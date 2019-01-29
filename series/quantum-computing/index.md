---
layout: post
title:  "量子コンピュータ入門"
tags:
  - 量子コンピュータ
---
English version is [here](index-en.html).

$$
\def\blo#1{\mathop{\mathcal{L}}(#1)}
\def\H{\mathcal{H}}
\def\K{\mathcal{K}}
$$

## はじめに
この一連の記事では量子計算の計算原理を説明する．
また計算原理をより理解するために量子計算を古典コンピュータでシミュレートするプログラムを作成する．
前提知識は学部1年生レベルの線型代数のみを仮定する．
シミュレータ作成のために使用するプログラミング言語は OCaml だが，何らかのプログラミング言語に触れた経験があれば理解できるように書く予定である．

## 目次
以下は執筆予定の事柄である．
内容を削ったり増やしたり分割したり順番を入れ替えたりする可能性がある．

- OCaml 超入門
- [線型代数の復習](introduction-to-linear-algebra.html)
- 線型代数の実装
- テンソル積
- 量子計算の原理
  - 量子状態
  - 複合量子系
  - 状態の時間発展
  - 測定
- 量子複製不可能定理
- 量子テレポーテーション
- Deutsch-Jozsa のアルゴリズム

## 参考文献
- 細谷暁夫. 量子コンピュータの基礎 [第2版]. *SGCライブラリ* Vol. 69, 2009.
- 五十嵐 淳. *プログラミング in OCaml*. 技術評論社. 2007.
- Mingsheng Ying. *Foundations of Quantum Programming*. Morgan Kaufmann. 2016.
