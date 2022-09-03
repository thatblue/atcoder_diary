n, m = gets.chomp.split.map(&:to_i)
array = gets.chomp.split.map(&:to_i)
array.unshift(0)

dp = Array.new(n + 1) { Array.new(m + 1, -Float::INFINITY) }
dp[1][1] = array[1]
(2..n).each do |i|
  dp[i][1] = [dp[i - 1][1], array[i]].max
  max_j = [i, m].min
  (2..max_j).each do |j|
    dp[i][j] = [dp[i-1][j], (dp[i - 1][j - 1] + array[i] * j)].max
  end
end

p dp[n][m]
