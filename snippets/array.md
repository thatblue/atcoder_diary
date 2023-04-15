# 配列操作

## 0埋めしたN*Nの二次元配列を作る
```ruby
array = Array.new(n) { Array.new(n, 0) }
```

うっかり`Array.new(n, Array.new(n, 0))`とすると[参照が一緒になってしまうため、中身が全部同じ値になる](https://docs.ruby-lang.org/ja/2.7.0/method/Array/s/new.html#:~:text=%E8%A6%81%E7%B4%A0%E6%AF%8E%E3%81%AB%20val%20%E3%81%8C%E8%A4%87%E8%A3%BD%E3%81%95%E3%82%8C%E3%82%8B%E3%82%8F%E3%81%91%E3%81%A7%E3%81%AF%E3%81%AA%E3%81%84%E3%81%93%E3%81%A8%E3%81%AB%E6%B3%A8%E6%84%8F%E3%81%97%E3%81%A6%E3%81%8F%E3%81%A0%E3%81%95%E3%81%84%E3%80%82%E5%85%A8%E8%A6%81%E7%B4%A0%E3%81%8C%E5%90%8C%E3%81%98%E3%82%AA%E3%83%96%E3%82%B8%E3%82%A7%E3%82%AF%E3%83%88%20val%20%E3%82%92%E5%8F%82%E7%85%A7%E3%81%97%E3%81%BE%E3%81%99%E3%80%82)ので注意。

## 長さnの配列をインデックスの値で初期化する
```ruby
array = Array.new(n + 1) { _1}
```

## 配列のインデックスと値をループ中に両方とも使いたい
```ruby
array.each_with_index do |value, index|
  # do something
end
```

## 配列の要素を数え上げてHashにまとめたい
```ruby
p ["a", "b", "c", "b"].tally
# {"a"=>1, "b"=>2, "c"=>1}
```

## シンプルな二分探索
### インデックスが欲しい場合
```ruby
[1, 2, 3, 4, 5].bsearch_index { |x| x > 3 }
# 条件を満たす最初の値である4のインデックスが取得できるので、戻り値は3
```

### 値だけで大丈夫な場合
```ruby
[1, 2, 3, 4, 5].bsearch { |x| x > 3 }
# 条件を満たす最初の値である4が戻り値となる
```

## 二次元配列の回転・反転

### 実際に回転させた配列を作る
B問題くらいまでなら回転させてしまった配列を個別に持っておくのがよさそう。

```ruby
# 時計周りに90度回転
puts [[1, 2, 3], [4, 5, 6], [7, 8, 9]].transpose.map(&:reverse)

# 180度回転
puts [[1, 2, 3], [4, 5, 6], [7, 8, 9]].reverse.map(&:reverse)

# 時計回りに270度(=反時計周りに90度)回転
puts [[1, 2, 3], [4, 5, 6], [7, 8, 9]].transpose.reverse

# 上下反転
puts [[1, 2, 3], [4, 5, 6], [7, 8, 9]].reverse

# 左右反転
puts [[1, 2, 3], [4, 5, 6], [7, 8, 9]].map(&:reverse)
```

### 回転させた座標を都度求める

```ruby
# 時計周りに90度回転
puts matrix[matrix.length - 1 - j][i]

# 180度回転
puts matrix[matrix.length - 1 - i][matrix.length - 1 - j]

# 時計回りに270度(=反時計周りに90度)回転
puts matrix[j][matrix.length - 1 - i]

# 上下反転
puts matrix[matrix.length - 1 - i][j]

# 左右反転(たぶん)
puts matrix[i][matrix.length - 1 - j]
```
