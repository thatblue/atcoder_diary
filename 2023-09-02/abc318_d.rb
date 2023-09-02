n = gets.chomp.to_i

$graph = Array.new(n+1) { Array.new(n+1, 0) }

1.upto(n-1) do |i|
  gets.chomp.split.map(&:to_i).each_with_index do |v, index|
    j = index + i + 1
    $graph[i][j] = v
    $graph[j][i] = v
  end
end

nodes = (1..n).to_a

$memo = {}
def dfs(current_nodes, bit)
  return 0 if current_nodes.empty?

  return $memo[bit] unless $memo[bit].nil?

  pick_node_count = current_nodes.count.odd? ? 1 : 2
  max_weight = 0
  current_nodes.combination(pick_node_count).to_a.each do |picked_nodes|
    picked_weight = 0
    if pick_node_count == 2
      a, b = picked_nodes
      picked_weight = $graph[a][b]
    end
    next_node
    picked_nodes.each do |node|

    end
    current_weight = picked_weight + dfs(current_nodes - picked_nodes)

    max_weight = [current_weight, max_weight].max
  end

  $memo[bit] = max_weight
end

puts dfs((1..n).to_a, 2**n-1)
