n, m = gets.chomp.split.map(&:to_i)

MAX = 10 ** 6

$paths = Array.new(n + 1) { Array.new }

m.times do
  from, to = gets.chomp.split.map(&:to_i)
  $paths[from] << to
  $paths[to] << from
end

$routes = Array.new(n + 1, 0)
$routes[1] = 1
$sum = 1

def visit(current_node, visited)
  $paths[current_node].each do |next_node|
    next if visited.include? next_node
    $routes[next_node] += 1
    $sum += 1
    if $sum >= MAX
      puts MAX
      exit
    end
    visit(next_node, visited + [next_node])
  end
end

visit(1, [1])

puts [$sum, MAX].min
