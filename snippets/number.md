# 数値操作(？)
## 最大値がいまいち分からないがとりあえず大きい値で埋めておきたい

```ruby
array =  Array.new(n, Float::INFINITY)
```

## 10進数をN進数(表記の文字列)に変換

nは2～36の範囲内で指定する。

``ruby
12345.to_s(n)
``

## N進数を10進数(のInteger)に変換

nは2～36の範囲内で指定する。

```ruby
"12345".to_i(n)
```

## AとBの最小公倍数

LCM = Least Common Multiple

```ruby
lcm = a.lcm(b)
```

## AとBの最大公約数

GCD = Greatest Common Divisor

```ruby
gcd = a.gcd(b)
```