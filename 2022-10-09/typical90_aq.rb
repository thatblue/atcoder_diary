require 'set'

TOP = 0
RIGHT = 1
BOTTOM = 2
LEFT = 3

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

def visit(x, y)
  unless visitable(x, y)
    return false
  end

  if VISITED_MAP[x][y][TOP] == Float::INFINITY
    from_top_cost = visitable(x + 1, y) ? VISITED_MAP[x + 1][y][TOP] : Float::INFINITY
    from_right_cost = visitable(x, y - 1) ? VISITED_MAP[x][y - 1][RIGHT] : Float::INFINITY
    from_bottom_cost = visitable(x - 1, y) ? VISITED_MAP[x - 1][y][BOTTOM] : Float::INFINITY
    from_left_cost = visitable(x, y + 1) ? VISITED_MAP[x][y + 1][LEFT] : Float::INFINITY
    min_cost = [from_top_cost, from_right_cost, from_bottom_cost, from_left_cost].min

    VISITED_MAP[x][y][TOP] = [from_top_cost, min_cost + 1].min
    VISITED_MAP[x][y][RIGHT] = [from_right_cost, min_cost + 1].min
    VISITED_MAP[x][y][BOTTOM] = [from_bottom_cost, min_cost + 1].min
    VISITED_MAP[x][y][LEFT] = [from_left_cost, min_cost + 1].min
    return true
  end

  false
end

VISITED_MAP[r_s][c_s][TOP] = 0
VISITED_MAP[r_s][c_s][RIGHT] = 0
VISITED_MAP[r_s][c_s][BOTTOM] = 0
VISITED_MAP[r_s][c_s][LEFT] = 0
current_nodes = Set.new([[r_s, c_s]])

while current_nodes.length > 0
  next_nodes = Set.new
  current_nodes.each do |current_node|
    x, y = current_node
    next_nodes.add([x - 1, y]) if visit(x - 1, y)
    next_nodes.add([x, y - 1]) if visit(x, y - 1)
    next_nodes.add([x, y + 1]) if visit(x, y + 1)
    next_nodes.add([x + 1, y]) if visit(x + 1, y)
  end

  if next_nodes.include?([r_t, c_t])
    break
  end

  current_nodes = next_nodes
end

p VISITED_MAP[r_t][c_t].min
