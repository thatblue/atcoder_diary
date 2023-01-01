s = gets.chomp.chars.map(&:to_i)

digits = []
detected_lt9 = false
s.each do |digit|
  if detected_lt9
    digits << 9
  else
    if digit == 1
      digits << 0
    end

    digits << digit
    if digit < 9
      detected_lt9 = true if digit < 9
    end
  end

end

puts digits.sum
