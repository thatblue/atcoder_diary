n, m = gets.chomp.split.map(&:to_i)

sellers = gets.chomp.split.map(&:to_i).sort
buyers = gets.chomp.split.map(&:to_i).sort.reverse

merged = sellers + buyers + [sellers[0] - 1, buyers[0] + 1]
merged.uniq!.sort!

merged.each do |price|
  sellers_count = sellers.bsearch_index { |s| s > price }
  sellers_count ||= n
  buyers_count = buyers.bsearch_index { |b| b < price }
  buyers_count ||= m

  if sellers_count >= buyers_count
    puts price
    exit
  end
end
