# 配列操作

## 0埋めしたN*Nの二次元配列を作る
```ruby
array = Array.new(n) {Array.new(n, 0)}
```

うっかり`Array.new(n, Array.new(n, 0))`とすると[参照が一緒になってしまうため、中身が全部同じ値になる](https://docs.ruby-lang.org/ja/2.7.0/method/Array/s/new.html#:~:text=%E8%A6%81%E7%B4%A0%E6%AF%8E%E3%81%AB%20val%20%E3%81%8C%E8%A4%87%E8%A3%BD%E3%81%95%E3%82%8C%E3%82%8B%E3%82%8F%E3%81%91%E3%81%A7%E3%81%AF%E3%81%AA%E3%81%84%E3%81%93%E3%81%A8%E3%81%AB%E6%B3%A8%E6%84%8F%E3%81%97%E3%81%A6%E3%81%8F%E3%81%A0%E3%81%95%E3%81%84%E3%80%82%E5%85%A8%E8%A6%81%E7%B4%A0%E3%81%8C%E5%90%8C%E3%81%98%E3%82%AA%E3%83%96%E3%82%B8%E3%82%A7%E3%82%AF%E3%83%88%20val%20%E3%82%92%E5%8F%82%E7%85%A7%E3%81%97%E3%81%BE%E3%81%99%E3%80%82)ので注意。

## 配列のインデックスと値をループ中に両方とも使いたい
```ruby
array.each_with_index do |value, index|
  # do something
end
```