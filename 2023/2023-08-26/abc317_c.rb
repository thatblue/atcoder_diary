n, m = gets.chomp.split.map(&:to_i)


$map = Array.new(n + 1) { Hash.new }
m.times do
  a, b, c = gets.chomp.split.map(&:to_i)
  $map[a][b] = c
  $map[b][a] = c
end

def dfs(current, visited_nodes)
  visited_nodes |= (1 << current)
  return $memo[current][visited_nodes] if $memo[current][visited_nodes]

  max_distance = 0
  $map[current].each do |next_town, distance|
    next if visited_nodes[next_town] == 1

    max_distance = [max_distance, dfs(next_town, visited_nodes) + distance].max
  end

  $memo[current][visited_nodes] = max_distance
  return max_distance
end

ans = 0
$memo = Array.new(n + 1) { Hash.new }
(1..n).each do |start_town|
  ans = [ans, dfs(start_town, 0)].max
end

puts ans
