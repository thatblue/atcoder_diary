$direction_x = [0, 1, 0, -1]
$direction_y = [1, 0, -1, 0]
H, W = gets.chomp.split.map(&:to_i)

$map = []
H.times do
  $map << gets.chomp.chars.map { |value| value == '.' ? true : false }
end

$visited = Array.new(H) { Array.new(W, false) }

def dfs(start_x, start_y, current_x, current_y)
  if start_x == current_x && start_y == current_y && $visited[current_x][current_y]
    # スタート位置に戻ったので探索終了
    return 0
  end

  $visited[current_x][current_y] = true

  current_max = -10000
  4.times do |direction|
    next_x = current_x + $direction_x[direction]
    next_y = current_y + $direction_y[direction]
    # 範囲外 or 山 のため遷移できない
    next if next_x < 0 || next_y < 0 || next_x >= H || next_y >= W || !$map[next_x][next_y]
    # 訪問済みなので遷移不可
    next if (start_x != next_x || start_y != next_y) && $visited[next_x][next_y]

    prev_max = dfs(start_x, start_y, next_x, next_y)
    current_max = [current_max, prev_max + 1].max
  end

  $visited[current_x][current_y] = false
  current_max
end

loop_max = -1
H.times do |i|
  W.times do |j|
    next unless $map[i][j]
    loop_max = [loop_max, dfs(i, j, i, j)].max
  end
end

puts loop_max > 2 ? loop_max : -1
