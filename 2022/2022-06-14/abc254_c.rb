# 参考: https://atcoder.jp/contests/abc254/submissions/32329066
# 解説: https://www.youtube.com/watch?v=81PhR_8l_F8&t=2160s
n, k = gets.chomp.split.map(&:to_i)
a = gets.chomp.split.map(&:to_i)

# k個おきのグループ単位でバブルソートが成立する(＝同一グループ内であれば必ずソート出来る)
# グループ単位でソートしたのをがっちゃんこしてソート出来てなければそれ以上ソートできない
(0...k).each do |initial|
  sub_array = []
  initial.step(n-1, k) do |i|
    # ↓sub_array = sub_array.push(a[i])
    sub_array << a[i]
  end
  sub_array.sort!
  sub_array.each_with_index do |item, i|
    a[initial + k * i] = item
  end
end
puts a == a.sort ? "Yes" : "No"