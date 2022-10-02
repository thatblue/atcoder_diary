require "set"

class UnionFind
  def initialize(n)
    @root = Array.new(n + 1, &:itself)
    @size = Array.new(n + 1, 1)
  end

  def root(v)
    @root[v] == v ? v : @root[v] = root(@root[v])
  end

  def merge(u, v)
    u_root = root(u)
    v_root = root(v)

    return if u_root == v_root

    @size[u_root] += @size[v_root]
    @root[v_root] = u_root
  end

  def size(v)
    @size[root(v)]
  end

  def same_tree?(u, v)
    root(u) == root(v)
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

    puts uf_tree.same_tree?(pos_to_value(a_row, a_col), pos_to_value(b_row, b_col)) ? "Yes" : "No"
  end
end
