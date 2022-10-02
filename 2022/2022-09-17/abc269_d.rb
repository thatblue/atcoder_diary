class UnionFind
  def initialize(n)
    @root = Array.new(n + 1, &:itself)
    @size = Array.new(n + 1, 1)
    @tree_count = n
  end

  # 指定したノードの根を取得する(このとき、根が更新されていれば反映させる)
  def root(v)
    @root[v] == v ? v : @root[v] = root(@root[v])
  end

  # 指定した2つのノードが属するグループをマージする
  def merge(u, v)
    u_root = root(u)
    v_root = root(v)

    return if u_root == v_root

    @size[u_root] += @size[v_root]
    @root[v_root] = u_root
    @tree_count -= 1
  end

  # 指定したノードの属するグループのサイズを取得する
  def size(v)
    @size[root(v)]
  end

  # 指定した2つのノードが同じグループに属するかを取得する
  def same_tree?(u, v)
    root(u) == root(v)
  end

  def tree_count
    @tree_count
  end
end

def merge_if_black(current_id, x_next, y_next)
  next_node_id = NODE_IDS.key([x_next, y_next])
  UF_TREE.merge(current_id, next_node_id) unless next_node_id.nil?
end

n = gets.chomp.to_i
UF_TREE = UnionFind.new(n)
NODE_IDS = Hash.new

1.upto(n) do |id|
  x_i, y_i = gets.chomp.split.map(&:to_i)
  NODE_IDS[id] = [x_i, y_i]

  merge_if_black(id, x_i - 1, y_i - 1)
  merge_if_black(id, x_i - 1, y_i)
  merge_if_black(id, x_i, y_i - 1)
  merge_if_black(id, x_i, y_i + 1)
  merge_if_black(id, x_i + 1, y_i)
  merge_if_black(id, x_i + 1, y_i + 1)
end

p UF_TREE.tree_count
