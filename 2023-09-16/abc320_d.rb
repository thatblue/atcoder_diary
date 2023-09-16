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

$diffs = Array.new(n+1) { {} }
uf_tree = UnionFind.new(n)

m.times do
  a, b, x, y = gets.chomp.split.map(&:to_i)
  $diffs[a][b] = [x, y]
  $diffs[b][a] = [-x, -y]
  uf_tree.merge(a, b)
end

$positions = {}
$positions[1] = [0, 0]
def search_positions(current_node)
  current_position = $positions[current_node]

  $diffs[current_node].each do |next_node, diff|
    next if $positions.include?(next_node)

    $positions[next_node] = [current_position[0] + diff[0], current_position[1] + diff[1]]
    search_positions(next_node)
  end
end

search_positions(1)

(1..n).each do |i|
  # 1からたどれないノードは座標を定義できない
  unless uf_tree.same_tree?(1, i)
    puts 'undecidable'
    next
  end

  puts $positions[i].join ' '
end

