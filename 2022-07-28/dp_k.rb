_, k = gets.chomp.split.map(&:to_i)

hands = gets.chomp.split.map(&:to_i).sort

dp = Array.new(k + 1, 0)

(1..k).each do |stones|
  hands.each do |hand|
    after_hand = stones - hand
    if after_hand >= 0 && dp[after_hand] == 0
      dp[stones] = 1
    end
  end
end

puts dp[k] == 1 ? 'First' : 'Second'