n, k, q = gets.chomp.split.map(&:to_i)

ranking = {}
hash = {}
smallest = nil
q.times do
  x, y = gets.chomp.split.map(&:to_i)

  value_before = hash[x]
  hash[x] = y
  diff = y - value_before

  sum += diff

  puts sum
end
