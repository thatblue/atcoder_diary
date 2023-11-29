n = gets.chomp.to_i
array = gets.chomp.split.map(&:to_i)

puts array.uniq.count == 1 ? 'Yes' : 'No'
