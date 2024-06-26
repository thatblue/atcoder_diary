VERY_LARGE_PRIME = 998244353

k = gets.chomp.to_i
chars = gets.chomp.split.map(&:to_i)
chars.unshift(0)

dp = Array.new(k + 1) { Array.new(27, 0) }

(1..26).each do |i|
  dp[1][i] = 1 if chars[i].positive?
end

(2..k).each do |length|
  (1..26).each do |char|
    

  end
end
