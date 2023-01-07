n, m = gets.chomp.split.map(&:to_i)

$paths = Array.new(n + 1) { Array.new }
$visited = Hash.new(false)

m.times do
  from, to = gets.chomp.split.map(&:to_i)
  $paths[from] << to
  $paths[to] << from
end

def visit_component(current_node)
  $visited[current_node] = true

  $paths[current_node].each do |next_node|
    next if $visited[next_node]
    visit_component(next_node)
  end
end

answer = 0
1.upto(n) do |i|
  next if $visited[i]

  visit_component(i)

  answer += 1
end

puts answer
