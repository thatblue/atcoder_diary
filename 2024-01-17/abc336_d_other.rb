# 解説(別解)の写経
# https://atcoder.jp/contests/abc336/editorial/9078

n = gets.chomp.to_i
array = [0] + gets.chomp.split.map(&:to_i)

pyramid_left = Array.new(n + 2, 0)
pyramid_right = Array.new(n + 2, 0)

1.upto(n) do |i|
  # ピラミッドの左側を構成できる最大値はその位置の値か左隣+1のどちらか小さい方
  pyramid_left[i] = [array[i], pyramid_left[i - 1] + 1].min
end

n.downto(1) do |i|
  # ピラミッドの右側を構成できる最大値はその位置の値か右隣+1のどちらか小さい方
  pyramid_right[i] = [array[i], pyramid_right[i + 1] + 1].min
end

ans = 0
1.upto(n) do |i|
  ans = [ans, [pyramid_left[i], pyramid_right[i]].min].max
end

puts ans
