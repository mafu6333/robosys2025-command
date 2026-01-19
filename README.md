# calcpipe - 標準入力式計算コマンド

![test](https://github.com/mafu6333/robosys2025_command/actions/workflows/test.yml/badge.svg)
---

ロボットシステム学（robosys2025）の課題として作成した  
標準入力から与えた数式を1行ずつ計算するコマンド `calcpipe` と、そのテストをまとめたディレクトリです。

---

## 機能

- 標準入力から数式を受け取り計算結果を出力
- 空行および `#` から始まるコメント行は無視
- エラーが出た行は行番号付きで標準エラーに表示
- 危険なPythonコードは実行できないよう制限

---

## 実行方法

### 1. インストール

リポジトリを clone してディレクトリに移動します。

```bash
git clone https://github.com/mafu6333/robosys2025_command.git
cd calcpipe
chmod +x calcpipe

### 2. 実行
```bash
echo "1+2" | ./calcpipe

### 3. 実行例
```bash
printf "1+2\n3*4\nsqrt(9)\npi*2\n" | ./calcpipe

3
12
3.0
6.283185307179586

```bash
printf "1+2\nabc\n3+4\n" | ./calcpipe

```css
[error] line 2: abc (Syntax error)

---

## 対応している演算

本コマンドでは、標準入力から与えられた数式に対して以下の演算のみを許可している。

- 四則演算  
  `+`（加算）、`-`（減算）、`*`（乗算）、`/`（除算）

- 累乗  
  `**`

- 括弧による優先順位制御  
  `( )`

- 数値定数  
  `pi`, `e`

- 数学関数  
  `sqrt(x)` のみ対応

※ 上記以外の関数呼び出しや変数、Pythonコードは安全性確保のため実行できない。


## オプション

| オプション | 説明 |
|------------|------|
| --quiet | エラー内容を表示しない |
| --fail-fast | エラー発生時にその場で終了する |

---

## 必要なソフトウェア

- Python 3.11 以上（3.14まで動作確認済み）

---

## テスト環境/方法

- Ubuntu 22.04.3

以下のテストスクリプトを用いて動作確認を行う。

```bash
./test.bash

---

## ライセンス

このソフトウェアは BSD 3条項ライセンスのもとで再頒布および使用が可能です。  
詳細は LICENSE ファイルを参照してください。

© 2026 Fumiyori Manaka
