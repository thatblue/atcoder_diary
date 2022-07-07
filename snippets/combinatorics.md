# 組み合わせ数学

## 階乗
```ruby
VERY_LARGE_PRIME = 1000000007

def factorial(n)
  (2..n).inject(1) do|result, item|
    (result * item) % VERY_LARGE_PRIME
  end
end
```

数の爆発が起きやすいため、基本的には適当な素数で剰余を取るはず。
