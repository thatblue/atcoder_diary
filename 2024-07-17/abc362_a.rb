red, green, blue = gets.chomp.split.map(&:to_i)
c = gets.chomp

if c == 'Red'
  puts [green, blue].min
elsif c == 'Green'
  puts [red, blue].min
else
  puts [red, green].min
end
