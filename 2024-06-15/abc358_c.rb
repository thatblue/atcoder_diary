n, m = gets.chomp.split.map(&:to_i)
all_bits = 2 ** m - 1

shop_flavors = []
n.times do
  shop_flavors << gets.chomp.chars.map { |v| v == 'o' ? '1' : '0' }.join.to_i(2)
end

if shop_flavors.include?(all_bits)
  puts 1
  exit
end

shop_indexes = (0..n-1).to_a
2.upto(n-1) do |shop_count|
  shop_indexes.combination(shop_count) do |combination|
    bits = 0
    combination.each do |index|
      bits |= shop_flavors[index]
    end

    if bits == all_bits
      puts shop_count
      exit
    end
  end
end

puts n
