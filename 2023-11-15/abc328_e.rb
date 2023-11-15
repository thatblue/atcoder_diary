require "ac-library-rb/dsu"

n, m, k = gets.chomp.split.map(&:to_i)

paths = []
graph = Array.new(n + 1) { {} }
m.times do
  u, v, w = gets.chomp.split.map(&:to_i)

  graph[u][v] = w
  graph[v][u] = w
  paths << [u, v]
end

ans = k
paths.combination(n - 1).to_a.each do |current_paths|
  current_ans = 0
  tree = AcLibraryRb::DSU.new(n + 1)
  path_closed = false
  current_paths.each do |u, v|
    if tree.same?(u, v)
      path_closed = true
      break
    end

    tree.merge(u, v)
    current_ans += graph[u][v]
  end

  ans = [ans, current_ans % k].min unless path_closed
end

puts ans
