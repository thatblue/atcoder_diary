s = gets.chomp.chars.tally

s.each_pair do |key, value|
  if value == 1
    puts key
    exit
  end
end

p -1