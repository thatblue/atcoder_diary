_n, a, b = gets.chomp.split.map(&:to_i)

ans = a + b

candidates = gets.chomp.split.map(&:to_i)

puts candidates.index(ans) + 1
