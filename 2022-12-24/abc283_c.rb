s = gets.chomp.chars

answer = 0
zero_count = 0
s.each do |char|
  if char == '0'
    zero_count += 1
  else
    zero_count = 0
  end

  if zero_count == 2
    zero_count = 0
    next
  end

  answer += 1
end

puts answer
