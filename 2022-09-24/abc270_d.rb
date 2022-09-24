n, k = gets.chomp.split.map(&:to_i)
hands = gets.chomp.split.map(&:to_i).sort

hand_max = hands[-1]

if hand_max == n
  p n
  exit
end

dp = Array.new(n + 1) { Array.new(k, 0)}

1.upto(n) do |i|
  k.times do |j|
    gain = hands[j]
    if i - gain < 0
      break
    end

    next_remain = i - gain
    next_max = dp[next_remain].max
    next_gain_index = dp[next_remain].rindex(next_max)
    next_gain = hands[next_gain_index]

    dp[i][j] = dp[next_remain - next_gain].max + gain
  end
end

p dp[n].max
