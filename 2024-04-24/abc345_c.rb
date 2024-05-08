s = gets.chomp.chars
length = s.length
chars = s.tally

ans = length * (length - 1) / 2
has_no_change = false

chars.each_value do |count|
  next if count == 1

  has_no_change = true

  ans -= count * (count - 1) / 2
end

ans += 1 if has_no_change

puts ans
