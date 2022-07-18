n, k = gets.chomp.split.map(&:to_i)
h = gets.chomp.split.map(&:to_i)
h.unshift(0)

shortest_costs =  Array.new(n + 1, 10 ** 9 + 1)
shortest_costs[0] = 0
shortest_costs[1] = 0

(1..n - 1).each do |pos|
  max_dest = [pos + k, n].min
  previous_cost = shortest_costs[pos]
  ((pos + 1)..max_dest).each do |dest|
    pos_to_dest = (h[pos] - h[dest]).abs
    shortest_costs[dest] = [shortest_costs[dest], pos_to_dest + previous_cost].min
  end
end

p shortest_costs[n]
