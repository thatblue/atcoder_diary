n, m = gets.chomp.split.map(&:to_i)

$map = Array.new(n + 1) { Hash.new }
m.times do
  a, b, c = gets.chomp.split.map(&:to_i)
  $map[a][b] = c
  $map[b][a] = c
end

def dfs(current)
  $visited[current] = true
  max_days = 0
  $map[current].each do |next_town, days|
    next if $visited[next_town]
    max_days = [max_days, dfs(next_town) + days].max
  end
  $visited.delete(current)

  return max_days
end

$visited = {}
ans = 0
(1..n).each do |start_town|
  ans = [ans, dfs(start_town)].max
end

puts ans
