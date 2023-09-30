n = gets.chomp.to_i
s = gets.chomp
ans_byte = s.byteindex('ABC')

puts ans_byte.nil? ? -1 : ans_byte + 1
