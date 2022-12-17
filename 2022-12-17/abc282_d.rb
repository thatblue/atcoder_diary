require 'set'

n, m = gets.chomp.split.map(&:to_i)

PATHS = Array.new(n + 1) { Array.new }
m.times do
  from, to = gets.chomp.split.map(&:to_i)
  PATHS[from] << to
  PATHS[to] << from
end

odd_nodes = []
even_nodes = []
current_depth_nodes = Set.new([1])
visited = Set.new([1])
depth = 0

if PATHS[1].length == 1
  even_nodes << 1
end

while visited.length < n
  next_depth_nodes = Set.new
  current_depth_nodes.each do |node|
    candidates = PATHS[node]
    has_next_node = false
    candidates.each do |candidate|
      if visited.include?(candidate)
        next
      end

      next_depth_nodes.add(candidate)
      has_next_node = true
    end

    unless has_next_node
      if depth % 2 == 0
        even_nodes << node
      else
        odd_nodes << node
      end
    end
  end
  visited.merge(next_depth_nodes)
  current_depth_nodes = next_depth_nodes
  depth += 1
end

if depth % 2 == 0
  even_nodes.concat(current_depth_nodes.to_a)
else
  odd_nodes.concat(current_depth_nodes.to_a)
end

puts odd_nodes.length * even_nodes.length