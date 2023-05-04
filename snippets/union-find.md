# UnionFind

グループ分けを木構造で管理するデータ構造のこと。

実装は以下のとおり。nはデータ構造全体の大きさを表し、グラフ上の座標などノードの値を自然数で表せない場合は何らかの方法で変換する必要がある。

```ruby
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
```
