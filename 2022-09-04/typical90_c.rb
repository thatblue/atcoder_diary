require 'set'

N = gets.chomp.to_i

PATHS = Array.new(N + 1) { Array.new }

(N-1).times do
  from, to = gets.chomp.split.map(&:to_i)
  PATHS[from] << to
  PATHS[to] << from
end

def bfs(start_node)
  current_depth_nodes = Set.new([start_node])
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
    depth += 1
  end

  [depth, current_depth_nodes]
end

*, max_depth_nodes = bfs(1)

tree_diameter, * = bfs(max_depth_nodes.to_a[0])

p tree_diameter + 1
