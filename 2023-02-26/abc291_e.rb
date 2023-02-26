require 'set'

n, m = gets.chomp.split.map(&:to_i)

$rules = Array.new(n + 1) { Set.new }
start_node = nil
goal_node = nil
m.times do
  from, to = gets.chomp.split.map(&:to_i)
  $rules[from].add(to)
  start_node ||= from
  goal_node ||= to

  start_node = from if start_node == to
  goal_node = to if goal_node == from
end

$visited = []

def dfs(current, goal)
  return [current] if current == goal

  candidates = $rules[current]
  return [] if candidates.count.zero?

  max_distance = 0
  max_route = []
  $visited << current
  candidates.each do |candidate|
    next if $visited.include? candidate

    route = dfs(candidate, goal)
    if route.count + 1 > max_distance
      max_distance = route.count + 1
      max_route = [current] + route
    end
  end
  $visited.pop

  max_route
end

route = dfs(start_node, goal_node)

if route.count < n
  puts 'No'
  exit
end

order = Array.new(n + 1)
1.upto(n) do |i|
  order[route[i - 1]] = i
end

puts 'Yes'
puts order[1..].join ' '
