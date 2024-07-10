n = gets.chomp.to_i
s = gets.chomp + '..'
t = gets.chomp + '..'

depth = { s => 0 }
queue = [s]
until queue.empty?
  node = queue.shift
  blank_index = node.index('.')
  (0..n).each do |move_index|
    # 動かせない(指定された範囲に空きマスがある)ならスキップ
    next if node[move_index, 2].include?('.')

    replace_str = node[move_index, 2]
    next_node = node.dup
    next_node[blank_index, 2] = replace_str
    next_node[move_index, 2] = '..'

    # 探索済みのノードに戻るのでスキップ
    next if depth[next_node]

    depth[next_node] = depth[node] + 1
    queue << next_node
  end
end

puts depth[t] || -1
