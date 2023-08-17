n = gets.chomp.to_i
cumu_sum = 0
array = gets.chomp.split.map { |v|
  cumu_sum += v.to_i
  cumu_sum
}

## 配列の先頭に0を入れておく
array.unshift(0)

1.upto(n) do |k| # 区間の数 1～n
  ans = 0
  0.upto(n-k) do |i| # 検証する区間の左端(引き算をしたい)インデックス
    # current = array[i+1..i+k].sum # k回ぶんの計算コスト
    ans = [ans, array[i + k] - array[i]].max
  end
  puts ans
end
