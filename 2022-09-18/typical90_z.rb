require 'set'

N = gets.chomp.to_i

PATHS = Array.new(N + 1) { [] }

(N-1).times do
  from, to = gets.chomp.split.map(&:to_i)
  PATHS[from] << to
  PATHS[to] << from
end

def bfs(start_node)
  current_depth_nodes = Set.new([start_node])
  nodes = [current_depth_nodes]
  visited = Set.new([start_node])
  depth = 0
  while visited.length < N
    next_depth_nodes = Set.new
    current_depth_nodes.each do |node|
      candidates = PATHS[node]
      candidates.each do |candidate|
        if visited.include?(candidate)
          next
        end

        next_depth_nodes.add(candidate)
      end
    end

    visited.merge(next_depth_nodes)
    current_depth_nodes = next_depth_nodes
    nodes << current_depth_nodes
    depth += 1
  end

  [depth, current_depth_nodes, nodes]
end

*, nodes = bfs(1)

independent_nodes = Set.new

return_nodes = []
nodes.each_with_index do |current_depth_nodes, index|
  if index.odd?
    next
  end

  independent_nodes = independent_nodes.merge(current_depth_nodes)

  if independent_nodes.count >= N / 2
    return_nodes = independent_nodes.to_a[0..(N / 2 - 1)]
    break
  end
end

puts return_nodes.join(" ")
