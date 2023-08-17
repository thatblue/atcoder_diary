a, b = gets.chomp.split.map(&:to_i)

puts (a % 3 != 0) && (b - a) == 1 ? 'Yes' : 'No'
