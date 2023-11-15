# UnionFind

グループ分けを木構造で管理するデータ構造のこと。`ac-library-rb` に `dsu` という名前で入っているのでそれを使うとよい。

https://github.com/universato/ac-library-rb/blob/main/document_ja/dsu.md

```ruby
require "ac-library-rb/dsu"

# 0-indexなので、nまでのIDが欲しい場合はn + 1個宣言して0を使わない運用とする。
uf_tree = AcLibraryRb::DSU.new(n + 1)

uf_tree.groups # => mergeされているグループのリストを取得する

uf_tree.same?(a, b) # => aとbのノードが連結であるかを取得する

uf_tree.merge(a, b) # => aとbのノードを連結する

uf_tree.size(a) # => aが属するグループの要素数を取得する

uf_tree.groups.size # => グラフ全体のグループの個数を取得する
```
