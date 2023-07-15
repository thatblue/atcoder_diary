n, p, q = gets.chomp.split.map(&:to_i)

dishes = gets.chomp.split.map(&:to_i).sort

puts p < q + dishes[0] ? p : q + dishes[0]
