n = gets.chomp.to_i

$paths = Array.new(n + 1) { Array.new }

(n - 1).times do
  from, to = gets.chomp.split.map(&:to_i)
  $paths[from] << to
  $paths[to] << from
end

def bfs(start_node)
  depth = 0
  current_nodes = [start_node]
  visited = Hash.new(false)
  visited[start_node] = true

  while true
    next_nodes = []
    current_nodes.each do |current_node|
      $paths[current_node].each do |candidate|
        next if visited[candidate]
        next_nodes << candidate unless visited[candidate]
        visited[candidate] = true
      end
    end

    break if next_nodes.empty?

    current_nodes = next_nodes
    depth += 1
  end

  [current_nodes, depth]
end

deepest_nodes, * = bfs(1)

first_edge = deepest_nodes[0]
*, max_depth = bfs(first_edge)

puts max_depth + 1
