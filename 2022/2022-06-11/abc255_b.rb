# https://atcoder.jp/contests/abc255/tasks/abc255_b
include Math

n, k = gets.split(' ').map!(&:to_i)
a = gets.split(' ').map!(&:to_i)

positions = []
n.times do
  positions.push(gets.split(' ').map!(&:to_i))
end

farthest = 1

positions.each_index do |index|
  num = index + 1
  if a.include?(num)
    next
  end

  my_nearest = 300000
  a.each do |pos|
    x_distance = (positions[index][0] - positions[pos - 1][0]).abs2()
    y_distance = (positions[index][1] - positions[pos - 1][1]).abs2()

    distance = Math.sqrt(x_distance + y_distance)
    my_nearest = my_nearest > distance ? distance : my_nearest
  end
  farthest = farthest < my_nearest ? my_nearest : farthest
end

p farthest