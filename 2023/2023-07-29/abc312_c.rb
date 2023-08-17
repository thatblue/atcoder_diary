n, m = gets.chomp.split.map(&:to_i)

sellers = gets.chomp.split.map(&:to_i).sort
buyers = gets.chomp.split.map(&:to_i).sort.reverse

candidate_prices = sellers + buyers.map { |b| b + 1 }
candidate_prices.uniq!
candidate_prices.sort!

puts candidate_prices.bsearch { |price|
  sellers_count = sellers.bsearch_index { |s| s > price } || n
  buyers_count = buyers.bsearch_index { |b| b < price } || m

  sellers_count >= buyers_count
}
