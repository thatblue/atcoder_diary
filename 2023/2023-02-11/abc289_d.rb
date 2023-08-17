require 'set'

n = gets.chomp.to_i

steps = gets.chomp.split.map(&:to_i)

gets.chomp.to_i

mochis = Set.new gets.chomp.split.map(&:to_i)

goal = gets.chomp.to_i

dp = Array.new(goal + 1, false)
dp[0] = true

0.upto(goal) do |i|
    # 到達負荷であればスルー
    next unless dp[i]

    steps.each_with_index do |step, j|
        next_step = i + step
        next if mochis.include? next_step

        dp[next_step] = true
    end

end

puts dp[goal] ? 'Yes' : 'No'
