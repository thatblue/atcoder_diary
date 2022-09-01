require 'set'

n, q = gets.chomp.split.map(&:to_i)

PATHS = Array.new(n + 1) {[]}
(n - 1).times do
  from, to = gets.chomp.split.map(&:to_i)
  PATHS[from] << to
  PATHS[to] << from
end
TOWN_FLAGS = Array.new(n + 1)

def visit_all
  visited = Set.new
  current_depth = Set.new([1])
  depth = 0
  loop do
    next_depth = Set.new
    current_depth.each do |town|
      unless visited.include?(town)
        TOWN_FLAGS[town] = depth % 2
        next_depth.merge(PATHS[town])
        visited.add(town)
      end
    end

    if next_depth.empty?
      break
    end

    current_depth = next_depth
    depth += 1
  end
end

visit_all

q.times do
  takahashi, aoki = gets.chomp.split.map(&:to_i)

  puts TOWN_FLAGS[takahashi] == TOWN_FLAGS[aoki] ? "Town" : "Road"
end