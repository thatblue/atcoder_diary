require "ac-library-rb/priority_queue"

n, m, l = gets.chomp.split.map(&:to_i)

def init_dishes(dishes)
  AcLibraryRb::PriorityQueue.new(dishes.map.with_index { |price, index| [index + 1, price] }) { |a, b| a[1] > b[1] }
end

main_dishes = init_dishes(gets.chomp.split.map(&:to_i))
side_dishes = init_dishes(gets.chomp.split.map(&:to_i))

@exclude_pairs = {}
l.times do
  @exclude_pairs[gets.chomp.split.map(&:to_i)] = true
end

@memo = {}
def dfs(main, side)
  current_main = main.pop
  current_side = side.pop

  return @memo[[current_main[0], current_side[0]]] if @memo.include?([current_main[0], current_side[0]])

  return current_main[1] + current_side[1] unless @exclude_pairs.include?([current_main[0], current_side[0]])

  side.push(current_side)

  next_main_max = main.empty? ? 0 : dfs(main, side)

  side.pop
  main.push(current_main)

  next_side_max = side.empty? ? 0 : dfs(main, side)

  side.push(current_side)

  @memo[[current_main[0], current_side[0]]] = [next_main_max, next_side_max].max
end

puts dfs(main_dishes, side_dishes)
