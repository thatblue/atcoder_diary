n = gets.chomp.to_i
array = gets.chomp.split.map(&:to_i).sort
max = array.last
array.delete(max)

puts array.last
