n, m = gets.chomp.split.map(&:to_i)

onetime_expects = {}
prices = {}
price_sum = 0.to_r
n.times do |i|
  roulette = gets.chomp.split.map(&:to_i)
  price = roulette[0]
  pockets = roulette[1]
  points = roulette[2..]

  price_sum += price
  prices[i] = price
  onetime_expects[i] = points.sum.to_r / pockets
end

expects = {}
n.times do |i|
  weight = price_sum / prices[i]
  expects[i] = (m.to_r / onetime_expects[i]) * prices[i] * weight
end

puts expects.values.sum.to_f
