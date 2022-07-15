n, m = gets.chomp.split.map(&:to_i)

roads = Array.new(n) {[]}

m.times do
  a, b = gets.chomp.split.map(&:to_i)

  roads[a - 1] << b - 1
  roads[b - 1] << a - 1
end

shortest_paths = Array.new(m + 1) {[]}
shortest_paths[0] << [0]
found_cities = [0]
depth_of_n = nil
path_count = 0

(1..m).each do|depth|
  previous_depth = depth - 1
  current_depth_cities = []

  shortest_paths[previous_depth].each do |previous_path|
    previous_city_index = previous_path[-1]
    roads[previous_city_index].each do |to_city_index|
      if to_city_index + 1 == n
        depth_of_n ||= depth
        path_count += 1
      end

      shortest_paths[depth] << previous_path + [to_city_index]

      unless found_cities.include?(to_city_index) || current_depth_cities.include?(to_city_index)
        current_depth_cities << to_city_index
      end
    end
  end

  if depth_of_n != nil
     break
  end

  found_cities += current_depth_cities

  if found_cities.length == n
    break
  end
end

p path_count