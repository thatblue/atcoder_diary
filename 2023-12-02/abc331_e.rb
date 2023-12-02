# cf. https://atcoder.jp/contests/abc331/editorial/7853
# cf. https://atcoder.jp/contests/abc331/submissions/48124046

n, m, l = gets.chomp.split.map(&:to_i)

main_dishes = gets.chomp.split.map.with_index { |v, i| [v.to_i, i + 1] }.sort.reverse
side_dishes = gets.chomp.split.map.with_index { |v, i| [v.to_i, i + 1] }.sort.reverse

exclude_pairs = {}
l.times do
  exclude_pairs[gets.chomp.split.map(&:to_i)] = true
end

side_max = side_dishes.first[0]

ans = 0
main_dishes.each do |main_price, main_no|
  next if main_price + side_max < ans

  side_dishes.each do |side_price, side_no|
    next if exclude_pairs[[main_no, side_no]]

    ans = [ans, main_price + side_price].max
    break
  end
end

puts ans
