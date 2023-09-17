# 優先順位付きキュー(ヒープキュー)

SortedSet(3.0でdeprecatedになった)的なものを使いたくなるときに使う。
一応ジャッジサーバーにはsorted_setのgemも入っているけど、こっちが上位互換と思ってよさそう？

`ac-library-rb` に含まれているのでそれを使うとよい。
デフォルトでは値が大きい方が優先順位が高いことに注意。
https://github.com/universato/ac-library-rb/blob/main/document_ja/priority_queue.md

```ruby
require "ac-library-rb/priority_queue"

pq = AcLibraryRb::PriorityQueue.new([1, 2, 3])

# 数値がランクを示している場合はこのように書く
pq = AcLibraryRb::PriorityQueue.new([1, 2, 3]) { |a, b| a < b }

pq.push(123)
first = pq.pop # 破壊的処理
first = po.get
```
