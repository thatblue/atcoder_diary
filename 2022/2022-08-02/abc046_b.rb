n, k = gets.chomp.split.map(&:to_i)

dp = Array.new(n + 1) {Array.new(k, 0)}

1.upto(n) do |i|
  k.times do |j|
    if i == 1
      dp[i][j] = 1
      next
    end

    dp[i][j] = dp[i - 1].map.with_index { |prev, index|
      j == index ? 0 : prev
    }.sum
  end
end

p dp[n].sum
