A = gets.chomp.to_i
B = gets.chomp.to_i
C = gets.chomp.to_i
X = gets.chomp.to_i

ans = 0

price_500 = (0..A*500).step(500).to_a
price_100 = (0..B*100).step(100).to_a
price_50 = (0..C*50).step(50).to_a

price_500.product(price_100, price_50).each do |prices|
  ans += 1 if prices.sum == X
end

puts ans
