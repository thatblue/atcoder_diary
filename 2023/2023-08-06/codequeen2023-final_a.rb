s = gets.chomp.chars
c = gets.chomp

puts s.map {|v| v == c ? c * 2 : v }.join
