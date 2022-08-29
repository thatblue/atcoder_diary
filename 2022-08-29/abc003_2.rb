s = gets.chomp.chars
t = gets.chomp.chars

length = s.length

length.times do |i|
  if s[i] == t[i]
    next
  end

  if s[i] == '@' && %w[a t c o d e r].include?(t[i])
    next
  end
  if t[i] == '@' && %w[a t c o d e r].include?(s[i])
    next
  end

  puts "You will lose"
  exit
end

puts "You can win"
