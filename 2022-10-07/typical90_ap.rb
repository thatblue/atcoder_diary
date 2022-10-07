VERY_LARGE_PRIME = 10 ** 9 + 7
k = gets.chomp.to_i

if k % 9 > 0
  p 0
  exit
end

dp = [1]

1.upto(k) do |i|
  j_max = [i, 9].min
  dp[i] = 0
  1.upto(j_max) do |j|
    dp[i] += dp[i - j]
    dp[i] %= VERY_LARGE_PRIME
  end
end

p dp[k]
