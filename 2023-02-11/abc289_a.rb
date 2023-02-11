s = gets.chomp.chars

puts s.map { |c| c == '1' ? '0' : '1' }.join
