a, b = gets.chomp.split.map(&:to_i)

min, max = [a, b].minmax

puts max / 2 == min ? "Yes" : "No"
