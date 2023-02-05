VERY_LARGE_PRIME = 10 ** 9 + 7
n = gets.chomp.to_i
s = gets.chomp.chars

target_chars = "atcoder".chars

dp = Array.new(7, 0)

s.each_with_index do |current, j|
  target_chars.each_with_index do |target, i|
    break if j < i
    next unless current == target

    if i == 0
      dp[i] += 1
    else
      dp[i] += dp[i - 1]
    end

  end
end

puts dp[6] % VERY_LARGE_PRIME
