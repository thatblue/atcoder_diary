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

10**18だと検証対象が1個だけでも間に合わない。

```ruby
require 'prime'
12.prime_division #=> [[2,2], [3,1]]
```

全部異なる素因数(？)を掛けていった場合の最小値は以下のとおり。`10**12`未満で11個までしか使えないので`prime_division`の戻り値を素朴にぶん回しても概ね十分間に合う。

```
 1個: 1
 2個: 2
 3個: 6
 4個: 30
 5個: 210
 6個: 2,310
 7個: 30,030
 8個: 510,510
 9個: 9,699,690
---- 10^9の壁 ----
10個: 223,092,870
11個: 6,469,693,230
---- 10^12の壁 ----
12個: 200,560,490,130
13個: 7,420,738,134,810
---- 10^15の壁 ----
14個: 304,250,263,527,210
15個: 13,082,761,331,670,030
---- 10^18の壁 ----
16個: 614,889,782,588,491,410
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

## 素数列の生成(N以下の素数の列挙)

`prime` ライブラリに素数列をeachするメソッドがあるので、素数列が欲しいだけであればそれを使えばよい。

```
require 'prime'
N_MAX = 300_000

primes = Prime.instance.each(N_MAX).to_a
```

## 素数列の生成(エラトステネスのふるい)

処理が終わったタイミングの `primes` が素数列になる。
```
# cf. https://algo-method.com/descriptions/64

N_MAX = 300_000
is_prime = Array.new(N_MAX + 1, true)
is_prime[0] = false
is_prime[1] = false

primes = []
2.upto(N_MAX) do |i|
  next unless is_prime[i]

  primes << i
  multiple_of_i = i * 2
  while multiple_of_i <= N_MAX
    is_prime[multiple_of_i] = false
    multiple_of_i += i
  end
end
```
