s = gets.chomp.chars

puts s.find_index { |v| ('A'..'Z').include?(v) } + 1
