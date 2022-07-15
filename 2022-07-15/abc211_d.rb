n, m = gets.chomp.split.map(&:to_i)

roads = Array.new(n) {[]}

m.times do
  a, b = gets.chomp.split.map(&:to_i)

  roads[a - 1] << b - 1
  roads[b - 1] << a - 1
end

shortest_depths = [{0 => 1}]

found_cities = {0 => 0}
found_cities.default
depth_of_n = nil
path_count = 0

(1..m).each do|depth|
  previous_depth = depth - 1

  current_depth = {}
  current_depth.default = 0

  shortest_depths[previous_depth].each do |previous_city_index, previous_city_paths|
    roads[previous_city_index].each do |to_city_index|
      if found_cities[to_city_index] != nil && found_cities[to_city_index] < depth
        next
      end

      if to_city_index + 1 == n
        depth_of_n ||= depth
        path_count += previous_city_paths
      end

      current_depth[to_city_index] += previous_city_paths
      found_cities[to_city_index] = depth
    end
  end

  shortest_depths << current_depth

  if depth_of_n != nil
     break
  end

  if found_cities.length == n
    break
  end
end

p path_count