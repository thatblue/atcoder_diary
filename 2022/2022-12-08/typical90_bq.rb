VERY_LARGE_PRIME = 10 ** 9 + 7
n, k = gets.chomp.split.map(&:to_i)

if n == 1
  puts k
  exit
end

puts k * (k - 1) * (k - 2).pow(n - 2, VERY_LARGE_PRIME) % VERY_LARGE_PRIME
