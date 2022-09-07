require "set"

class UnionFind
  def initialize(n)
    @parent = Array.new(n + 1) { _1}
    @size = Array.new(n + 1, 1)
  end

  def root(v)
    @parent[v] == v ? v : @parent[v] = root(@parent[v])
  end

  def merge(u, v)
    u = root(u)
    v = root(v)

    return false if u == v

    @size[u] += @size[v]
    @parent[v] = u
  end

  def size(u)
    @size[u]
  end
end

def pos_to_value(row, col)
  (row - 1) * W + col
end

H, W = gets.chomp.split.map(&:to_i)

q = gets.chomp.to_i

uf_tree = UnionFind.new(H * W)
red_cells = Set.new

q.times do
  query = gets.chomp.split.map(&:to_i)

  if query[0] == 1
    row, col = query[1..2]
    red_cells.add([row, col])

    uf_tree.merge(pos_to_value(row - 1, col), pos_to_value(row, col)) if row > 0 && red_cells.include?([row - 1, col])
    uf_tree.merge(pos_to_value(row, col - 1), pos_to_value(row, col)) if row > 0 && red_cells.include?([row, col - 1])
    uf_tree.merge(pos_to_value(row + 1, col), pos_to_value(row, col)) if row > 0 && red_cells.include?([row + 1, col])
    uf_tree.merge(pos_to_value(row, col + 1), pos_to_value(row, col)) if row > 0 && red_cells.include?([row, col + 1])
  elsif query[0] == 2
    a_row, a_col, b_row, b_col = query[1..4]

    unless red_cells.include?([a_row, a_col]) && red_cells.include?([b_row, b_col])
      puts "No"
      next
    end

    puts uf_tree.root(pos_to_value(a_row, a_col)) == uf_tree.root(pos_to_value(b_row, b_col)) ? "Yes" : "No"
  end
end
