# 解説の写経

RED = 1
BLUE = -1

n, m = gets.chomp.split.map(&:to_i)

$paths = Array.new(n + 1) { Array.new }
m.times do
  from, to = gets.chomp.split.map(&:to_i)
  $paths[from] << to
  $paths[to] << from
end

$color = Array.new(n + 1)

def dfs(current_node, prev_node, current_color)
  result = { RED => 0, BLUE => 0}

  $color[current_node] = current_color
  result[current_color] += 1

  $paths[current_node].each do |next_node|
    # 既に訪問済みのノードで、別の色で塗ってあれば検証不要なのでスキップ
    next if next_node == prev_node || $color[next_node] == -current_color

    # 隣り合うはずのノードなのに同じ色で塗られている場合は2部グラフではない
    return { RED => -1, BLUE => -1 } if $color[next_node] == current_color

    next_result = dfs(next_node, current_node, -current_color)
    # 次のノード(以降)で2部グラフではないことが検出された
    return { RED => -1, BLUE => -1 } if next_result[RED] == -1

    result.merge!(next_result) {|_, current_value, next_value| current_value + next_value }
  end

  result
end

# ありうる頂点の全組み合わせから実在するMを減らしておく
answer = n * (n - 1) / 2 - m
1.upto(n) do |i|
  # 走査済みであればスキップ
  next unless $color[i].nil?

  # 未走査であればこの点を起点としてグラフを走査する
  result = dfs(i, -1, RED)
  if result[RED] == -1
    # 1つでも2部グラフではない連結成分があれば条件が成立しないので終了
    puts 0
    exit
  end

  # 同じ連結成分内の同じ色どうしの組み合わせ分を減らす
  # 別の連結成分に繋ぐ分にはどう繋いでも2部グラフになる
  result.each {|_, value| answer -= value * (value  - 1) / 2 }
end

# 最後まで残った組み合わせが答えになる
puts answer
