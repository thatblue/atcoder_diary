s = gets.chomp
c = gets.chomp

puts s.gsub(/#{c}/, c * 2)
