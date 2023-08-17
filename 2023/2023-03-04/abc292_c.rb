# cf. https://atcoder.jp/contests/abc292/submissions/39420187
n = gets.chomp.to_i

# 約数を求めるのではなく、x * y <= n を満たすxとyの組み合わせを全部数え上げていく方が早い
# 処理回数が調和級数なので、計算量はN * log(N)で求められる
cache = Array.new(n + 1, 0)
1.upto(n) do |x|
  y_max = n / x
  1.upto(y_max) do |y|
    cache[x * y] += 1
  end
end

ans = 1.upto(n).sum { |x| cache[x] * cache[n - x] }

puts ans
