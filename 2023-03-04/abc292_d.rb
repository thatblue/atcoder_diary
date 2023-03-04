require 'set'

n, m = gets.chomp.split.map(&:to_i)

$paths = Array.new(n + 1) { Array.new }
m.times do
  from, to = gets.chomp.split.map(&:to_i)
  $paths[from] << to
  $paths[to] << from if from != to
end

if n != m
  # そもそもnとmの数が異なっていれば検証をするまでもなく条件を満たさない
  puts 'No'
  exit
end

$visited = Array.new(n + 1, false)
def dfs(current_node)
  $visited[current_node] = true
  node_count = 1
  path_count = 1

  current_next_nodes = Set.new
  $paths[current_node].each do |next_node|
    path_count += 1 if current_next_nodes.include?(next_node)

    next if $visited[next_node]

    next_node_count, next_path_count = dfs(next_node)

    node_count += next_node_count
    path_count += next_path_count
  end

  [node_count, path_count]
end

1.upto(n) do |i|
  # 走査済みであればスキップ
  next if $visited[i]

  node_count, path_count = dfs(i)
  unless node_count == path_count
    # 条件を満たさない場合はそのまま終了
    puts 'No'
    exit
  end
end

puts 'Yes'

