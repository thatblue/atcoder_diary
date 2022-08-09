n = gets.chomp.to_i
h = gets.chomp.split.map(&:to_i)
h.unshift(0)

shortest_costs = Array.new(n + 1, 0)

(2..n).each do |pos|
  if pos == 2
    shortest_costs[pos] = (h[pos - 1] - h[pos]).abs
    next
  end

  from_n_1 = shortest_costs[pos - 1] + (h[pos - 1] - h[pos]).abs
  from_n_2 = shortest_costs[pos - 2] + (h[pos - 2] - h[pos]).abs

  shortest_costs[pos] = [from_n_1, from_n_2].min
end

p shortest_costs[n]