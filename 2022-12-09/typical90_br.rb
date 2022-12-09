n = gets.chomp.to_i

plants_x = []
plants_y = []
n.times do
  x, y = gets.chomp.split.map(&:to_i)
  plants_x << x
  plants_y << y
end

plants_x.sort!
plants_y.sort!

if n.odd?
  x_center = plants_x[n / 2]
  y_center = plants_y[n / 2]
else
  x_center = (plants_x[n / 2] + plants_x[n / 2 - 1]) / 2
  y_center = (plants_y[n / 2] + plants_y[n / 2 - 1]) / 2
end

distance_sum = 0
n.times do |index|
  distance_sum += (x_center - plants_x[index]).abs + (y_center - plants_y[index]).abs
end

puts distance_sum