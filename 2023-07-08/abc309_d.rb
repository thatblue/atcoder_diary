n_1, n_2, m = gets.chomp.split.map(&:to_i)

$paths = Array.new(n_1 + n_2 + 1) { Array.new }

m.times do
  a, b = gets.chomp.split.map(&:to_i)

  $paths[a] << b
  $paths[b] << a
end

def bfs(start_node)
  depth = 0
  current_nodes = [start_node]
  visited = Hash.new(false)
  visited[start_node] = true

  while true
    next_nodes = Hash.new
    current_nodes.each do |current_node|
      $paths[current_node].each do |candidate|
        next if visited[candidate]

        next_nodes[candidate] = true
        visited[candidate] = true
      end
    end
    break if next_nodes.empty?

    current_nodes = next_nodes.keys
    depth += 1
  end

  depth
end

puts bfs(1) + bfs(n_1 + n_2) + 1
