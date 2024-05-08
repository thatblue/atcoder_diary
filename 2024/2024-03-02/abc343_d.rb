n, t = gets.chomp.split.map(&:to_i)

scores = Array.new(n + 1, 0)
distribution = Hash.new(0)
distribution[0] = n
distribution_count = 1

t.times do
  player, score = gets.chomp.split.map(&:to_i)

  distribution[scores[player]] -= 1
  distribution_count -= 1 if distribution[scores[player]].zero?
  scores[player] += score
  distribution[scores[player]] += 1
  distribution_count += 1 if distribution[scores[player]] == 1

  puts distribution_count
end
