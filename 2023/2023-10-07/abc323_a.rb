s = gets.chomp.chars

s.each_with_index do |char, i|
  next if i.even?

  if char == '1'
    puts 'No'
    exit
  end
end

puts 'Yes'
