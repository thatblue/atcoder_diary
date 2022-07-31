VERY_LARGE_PRIME = 998244353
n = gets.chomp.to_i
array = gets.chomp.split.map(&:to_i)

sum = n
(2..n).each do |i|
  sum += array.combination(i).map { |perm|
    #if perm.sum % i == 0
    #  p perm
    #end
    perm.sum % i == 0 ? 1 : 0
  }.sum % VERY_LARGE_PRIME
end

p sum % VERY_LARGE_PRIME
