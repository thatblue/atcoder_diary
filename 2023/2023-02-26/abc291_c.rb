require 'set'

n = gets.chomp.to_i

s = gets.chomp.chars

MOVE_X = { 'R' => 1, 'L' => -1, 'U' => 0, 'D' => 0 }
MOVE_Y = { 'R' => 0, 'L' => 0, 'U' => 1, 'D' => -1 }

current_x = 0
current_y = 0
pos_history = Set.new([[0, 0]])

visited = false
n.times do |i|
  current_x += MOVE_X[s[i]]
  current_y += MOVE_Y[s[i]]

  visited = true if pos_history.include? [current_x, current_y]
  pos_history.add([current_x, current_y])
end

puts visited ? 'Yes' : 'No'
