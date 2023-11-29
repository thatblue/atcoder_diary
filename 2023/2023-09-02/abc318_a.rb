n, m, p = gets.chomp.split.map(&:to_i)

if n < m
  puts 0
  exit
end

puts (n - m) / p + 1
