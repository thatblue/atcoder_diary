n, m = gets.chomp.split.map(&:to_i)
x = gets.chomp.split.map(&:to_i)

x.unshift(0)

bonuses = {}
bonuses.default = 0

m.times do
  count, bonus = gets.chomp.split.map(&:to_i)
  bonuses[count] = bonus
end

dp = Array.new(n + 1) { Array.new(n + 1, 0) }

dp[1][0] = 0
dp[1][1] = x[1] + bonuses[1]

(2..n).each do |i|
  dp[i][0] = dp[i - 1].max

  (1..i).each do |j|
    dp[i][j] = dp[i-1][j-1] + x[i] + bonuses[j]
  end
end

p dp[n].max
