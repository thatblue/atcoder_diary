a, b = gets.chomp.split.map(&:to_f)

puts sprintf("%.03f", (b / a).round(3))
