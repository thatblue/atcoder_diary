n = gets.chomp.to_i

m = 2 * n

p m

digits, mod = n.divmod(4)

if mod > 0
  digits += 1
end

answer = Array.new(digits, 4)

if mod > 0
  answer[0] = mod
end

puts answer.join
