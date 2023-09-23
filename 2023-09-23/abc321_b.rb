n, x = gets.chomp.split.map(&:to_i)
scores = gets.chomp.split.map(&:to_i).sort
prev_sum = scores[1..-2].sum
current_worst = scores[0]
current_best = scores[-1]

required_point = [x - prev_sum, 0].max

if required_point <= current_worst
  puts 0
elsif required_point <= current_best
  puts required_point
else
  puts -1
end
