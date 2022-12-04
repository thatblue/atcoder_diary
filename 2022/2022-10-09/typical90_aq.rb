# cf. https://atcoder.jp/contests/typical90/submissions/33480584

require 'set'

TOP = 0
RIGHT = 1
BOTTOM = 2
LEFT = 3

INCREMENTS = [[1, 0], [0, 1], [-1, 0], [0, -1]]

H, W = gets.chomp.split.map(&:to_i)
r_s, c_s = gets.chomp.split.map {|v| v.to_i - 1 }
r_t, c_t = gets.chomp.split.map {|v| v.to_i - 1 }

MAP = []

H.times do
  MAP << gets.chomp.chars.map {|v| v == "." ? true : false }
end

VISITED_MAP = Array.new(H) { Array.new(W, Float::INFINITY) }
VISITED_MAP[r_s][c_s] = 0

search_nodes = [[r_s, c_s]]
until search_nodes.empty?
  x, y = search_nodes.shift

  INCREMENTS.each do |incr_x, incr_y|
    new_x, new_y = x + incr_x, y + incr_y

    cost = VISITED_MAP[x][y] + ( x == r_s && y == c_s ? 0 : 1)

    while new_x >= 0 && new_x < H && new_y >= 0 && new_y < W && MAP[new_x][new_y] && VISITED_MAP[new_x][new_y] >= cost
      VISITED_MAP[new_x][new_y] = cost
      search_nodes << [new_x, new_y]
      new_x += incr_x
      new_y += incr_y
    end

  end
end

p VISITED_MAP[r_t][c_t]
