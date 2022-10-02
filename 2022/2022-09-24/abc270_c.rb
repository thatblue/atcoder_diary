require 'set'

n, x, y = gets.chomp.split.map(&:to_i)

PATHS = Array.new(n + 1) {Array.new}

(n - 1).times do
  from, to = gets.chomp.split.map(&:to_i)
  PATHS[from] << to
  PATHS[to] << from
end

def bfs(start_node, destination_node)
  parent_node = Hash.new

  current_depth_nodes = Set.new([start_node])
  parent_node[start_node] = 0
  until parent_node.has_key?(destination_node)
    next_depth_nodes = Set.new
    current_depth_nodes.each do |node|
      PATHS[node].each do |child|
        if parent_node.has_key?(child)
          next
        end

        parent_node[child] = node
        next_depth_nodes.add(child)
      end
    end
    current_depth_nodes = next_depth_nodes
  end

  parent_node
end

parent_node = bfs(x, y)

x_to_y_path = [y]
current_node = y
until current_node == x
  x_to_y_path.unshift(parent_node[current_node])
  current_node = parent_node[current_node]
end

puts x_to_y_path.join(" ")
