VERY_LARGE_PRIME = 10 ** 9 + 7
TARGET = "atcoder".chars

n = gets.chomp.to_i
s = gets.chomp.chars

dp = Array.new(n + 1) { Array.new(8, 0) }
dp[0][0] = 1

s.each_with_index do |char, i_index|
  i = i_index + 1
  dp[i][0] = 1

  TARGET.each_with_index do |target_char, j_index|
    j = j_index + 1
    dp[i][j] = dp[i - 1][j] % VERY_LARGE_PRIME
    if char == target_char
      dp[i][j] += dp[i - 1][j - 1] % VERY_LARGE_PRIME
      next
    end
  end
end

p dp[n][7] % VERY_LARGE_PRIME
