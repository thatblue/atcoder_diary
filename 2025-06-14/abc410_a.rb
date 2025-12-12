n = gets.chomp.to_i
ages = gets.chomp.split.map(&:to_i)
k = gets.chomp.to_i

ans = 0
ages.each do |age|
  ans += 1 if k <= age
end

puts ans