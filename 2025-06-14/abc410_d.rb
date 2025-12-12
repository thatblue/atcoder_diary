n, m = gets.chomp.split.map(&:to_i)

paths = Array.new(n + 1) { Array.new(n + 1) }

m.times do
  from, to, weight = gets.chomp.split.map(&:to_i)

  paths[from][to] = weight
end

results = Array.new(n + 1, 10000)
results[0] = 0
results[1] = 0

visited_paths = {}
current_nodes = [1]
next_nodes = []

results = Array.new(n + 1) { {} }
results[1][[0]] = 0
while current_nodes.count > 0
  current_nodes.each do |current|
    (1..n).each do |next_node|
      next if paths[current][next_node].nil?
      next if visited_paths.include?([current, next_node])
      next_nodes << next_node
      visited_paths[[current, next_node]] ||= 0
      visited_paths[[current, next_node]] += 1

      results[next_node][[]]
      results[next_node] = [
        results[next_node], results[current] ^ paths[current][next_node]
      ].min
    end
  end

  current_nodes = next_nodes
  next_nodes = []
end

puts results[n].count > 0 ? results[n].values.min : -1
