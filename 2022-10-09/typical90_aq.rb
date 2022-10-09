require 'set'

TOP = 0
RIGHT = 1
BOTTOM = 2
LEFT = 3

X_INCREMENTS = [1, 0, -1, 0]
Y_INCREMENTS = [0, 1, 0, -1]

H, W = gets.chomp.split.map(&:to_i)
r_s, c_s = gets.chomp.split.map {|v| v.to_i - 1 }
r_t, c_t = gets.chomp.split.map {|v| v.to_i - 1 }

MAP = []

H.times do
  MAP << gets.chomp.chars
end

VISITED_MAP = Array.new(H) { Array.new(W) { Array.new(4, Float::INFINITY) } }

def visitable(x, y)
  if x < 0 || H - 1 < x || y < 0 || W - 1 < y
    return false
  end

  if MAP[x][y] == "#"
    return false
  end

  true
end

VISITED_MAP[r_s][c_s][TOP] = 0
VISITED_MAP[r_s][c_s][RIGHT] = 0
VISITED_MAP[r_s][c_s][BOTTOM] = 0
VISITED_MAP[r_s][c_s][LEFT] = 0
search_nodes = [[r_s, c_s, TOP], [r_s, c_s, RIGHT], [r_s, c_s, BOTTOM], [r_s, c_s, LEFT]]

until search_nodes.empty?
  current_node = search_nodes.shift
  x, y, direction = current_node

  4.times do |next_direction|
    next_x = x + X_INCREMENTS[next_direction]
    next_y = y + Y_INCREMENTS[next_direction]
    cost = VISITED_MAP[x][y][direction] + (direction == next_direction ? 0 : 1)
    if visitable(next_x, next_y) && VISITED_MAP[next_x][next_y][next_direction] > cost
      VISITED_MAP[next_x][next_y][next_direction] = cost
      if direction == next_direction
        search_nodes.push([next_x, next_y, next_direction])
      else
        search_nodes.unshift([next_x, next_y, next_direction])
      end
    end
  end
end

p VISITED_MAP[r_t][c_t].min
