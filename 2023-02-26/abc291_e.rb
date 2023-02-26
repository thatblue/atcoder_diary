require 'set'

n, m = gets.chomp.split.map(&:to_i)

graph = Array.new(n + 1) { Set.new }
indegrees = Array.new(n + 1, 0)
m.times do
  from, to = gets.chomp.split.map(&:to_i)
  next if graph[from].include? to

  graph[from].add(to)
  indegrees[to] += 1
end

smallests = []
1.upto(n) do |i|
  smallests << i if indegrees[i].zero?
end

visited = []
order = Array.new(n + 1)
1.upto(n) do |i|
  if smallests.count > 1
    puts 'No'
    exit
  end

  smallest = smallests.shift
  visited << smallest
  order[smallest] = i

  candidates = graph[smallest]
  next_smallests = []

  candidates.each do |candidate|
    indegrees[candidate] -= 1
    next_smallests << candidate if indegrees[candidate].zero?
  end

  smallests = next_smallests
end

puts 'Yes'
puts order[1..].join ' '
