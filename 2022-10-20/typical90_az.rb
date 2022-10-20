VERY_LARGE_PRIME = 10 ** 9 + 7
n = gets.chomp.to_i

sum = 1
n.times do
  sum *= gets.chomp.split.map(&:to_i).sum
  sum %= VERY_LARGE_PRIME
end

puts sum
