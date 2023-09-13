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

tree_sizes = []
path_count.to_a.sort_by { |v| v[1] }.each do |node, value|
  next if visited[node]

  visited[node] = true
  tree_size = 0
  center_node = restored_tree[node].keys.first
  visited[center_node] = true
  restored_tree[center_node].keys.each do |peripheral|
    visited[peripheral] = true
    tree_size += 1

    next if restored_tree[peripheral].count == 1

    restored_tree[peripheral].keys.each do |cut_edge|
      restored_tree[cut_edge].delete(peripheral)
    end
  end

  tree_sizes << tree_size
end

puts tree_sizes.sort.join ' '
