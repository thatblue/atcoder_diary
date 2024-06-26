# ほぼ解説の写経
# cf. https://atcoder.jp/contests/abc359/editorial/10278

s_x, s_y = gets.chomp.split.map(&:to_i)
t_x, t_y = gets.chomp.split.map(&:to_i)

# (多分)話を簡単にするため、スタート/ゴールの位置をブロック左側に寄せる
s_x -= (s_y - s_x) % 2
t_x -= (t_y - t_x) % 2

# X方向とY方向それぞれの移動距離を求める
move_x = (t_x - s_x).abs
move_y = (t_y - s_y).abs

# 縦方向の移動は必ず関所を通る必要があるので
# それ以上のx方向の移動が必要な回数を求めて足す
puts move_y + [0, move_x - move_y].max / 2
