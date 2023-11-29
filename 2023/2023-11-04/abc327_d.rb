NONE = 0
RED = 1
BLUE = 2

n, m = gets.chomp.split.map(&:to_i)
array_a = gets.chomp.split.map(&:to_i)
array_b = gets.chomp.split.map(&:to_i)

$graph = Array.new(n + 1) { [] }

m.times do |i|
  $graph[array_a[i]] << array_b[i]
  $graph[array_b[i]] << array_a[i]
end

$graph_colors = Array.new(m)

def dfs(current_node, color)
  $graph_colors[current_node] ||= color
  return false unless $graph_colors[current_node] == color

  $graph[current_node].each do |next_node|
    next_color = color == RED ? BLUE : RED
    unless $graph_colors[next_node].nil?
      return false if $graph_colors[next_node] != next_color
      next
    end

    return false unless dfs(next_node, next_color)
  end

  true
end

(1..n).each do |i|
  unless dfs(i, RED)
    puts 'No'
    exit
  end unless $graph_colors[i]
end

puts 'Yes'
