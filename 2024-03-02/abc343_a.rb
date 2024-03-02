a, b = gets.chomp.split.map(&:to_i)

puts (0..9).to_a.find { |v| v != a + b }

