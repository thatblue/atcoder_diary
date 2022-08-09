# cf. https://atcoder.jp/contests/abc262/submissions/33686056

VERY_LARGE_PRIME = 998244353
n = gets.chomp.to_i
array = gets.chomp.split.map(&:to_i)

sum = 0
(1..n).each do |i|
  dp = Array.new(i){Hash.new(0)}
  n.times do|j|
    (i - 2).downto(0) do |k|
      break if n - j < i - k - 1
      dp[k].each do |remain, current_count|
        dp[k + 1][(array[j] + remain) % i] += current_count
      end
    end
    dp[0][array[j] % i] += 1
  end

  sum += dp[-1][0]
  sum %= VERY_LARGE_PRIME
end

p sum
