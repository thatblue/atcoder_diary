VERY_LARGE_PRIME = 998244353
n = gets.chomp.to_i

dp = Array.new(n) { Array.new(2, 0) }
dp[0][0] = 1
dp[0][1] = 1

prev_card = nil
n.times do |i|
  current_card = gets.chomp.split.map(&:to_i)
  if i > 0
    dp[i][0] += dp[i - 1][0] % VERY_LARGE_PRIME if current_card[0] != prev_card[0]
    dp[i][0] += dp[i - 1][1] % VERY_LARGE_PRIME if current_card[0] != prev_card[1]
    dp[i][1] += dp[i - 1][0] % VERY_LARGE_PRIME if current_card[1] != prev_card[0]
    dp[i][1] += dp[i - 1][1] % VERY_LARGE_PRIME if current_card[1] != prev_card[1]
  end

  prev_card = current_card
end

puts dp[n - 1].sum % VERY_LARGE_PRIME

