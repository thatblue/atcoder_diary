n, l, r = gets.chomp.split.map(&:to_i)
hash = {}

dp = {}
dp.default = {}
dp[0][0] = 0
diff_to_l = {}
diff_to_r = {}
gets.chomp.split.map(&:to_i).each_with_index do |value, index|
  dp[0][0] += value
  hash[index + 1]  = value
  diff_to_l[index + 1] = l - value
  diff_to_r[index + 1] = r - value
end

sum_min = dp[0][0]
(n + 1).times do |i|
  max_j = n - i
  if i > 0
    current_sum = dp[i - 1][0] + diff_to_l[i]
    dp[i][0] = current_sum
    sum_min = [sum_min, current_sum].min
  end

  (1..max_j).each do |j|
    current_sum = dp[i][j - 1] + diff_to_r[n - j + 1]
    dp[i][j] = current_sum
    sum_min = [sum_min, current_sum].min
  end
end

p sum_min