include Math

n = gets.chomp.to_i
performances = gets.chomp.split.map(&:to_i)
performances.unshift 0

dp = Array.new(n + 1) { Array.new(n + 1, 0) }
dp[1][1] = performances[1]

(1..n).each do |i|
  (1..i).each do |j|

  end
end



puts dp[n].max / waru - 1200 / Math.sqrt(k)
