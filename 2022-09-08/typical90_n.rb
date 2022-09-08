n = gets.chomp.to_i
a = gets.chomp.split.map(&:to_i).sort
b = gets.chomp.split.map(&:to_i).sort

sum = 0
n.times do |index|
  sum += (a[index] - b[index]).abs
end

p sum
