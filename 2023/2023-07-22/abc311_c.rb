n = gets.chomp.to_i

next_nodes = gets.chomp.split.map(&:to_i)
next_nodes.unshift(0)

path = []
visited = {}
current = 1
index = 0
loop do
  unless visited[current].nil?
    loop_path = path[visited[current]..]
    puts loop_path.count
    puts loop_path.join ' '
    exit
  end

  path << current
  visited[current] = index
  current = next_nodes[current]
  index += 1
end
