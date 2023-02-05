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

def pos_to_id(r, c)
  W * (r - 1) + c
end

H, W = gets.chomp.split.map(&:to_i)
q = gets.chomp.to_i

map = UnionFind.new(H * W)
painted = Hash.new(false)
ans = []
q.times do
  query = gets.chomp.split.map(&:to_i)

  if query[0] == 1
    _, r, c = query
    pos_id = pos_to_id(r, c)
    painted[pos_id] = true

    map.merge(pos_id, pos_to_id(r - 1, c)) if r > 1 && painted[pos_to_id(r - 1, c)]
    map.merge(pos_id, pos_to_id(r, c - 1)) if c > 1 && painted[pos_to_id(r, c - 1)]
    map.merge(pos_id, pos_to_id(r + 1, c)) if r < H && painted[pos_to_id(r + 1, c)]
    map.merge(pos_id, pos_to_id(r, c + 1)) if c < W && painted[pos_to_id(r, c + 1)]
  else
    _, r_a, c_a, r_b, c_b = query
    if painted[pos_to_id(r_a, c_a)] && map.same_tree?(pos_to_id(r_a, c_a), pos_to_id(r_b, c_b))
      ans << 'Yes'
    else
      ans << 'No'
    end
  end
end

puts ans
