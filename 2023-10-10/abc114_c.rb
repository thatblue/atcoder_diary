n = gets.chomp.to_i
n_digits = n.to_s.length

numbers_753 = [3, 5, 7].permutation.to_a.map { |v| v.join.to_i }

digits = 4
while n_digits >= digits do
  (1..digits-2).each do |i|
    max_j = digits - i - 1
    (1..max_j).each do |j|
      k = digits - (i + j)

      permutations = (Array.new(i, 3) + Array.new(j, 5) + Array.new(k, 7)).permutation.to_a.map { |v| v.join.to_i }
      numbers_753 += permutations
    end
  end

  digits += 1
end

numbers_753.uniq!
numbers_753.sort!

puts numbers_753.bsearch_index { |v| v > n } || numbers_753.length
