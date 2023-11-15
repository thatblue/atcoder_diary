n, x = gets.chomp.split.map(&:to_i)
scores = gets.chomp.split.map(&:to_i)

ans = 0
scores.each do |score|
  ans += score if score <= x
end

puts ans
