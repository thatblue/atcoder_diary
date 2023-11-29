UPCASE = ('A'..'Z').to_a
OFF_TO_OFF = 0
OFF_TO_ON = 1
ON_TO_OFF = 2
ON_TO_ON = 3

x, y, z = gets.chomp.split.map(&:to_i)
s = gets.chomp.chars

l = s.count
dp = Array.new(l + 1) { Array.new(4, Float::INFINITY) }
dp[0][0] = 0
dp[0][1] = z

s.each_with_index do |char, index|
  is_upcase = UPCASE.include?(char)
  i = index + 1

  dp[i][OFF_TO_OFF] = [dp[i - 1][OFF_TO_OFF], dp[i - 1][ON_TO_OFF]].min + (is_upcase ? y : x)
  dp[i][OFF_TO_ON] = [dp[i - 1][OFF_TO_OFF], dp[i - 1][ON_TO_OFF]].min + z + (is_upcase ? x : y)

  dp[i][ON_TO_OFF] = [dp[i - 1][OFF_TO_ON], dp[i - 1][ON_TO_ON]].min + z + (is_upcase ? y : x)
  dp[i][ON_TO_ON] = [dp[i - 1][OFF_TO_ON], dp[i - 1][ON_TO_ON]].min + (is_upcase ? x : y)
end

puts dp[l].min
