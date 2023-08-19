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

n = gets.chomp.to_i

books_premises = Array.new(n + 1) { {} }

n.times do |i|
  book_no = i + 1
  book = gets.chomp.split.map(&:to_i)
  premises = book[1..]

  premises.each do |premise|
    books_premises[book_no][premise] = true
  end
end

order = []
current_readable = [1]
graph = books_premises

until current_readable.empty?
  next_readable = {}
  current_readable.each do |current_node|
    order << current_node
    graph[current_node].keys.each do |next_node|
      graph[current_node].delete(next_node)
      if graph[current_node].empty?
        next_readable[next_node] = true
      end
    end
  end

  current_readable = next_readable.keys
end

puts order[1..].reverse.join ' '
