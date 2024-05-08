s = gets.chomp.chars
length = s.length

ans = (length-1) * length / 2
chars = s.tally

has_no_change = false
chars.each_value do |v|
  next if v == 1

  has_no_change = true
  ans -= v * (v - 1) / 2
end

ans += 1 if has_no_change
puts ans
