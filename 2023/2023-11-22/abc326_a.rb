x, y = gets.chomp.split.map(&:to_i)

puts y.between?(x - 3, x + 2) ? 'Yes' : 'No'
