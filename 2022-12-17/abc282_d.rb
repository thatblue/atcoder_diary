# 解説の写経

n, m = gets.chomp.split.map(&:to_i)

$paths = Array.new(n + 1) { Array.new }
m.times do
  from, to = gets.chomp.split.map(&:to_i)
  $paths[from] << to
  $paths[to] << from
end

$color = Array.new(n + 1)

def dfs(current_node, prev_node, current_color)
  result = [0, 0]

  $color[current_node] = current_color
  result[0] += 1 if current_color == 1
  result[1] += 1 unless current_color == 1

  $paths[current_node].each do |next_node|
    # 既に訪問済みのノードで、別の色で塗ってあれば検証不要なのでスキップ
    next if next_node == prev_node || $color[next_node] == -current_color

    # 隣り合うはずのノードなのに同じ色で塗られている場合は2部グラフではない
    return [-1, -1] if $color[next_node] == current_color

    next_result = dfs(next_node, current_node, -current_color)
    # 次のノード(以降)で2部グラフではないことが検出された
    return [-1, -1] if next_result[0] == -1

    result[0] += next_result[0]
    result[1] += next_result[1]
  end

  result
end

# ありうる頂点の全組み合わせから実在するMを減らしておく
answer = n * (n - 1) / 2 - m
1.upto(n) do |i|
  if $color[i].nil?
    # 未走査であればこの点を起点としてグラフを走査する
    result = dfs(i, -1, 1)
    if result[0] == -1
      # 1つでも2部グラフではない連結成分があれば条件が成立しないので終了
      puts 0
      exit
    end

    # 同じ連結成分内の同じ色どうしの組み合わせを減らす
    # 別の連結成分に繋ぐ分にはどう繋いでも2部グラフになる(らしい)
    answer -= result[0] * (result[0] - 1) / 2
    answer -= result[1] * (result[1] - 1) / 2
  end
end

# 最後まで残った組み合わせが答えになる
puts answer