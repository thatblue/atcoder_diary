n = gets.chomp.to_i
heights = gets.chomp.split.map(&:to_i)
leftmost = heights.shift

higher_index = heights.index { |h| leftmost < h }
puts higher_index.nil? ? -1 : higher_index + 2
