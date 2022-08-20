require 'set'

n, q = gets.chomp.split.map(&:to_i)

PATHS = Array.new(n + 1) {[]}
(n - 1).times do
  from, to = gets.chomp.split.map(&:to_i)
  PATHS[from] << to
  PATHS[to] << from
end
DEPTHS = Array.new(n + 1) {Array.new(n + 1)}

def visit_all(from)
  visited = Set.new
  tree = [Set.new([from])]
  depth = 0
  loop do
    next_depth = Set.new
    tree[depth].each do |town|
      unless visited.include?(town)
        DEPTHS[from][town] = depth
        next_depth.merge(PATHS[town])
        visited.add(town)

        tree[1..depth - 1].each_with_index do |previous_depth, index|
          previous_depth.each do |previous_town|
            DEPTHS[previous_town][town] = depth - (index + 1)
          end
        end
      end
    end

    if next_depth.empty?
      break
    end

    tree << next_depth
    depth += 1
  end
end

q.times do
  takahashi, aoki = gets.chomp.split.map(&:to_i)

  if DEPTHS[takahashi][aoki].nil?
    visit_all(takahashi)
  end
  depth = DEPTHS[takahashi][aoki]

  puts depth.even? ? "Town" : "Road"
end