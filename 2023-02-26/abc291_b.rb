n = gets.chomp.to_i
x = gets.chomp.split.map(&:to_i).sort

puts x[n..(4 * n - 1)].sum.to_f / (3 * n)
