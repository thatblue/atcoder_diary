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

## 配列の中央値を計算

```ruby
def median(array)
  length = array.count
  center = length / 2
  if length.odd?
    # 配列の要素が奇数個の場合はそのまま真ん中の値が中央値
    array[center]
  else
    # 配列の要素が偶数個の場合は真ん中2つの平均が中央値
    (array[center] + array[center - 1]) / 2
  end
end
```

## 素因数分解

取りうる値が10**9以下であれば、`10**9 < 2**27` なので素因数の合計は高々26個になり、コンテストでも実用に耐える(耐えた)

```ruby
require 'prime'
12.prime_division #=> [[2,2], [3,1]]
```

## 約数列の生成

```ruby
# cf. https://qiita.com/norioc/items/5c270ad6ff5d22d1efd0#comment-da13f6b749dba662ec63

require 'prime'

def divisors(n)
  n.prime_division.inject([1]) do |ary, (p, e)|
    (0..e).map{ |e1| p ** e1 }.product(ary).map{ |a, b| a * b }
  end.sort
end
```
