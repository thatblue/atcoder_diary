gets.chomp.to_i
array = gets.chomp.split.map(&:to_i)

available_values = Hash.new(0)

array.each do |value|
  available_values[value - 1] += 1
  available_values[value] += 1
  available_values[value + 1] += 1
end

answer = available_values.max { |a, b| a[1] <=> b[1] }
puts answer[1]
