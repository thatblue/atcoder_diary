n, k, x = gets.chomp.split.map(&:to_i)
array = gets.chomp.split.map(&:to_i)

new_array = array[0..(k-1)] + [x] + array[k..]

puts new_array.join ' '
