n = gets.chomp.to_i
s = gets.chomp.gsub('1', 'l').gsub('0', 'o')
t = gets.chomp.gsub('1', 'l').gsub('0', 'o')

puts s == t ? 'Yes' : 'No'
