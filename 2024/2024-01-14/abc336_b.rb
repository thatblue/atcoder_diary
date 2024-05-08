n = gets.chomp.to_i

bits = n.to_s(2).reverse.chars

ans = 0
bits.each do |bit|
  break if bit == "1"
  ans += 1
end

puts ans
