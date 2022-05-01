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
