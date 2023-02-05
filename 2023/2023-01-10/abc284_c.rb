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
    # グループ数はマージに成功するたびに1ずつ減る
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

  # ノード群のグループ総数を取得する
  def tree_count
    @tree_count
  end
end

n, m = gets.chomp.split.map(&:to_i)

graph = UnionFind.new(n)
m.times do
  from, to = gets.chomp.split.map(&:to_i)

  graph.merge(from, to)
end

puts graph.tree_count
