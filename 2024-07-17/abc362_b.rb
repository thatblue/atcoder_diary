x_a, y_a = gets.chomp.split.map(&:to_i)
x_b, y_b = gets.chomp.split.map(&:to_i)
x_c, y_c = gets.chomp.split.map(&:to_i)

ab_square = (x_a - x_b).abs ** 2 + (y_a - y_b).abs ** 2
bc_square = (x_b - x_c).abs ** 2 + (y_b - y_c).abs ** 2
ca_square = (x_c - x_a).abs ** 2 + (y_c - y_a).abs ** 2

a, b, c = [ab_square, bc_square, ca_square].sort

if a + b == c
  puts 'Yes'
else
  puts 'No'
end
