---
layout: post
title: The Book読んだメモ(随時更新という名の塩漬け)
date: 2022-05-01 18:34:21 +0900
categories: Rust
---

[The Book](https://doc.rust-jp.rs/book-ja/)いい加減読み終わりたいのでメモする。

# 1.事始め

https://github.com/ryoo14/lang_test/tree/main/rust/the_book/hello

`cargo new hello`したら終わる。

# 2.数当てゲームのプログラミング

https://github.com/ryoo14/lang_test/tree/main/rust/the_book/number

この辺りは流石に覚えてるのでしゅっと突破。

# 3.一般的なプログラミングの概念

https://github.com/ryoo14/lang_test/tree/main/rust/the_book/general

## 3.1.変数と可変性

- 標準で不変
- 可変にしたい場合は`let mut hoge`のように`mut`が必要
- 変数の変更が原因のバグは原因特定が難しい
- そのためRustは変数を不変とすることでバグの可能性を減らし、どこでどのように値が変更されているかを追跡する必要をなくしている
- `mut`で可変とする場合も読者にその意図を汲ませることができる
- 以下のような書き方をすれば不変のまま値を変え、さらに変数の型も変えることができる

```rust
let x = "hoge";
let x = x.len();
```

## 3.2.データ型

特記事項なし

## 3.3.関数

- 関数と変数の命名規則はスネークケースを使うのが慣例
- 関数の仮引数定義は以下の感じ

```rust
fn hoge(x: i32) {
    ...
}
```

- 各仮引数の型は必ず宣言する必要がある
- 戻り値のある関数は以下の感じ

```rust
fn fuga() -> i32 {
    7
}
```

# 3.4.コメント

- `//`から始まる行はそれ以降コメントアウトされる

# 3.5.制御フロー

https://github.com/ryoo14/lang_test/tree/main/rust/the_book/general/flow

- `let`文の右辺に`if`を持ってくることが可能

```rust
let hoge = if 1 == 1 {
    5
};
```

- ただし`else`などでアームが複数になる場合、評価結果の型は同じでなければならない

```rust
// これはコンパイルエラー
let number = if 1 == 1 {
    5
} else {
    "str"
}
```

- `loop`で無限ループ
- `while`で継続条件付きのループ
- `for`で`iter`を使ったループ

# 4.所有権を理解する

- ガベージコレクションをもつ言語やそれがなく明示的にメモリの確保と解放を行わなければならない言語と異なり、Rustはコンパイル時点で所有権の仕組みを使って管理される
-
