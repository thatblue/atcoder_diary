class UnionFind
  def initialize(n)
    @roots = [0..n]
    @sizes = Array.new(n + 1, 1)
    @group_count = n
  end

  def union(u, v)
    return if root(u) == root(v)

    @roots[root(v)] = root(u)
    @group_count -= 1
  end

  def root(u)
    return u if root?(u)

    new_root = root(@roots[u])
    @roots[u] = new_root
    new_root
  end

  def root?(u)
    @roots[u] == u
  end

  attr_reader :group_count
end

n, m = gets.chomp.split.map(&:to_i)

uf = UnionFind.new(n)

m.times do
  a, b = gets.chomp.split.map(&:to_i)
  uf.union(a, b)
end

puts uf.group_count - 1
