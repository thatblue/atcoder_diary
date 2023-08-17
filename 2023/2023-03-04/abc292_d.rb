# cf. https://atcoder.jp/contests/abc292/submissions/39417477

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
union_find = UnionFind.new(n + 1)

path_froms = []

m.times do
  from, to = gets.chomp.split.map(&:to_i)
  union_find.merge(from, to)

  path_froms << from
end

if n != m
  # そもそもnとmの数が異なっていれば検証をするまでもなく条件を満たさない
  puts 'No'
  exit
end

path_counts = Array.new(n + 1, 0)
path_froms.each do |from|
  path_counts[union_find.root(from)] += 1
end

1.upto(n) do |i|
  root = union_find.root(i)
  if union_find.size(root) != path_counts[root]
    puts 'No'
    exit
  end
end

puts 'Yes'
