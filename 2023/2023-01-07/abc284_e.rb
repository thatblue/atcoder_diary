# 解説の写経
n, m = gets.chomp.split.map(&:to_i)

MAX = 10 ** 6

$paths = Array.new(n + 1) { Array.new }

m.times do
  from, to = gets.chomp.split.map(&:to_i)
  $paths[from] << to
  $paths[to] << from
end

$routes = 0
$visited = {}

def visit(current_node)
  return if $routes >= MAX

  $visited[current_node] = true
  $routes += 1

  $paths[current_node].each do |next_node|
    next if $visited[next_node]
    visit(next_node)
  end

  $visited[current_node] = false

  $routes
end

puts visit(1)
