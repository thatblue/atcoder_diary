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

n, d = gets.chomp.split.map(&:to_i)

d_pow2 = d ** 2
uf_tree = UnionFind.new(n)
persons = []
n.times do |i|
  no = i + 1
  x_i, y_i = gets.chomp.split.map(&:to_i)

  persons.each_with_index do |person, index|
    p_no = index + 1
    uf_tree.merge(p_no, no) if (x_i - person[:x]) ** 2 + (y_i - person[:y]) ** 2 <= d_pow2
  end
  persons << { x: x_i, y: y_i }
end

(1..n).each do |i|
  puts uf_tree.same_tree?(1, i) ? 'Yes' : 'No'
end
