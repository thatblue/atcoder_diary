n = gets.chomp.to_i

prob = gets.chomp.split.map(&:to_f)
prob.unshift(0)
majority_of_n = n / 2 + 1

dp = Array.new(n + 1) {Array.new(majority_of_n + 1, -1)}
dp[0][0] = 1

(1..n).each do |i|
  p_i = prob[i]

  # j = 0 の場合
  dp[i][0] = dp[i - 1][0] * (1 - p_i)

  j_max = [i, majority_of_n].min

  (1..j_max).each do |j|
    if i == j
      dp[i][j] = dp[i-1][j-1] * p_i
      next
    end

    dp[i][j] = (dp[i - 1][j - 1] * p_i) + (dp[i - 1][j] * (1 - p_i))
  end
end

p dp[n][majority_of_n] + (1 - dp[n].sum)