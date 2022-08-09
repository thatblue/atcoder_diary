n = gets.chomp.to_i

m = 2 * n

p m

digits, mod = n.divmod(4)

answer = Array.new(digits, 4)

if mod > 0
  answer.unshift mod
end

puts answer.join
