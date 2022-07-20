# DP

## ナップサック問題

[典型問題](https://atcoder.jp/contests/dp/tasks/dp_d)を解いたときのコード。

```ruby
n, w = gets.chomp.split.map(&:to_i)

cargos = []
n.times do
  cargos << gets.chomp.split.map(&:to_i)
end

dp = Array.new(n) {Array.new(w + 1, 0)}

n.times do |i|
  current_weight, current_value = cargos[i]
  (1..w).each do |weight|
    if weight - current_weight < 0
      dp[i][weight] = dp[i - 1][weight]
    else
      dp[i][weight] = [dp[i - 1][weight], dp[i - 1][weight - current_weight] + current_value].max
    end
  end
end

p dp[n-1][w]
```