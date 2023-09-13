n = gets.chomp.to_i

tree = Array.new(n + 1) { {} }
path_count = Hash.new(0)

(n-1).times do
  u, v = gets.chomp.split.map(&:to_i)
  tree[u][v] = true
  tree[v][u] = true
  path_count[u] += 1
  path_count[v] += 1
end

visited = {}
restored_tree = tree
leaves = path_count.to_a.filter_map { |v| v[0] if v[1] == 1 }

tree_sizes = []
until leaves.empty?
  next_leaves = {}
  leaves.each do |node|
    next if visited[node]  # 訪問済みのノードはスキップ
    visited[node] = true
    center_node = restored_tree[node].keys.first
    visited[center_node] = true

    tree_size = 0
    restored_tree[center_node].keys.each do |current_leaf|
      visited[current_leaf] = true
      tree_size += 1

      next if restored_tree[current_leaf].count == 1
      restored_tree[current_leaf].keys.each do |drop_leaf|
        # center以外に繋がっているものは全て後から繋いだものと見なし落とす
        restored_tree[drop_leaf].delete(current_leaf)
        path_count[drop_leaf] -= 1

        # 落とした結果繋がっているノードが1になったら新しく探索対象とする
        next_leaves[drop_leaf] = true if path_count[drop_leaf] == 1
      end

      # 念のため今のノードも落としておく
      restored_tree[current_leaf] = { center_node => true }
      path_count[current_leaf] = 1
    end

    tree_sizes << tree_size
  end

  leaves = next_leaves.keys
end

puts tree_sizes.sort.join ' '
