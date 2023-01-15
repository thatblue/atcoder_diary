n = gets.chomp.to_i

$change_graph = Hash.new
n.times do
  before, after = gets.chomp.split
  $change_graph[before] = after
end

$visited = Hash.new(false)

def loop?(start_node, current_node)
  $visited[current_node] = true
  next_node = $change_graph[current_node]
  return false if next_node.nil?
  return true if next_node == start_node

  loop?(start_node, next_node)
end

$change_graph.each do |name, change_to|
  next if $visited[name]

  $visited[name] = true
  if loop?(name, change_to)
    puts "No"
    exit
  end
end

puts "Yes"
