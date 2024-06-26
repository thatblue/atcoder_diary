def move_left(x, y)
  if y.even?
    return x.even? ? x : x - 1
  end

  x.odd? ? x : x - 1
end

s_x, s_y = gets.chomp.split.map(&:to_i)
t_x, t_y = gets.chomp.split.map(&:to_i)

if s_x > t_x
  start_x, start_y = [t_x, t_y]
  goal_x, goal_y = [s_x, s_y]
else
  start_x, start_y = [s_x, s_y]
  goal_x, goal_y = [t_x, t_y]
end

start_x = move_left(start_x, start_y)
goal_x = move_left(goal_x, goal_y)

diff_x = (goal_x - start_x).abs
diff_y = (goal_y - start_y).abs

if diff_x <= diff_y
  puts diff_y
  exit
end

puts diff_y + (diff_x - diff_y) / 2
