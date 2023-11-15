require "ac-library-rb/priority_queue"
require "ac-library-rb/dsu"

n, m, k = gets.chomp.split.map(&:to_i)

weights = AcLibraryRb::PriorityQueue.new() { |a, b| a < b }
paths = Hash.new {|hash, key| hash[key] = []}

m.times do
  u, v, w = gets.chomp.split.map(&:to_i)

  weights.push(w) unless paths.include?(w)
  paths[w] << [u, v]
end

ans = 0
tree = AcLibraryRb::DSU.new(n + 1)
until weights.empty?
  min_weight = weights.pop

  paths[min_weight].each do |path|
    next if tree.same?(path[0], path[1])

    tree.merge(path[0], path[1])
    ans += min_weight
  end
end

puts ans % k
