# 組み合わせ数学

## 階乗
```ruby
VERY_LARGE_PRIME = 1_000_000_007

def factorial(n)
  (2..n).inject do |result, item|
    (result * item) % VERY_LARGE_PRIME
  end
end
```

数の爆発が起きやすいため、基本的には適当な素数で剰余を取るはず。

剰余を取る必要がなければ`Math#gamma`で簡単に書ける。

```ruby
Math.gamma(n + 1).to_i
```

## 順列 (nPr)

```ruby
def permutation(n, r)
  ((n - r + 1)..n).inject(:*)
end
```

## 組み合わせ (nCr)

```ruby
def combination(n, r)
  ((n - r + 1)..n).inject(:*) / (2..r).inject(:*)
end
```