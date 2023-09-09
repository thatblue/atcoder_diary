class UnionFind
  def initialize(n)
    @root = [*0..n]
    @size = Array.new(n + 1, 1)
    @tree_count = n
  end

  # 指定したノードの根を取得する(このとき、根が更新されていれば反映させる)
  def root(v)
    root?(v) ? v : @root[v] = root(@root[v])
  end

  # 指定したノードが根であるかを取得する
  def root?(v)
    @root[v] == v
  end

  # 指定した2つのノードが属するグループをマージする
  def merge(u, v)
    return if same_tree?(u, v)

    u_root = root(u)
    v_root = root(v)

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

  # uf.tree_count でノード群のグループ総数を取得できる
  attr_reader :tree_count
end

n, m = gets.chomp.split.map(&:to_i)

uf_tree = UnionFind.new(n)
m.times do
  u_i, v_i = gets.chomp.split.map(&:to_i)
  uf_tree.merge(u_i, v_i)
end

k = gets.chomp.to_i
must_be_other_tree = {}
k.times do
  x_i, y_i = gets.chomp.split.map(&:to_i)
  root_of_x = uf_tree.root(x_i)
  root_of_y = uf_tree.root(y_i)
  must_be_other_tree[[root_of_x, root_of_y].sort] = true
end

q = gets.chomp.to_i
q.times do
  p_i, q_i = gets.chomp.split.map(&:to_i)
  root_of_p = uf_tree.root(p_i)
  root_of_q = uf_tree.root(q_i)

  puts must_be_other_tree[[root_of_p, root_of_q].sort].nil? ? 'Yes' : 'No'
end
