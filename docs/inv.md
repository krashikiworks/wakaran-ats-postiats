# INV

`INV(T)`とは`T`が不変(invariant)であることを意味するマーカーである。
ここで`T`は何らかの型である。

## hwxiによる解説

`INV`は不変であることを示すためにあります。
それは型チェックに必須のマーカーです。

例えば、関数`foo`を次のように宣言したとします:

    fun{a:t@ype} foo(xs: list0(a)): void

`mylst`とは何らかの型`T`に対して`list0(T)`であると想定します。
`foo(mylst)`が型チェックされる時、型チェッカーはプレースホルダ`T1`を指定して以下のように式を展開します:

    foo<T1>(mylst)

ここで`T <= T1`と想定されています.

`foo2`が以下のように宣言されているとします:

    fun{a:t@ype} foo2(xs: list0(INV(a))): void

`foo2(mylst)`が型チェックされる時、型チェッカーは単に式を`foo2<T>(mylst)`へと展開します。

[^原文]

## 参考

[INV in ATS2](https://groups.google.com/g/ats-lang-users/c/ptwztS9IHWg)

[^原文]: https://groups.google.com/g/ats-lang-users/c/ptwztS9IHWg/m/NcyCP1vjTB8J
