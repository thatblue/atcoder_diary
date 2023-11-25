n, l = gets.chomp.split.map(&:to_i)
scores = gets.chomp.split.map(&:to_i)

puts scores.count { |v| v >= l }
