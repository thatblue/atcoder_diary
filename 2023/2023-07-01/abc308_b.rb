n, m = gets.chomp.split.map(&:to_i)

eaten = gets.chomp.split
plans = gets.chomp.split

prices = gets.chomp.split.map(&:to_i)

default_price = prices[0]

prices_hash = plans.zip(prices[1..]).to_h

sum = 0
eaten.each do |color|
  if prices_hash.include? color
    sum += prices_hash[color]
  else
    sum += default_price
  end
end

puts sum
