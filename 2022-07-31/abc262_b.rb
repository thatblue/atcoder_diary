n, m = gets.chomp.split.map(&:to_i)

graph = Array.new(n + 1) {Array.new(n + 1, 0)}

m.times do
  u, v = gets.chomp.split.map(&:to_i)
  graph[u][v] = 1
  graph[v][u] = 1
end

paths = 0
(1..n - 2).each do |i|
  (i..n - 1).each do|j|
    if i == j || graph[i][j] == 0
      next
    end
    (j..n).each do |k|
      if i == k || j == k
        next
      end

      if graph[i][j] == 1 && graph[j][k] == 1 && graph[k][i] == 1
        paths += 1
      end
    end
  end
end

p paths