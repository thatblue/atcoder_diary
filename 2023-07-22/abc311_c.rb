n = gets.chomp.to_i

$paths = Array.new(n + 1) { [] }
gets.chomp.split.map(&:to_i).each_with_index do |b, index|
  $paths[index + 1] << b
end

$visited = {}
def dfs(current, path)
  if $visited[current]
    return { result: false, path: nil } if path.empty?

    if path[0] == current
      return { result: true, path: path }
    else
      start_index = path.bsearch_index { |v| v == current }
      return { result: true, path: path[start_index..] }
    end
  end

  return { result: false, path: nil } if $paths[current].empty?

  next_path = path + [current]
  $visited[current] = true
  $paths[current].each do |next_node|
    child_result = dfs(next_node, next_path)
    return child_result if child_result[:result]
  end
  $visited.delete(current)

  { result: false, path: nil }
end

result = dfs(1, [])
puts result[:path].length
puts result[:path].join ' '
