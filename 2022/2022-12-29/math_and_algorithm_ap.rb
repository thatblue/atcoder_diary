VERY_LARGE_PRIME = 10 ** 9 + 7
n = gets.chomp.to_i
queue = [1, 1]

(n - 3).times do
  queue << queue.sum % VERY_LARGE_PRIME
  queue.shift
end

puts queue.sum % VERY_LARGE_PRIME
