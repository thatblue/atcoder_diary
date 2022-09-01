n = gets.chomp.to_i

PATHS = Array.new(n + 1) { [] }

(n-1).times do
  from, to = gets.chomp.split.map(&:to_i)
  PATHS[from] << to
  PATHS[to] << from
end

PATHS.each do |next_towns|
  next_towns.sort!
end

def dfs(current, visited, route)
  visited[current] = true
  route << current
  PATHS[current].each do |next_town|
    next if visited[next_town]
    dfs(next_town, visited, route)
    route << current
  end
end

route = []
dfs(1, Array.new(n + 1), route)

puts route.join(" ")
