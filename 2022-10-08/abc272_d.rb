require 'set'
N, m = gets.chomp.split.map(&:to_i)

BOARD = Array.new(N + 1) { Array.new(N + 1, -1) }
BOARD[1][1] = 0

def visit(x, y, hop)
  if x < 1 || N < x || y < 1 || N < y
    return false
  end

  if BOARD[x][y] == -1
    BOARD[x][y] = hop
    return true
  end

  false
end

sqrt_of_m = Integer.sqrt(m)
is_square_number = (sqrt_of_m ** 2) == m

sqrt_pairs = []
unless is_square_number
  1.upto(sqrt_of_m) do |i|
    j = Integer.sqrt(m - i ** 2)
    if j ** 2 == m - i ** 2
      sqrt_pairs << [i, j]
    end
  end
end


current_nodes = Set.new([[1, 1]])
hop = 1
while current_nodes.length > 0
  next_nodes = Set.new

  current_nodes.each do |current_node|
    x, y = current_node
    if is_square_number
      next_nodes.add([x + sqrt_of_m, y]) if visit(x + sqrt_of_m, y, hop)
      next_nodes.add([x - sqrt_of_m, y]) if visit(x - sqrt_of_m, y, hop)
      next_nodes.add([x, y + sqrt_of_m]) if visit(x, y + sqrt_of_m, hop)
      next_nodes.add([x, y - sqrt_of_m]) if visit(x, y - sqrt_of_m, hop)
    else
      sqrt_pairs.each do |i, j|
        next_nodes.add([x + i, y + j]) if visit(x + i, y + j, hop)
        next_nodes.add([x - i, y + j]) if visit(x - i, y + j, hop)
        next_nodes.add([x - i, y - j]) if visit(x - i, y - j, hop)
        next_nodes.add([x + i, y - j]) if visit(x + i, y - j, hop)
      end
    end
  end

  current_nodes = next_nodes
  hop += 1
end

BOARD[1..].each do |row|
  puts row[1..].join(" ")
end
