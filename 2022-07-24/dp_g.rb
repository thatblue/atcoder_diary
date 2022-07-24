n, m = gets.chomp.split.map(&:to_i)

paths = Array.new(n + 1) {[]}

m.times do
  from, to = gets.chomp.split.map(&:to_i)
  paths[from] << to
end

longest_path = 0
found_nodes = {}
found_nodes.default = false
(1..n).each do |start_node|
  if found_nodes[start_node]
    next
  end

  prev_nodes = [start_node]
  (1..n-1).each do |depth|
    next_nodes = []
    prev_nodes.each do |prev_node|
      paths[prev_node].each do |node|
        found_nodes[node] = true
      end

      next_nodes += paths[prev_node]
    end

    if next_nodes.length == 0
      longest_path = [longest_path, depth - 1].max
      break
    end

    if depth == n - 1
      # n - 1より長いパスはあり得ない
      p depth
      exit
    end

    next_nodes.uniq!

    prev_nodes = next_nodes
  end
end

p longest_path