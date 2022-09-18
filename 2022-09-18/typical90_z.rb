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
  return_nodes = Array.new(2) { Array.new }
  return_nodes[1] << start_node
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
    return_nodes[depth % 2].concat(current_depth_nodes.to_a)
    depth += 1
  end

  return_nodes
end

divided_nodes = bfs(1)

if divided_nodes[0].length >= divided_nodes[1].length
  return_nodes = divided_nodes[0].to_a
else
  return_nodes = divided_nodes[1].to_a
end

puts return_nodes[0..(N / 2 - 1)].join(" ")
