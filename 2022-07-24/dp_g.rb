n, m = gets.chomp.split.map(&:to_i)

paths = Array.new(n + 1) {[]}

m.times do
  from, to = gets.chomp.split.map(&:to_i)
  paths[from] << to
end

def longest_path_from(start_node, dp, paths, found_nodes)
  if found_nodes[start_node]
    return dp[start_node]
  end

  if paths[start_node].length == 0
    dp[start_node] = 0
    return 0
  end

  longest_path = 0
  found_nodes[start_node] = true
  paths[start_node].each do |next_node|
    longest_path = [longest_path, longest_path_from(next_node, dp, paths, found_nodes) + 1].max
  end

  dp[start_node] = longest_path

  longest_path
end

longest_path = 0
found_nodes = {}
found_nodes.default = false
dp = Array.new(n + 1, 0)
(1..n).each do |start_node|
  longest_path = [longest_path, longest_path_from(start_node, dp, paths, found_nodes)].max
end

p longest_path