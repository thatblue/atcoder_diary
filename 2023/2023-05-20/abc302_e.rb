n, q = gets.chomp.split.map(&:to_i)

graph = Array.new(n + 1) { Hash.new }

isolated_nodes = n
q.times do
  query = gets.chomp.split.map(&:to_i)

  if query[0] == 1
    isolated_nodes -= 1 if graph[query[1]].empty?
    isolated_nodes -= 1 if graph[query[2]].empty?

    graph[query[1]][query[2]] = 1
    graph[query[2]][query[1]] = 1
  else
    graph[query[1]].each do |key, _|
      isolated_nodes += 1 if graph[key].size == 1
      graph[key].delete(query[1])
    end

    isolated_nodes += 1 if graph[query[1]].size.positive?
    graph[query[1]] = Hash.new
  end

  puts isolated_nodes
end
