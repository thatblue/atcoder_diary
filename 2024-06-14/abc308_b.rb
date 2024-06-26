N, M = gets.chomp.split.map(&:to_i)
ORDERED_COLORS = gets.chomp.split
PLATE_COLORS = gets.chomp.split
PRICES = gets.chomp.split.map(&:to_i)
DEFAULT_PRICE = PRICES.shift

ans = 0
prices = PLATE_COLORS.zip(PRICES).to_h
prices.default = DEFAULT_PRICE

ORDERED_COLORS.each do |color|
  ans += prices[color]
end

puts ans
