VERY_LARGE_PRIME = 10 ** 9 + 7
l, r = gets.chomp.split.map(&:to_i)

def triangular(n)
  n * (n + 1) / 2
end

current = l
current_digits = l.to_s.length
digits_count = 0
while current <= r
  max_of_current = [10 ** current_digits - 1, r].min

  digits_count += triangular(max_of_current) * current_digits
  digits_count -= triangular(current - 1) * current_digits if current > 1

  current_digits += 1
  current = max_of_current + 1
end

puts digits_count % VERY_LARGE_PRIME
