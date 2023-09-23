n, m, p = gets.chomp.split.map(&:to_i)

main_prices = gets.chomp.split.map(&:to_i)
sub_prices = gets.chomp.split.map(&:to_i).sort
cumu_sum = 0
sub_prices_cumu = sub_prices.map { |v| cumu_sum += v }

ans = 0
main_prices.each do |main_price|
  sub_max = p - main_price
  sub_ceil_index = sub_prices.bsearch_index { |v| v >= sub_max } || m
  sub_ceil_count = m - sub_ceil_index
  sub_price_as_is = sub_ceil_index == 0 ? 0 : sub_prices_cumu[sub_ceil_index - 1]

  ans += main_price * m + sub_price_as_is + sub_max * sub_ceil_count
end

puts ans
