n, s, k = gets.chomp.split.map(&:to_i)

total = 0
n.times do
  price, count = gets.chomp.split.map(&:to_i)
  total += price * count
end

total += k unless total >= s

puts total
