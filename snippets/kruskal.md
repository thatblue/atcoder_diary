# クラスカル法

重みつきグラフの最小全域木(無向グラフの辺を削って木にしたとき、重みの総和が最小になるグラフ)を求めるときに使う。

- 優先順位付きキューで辺の優先順位を管理する
- ハッシュでコストごとの辺を管理する
- UnionFindで選んだ辺を繋いでよいか(ループや多重辺が発生しないかどうか)を管理する

(参考: ABC328-Eの解法勘違いコード、「最小全域木のコストをKで割ったものを求めよ」が題意であればこれが正解)
```ruby
require "ac-library-rb/priority_queue"
require "ac-library-rb/dsu"

n, m, k = gets.chomp.split.map(&:to_i)

weights = AcLibraryRb::PriorityQueue.new() { |a, b| a < b }
paths = Hash.new {|hash, key| hash[key] = []}

m.times do
  u, v, w = gets.chomp.split.map(&:to_i)

  weights.push(w) unless paths.include?(w)
  paths[w] << [u, v]
end

ans = 0
tree = AcLibraryRb::DSU.new(n + 1)
until weights.empty?
  min_weight = weights.pop

  paths[min_weight].each do |path|
    next if tree.same?(path[0], path[1])

    tree.merge(path[0], path[1])
    ans += min_weight
  end
end

puts ans % k
```
