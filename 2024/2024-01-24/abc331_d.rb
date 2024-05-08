# cf. https://atcoder.jp/contests/abc331/submissions/48140515
N, Q = gets.chomp.split.map(&:to_i)

tile = []
N.times do
  tile << gets.chomp.chars.map { |v| v == 'B' }
end

# @cumu_sum[i][j]に、その位置を右下としたときにタイル左上からの黒マスの個数が入る
# i = 0の行とj = 0の列は番兵とするので1つずらす
@cumu_sum = Array.new(N + 1) { Array.new(N + 1, 0) }
(1..N).each do |i|
  black_sum = 0
  (1..N).each do |j|
    # 対応するマスが黒
    black_sum += 1 if tile[i - 1][j - 1]
    # 上の段までの累計を可算する
    @cumu_sum[i][j] = @cumu_sum[i - 1][j] + black_sum
  end
end

def black_sum(i, j)
  # 終了位置が範囲外の場合
  return 0 if i.negative? || j.negative?

  sum = 0
  # タイルがすべて埋まる範囲
  sum += @cumu_sum[-1][-1] * (i / N) * (j / N)
  # 真下にはみ出す分
  sum += @cumu_sum[i % N + 1][-1] * (j / N)
  # 右にはみ出す分
  sum += @cumu_sum[-1][j % N + 1] * (i / N)
  # 右下にはみ出す分
  sum += @cumu_sum[i % N + 1][j % N + 1]

  sum
end

Q.times do
  start_i, start_j, end_i, end_j = gets.chomp.split.map(&:to_i)

  all = black_sum(end_i, end_j)
  left_top = black_sum(start_i - 1, start_j - 1)
  top = black_sum(start_i - 1, end_j)
  left = black_sum(end_i, start_j - 1)

  puts all - (top + left - left_top)
end
