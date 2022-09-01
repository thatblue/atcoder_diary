require 'set'

n, m = gets.chomp.split.map(&:to_i)
a, b, c, d, e, f = gets.chomp.split.map(&:to_i)

traps = Set.new
m.times do
  traps << gets.chomp.split.map(&:to_i)
end

current_depth_position = [[0, 0]]

n.times do
  next_depth_positions = Array.new

  current_depth_position.each do |pos|
    next_depth_positions << [pos[0] + a, pos[1] + b] unless traps.include?([pos[0] + a, pos[1] + b])
    next_depth_positions << [pos[0] + c, pos[1] + d] unless traps.include?([pos[0] + c, pos[1] + d])
    next_depth_positions << [pos[0] + e, pos[1] + f] unless traps.include?([pos[0] + e, pos[1] + f])
  end

  current_depth_position = next_depth_positions
end

p current_depth_position.length
