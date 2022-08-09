n, m = gets.chomp.split.map(&:to_i)

roads = Array.new(n) {[]}

m.times do
  a, b = gets.chomp.split.map(&:to_i)

  roads[a - 1] << b - 1
  roads[b - 1] << a - 1
end

found_cities = {0 => 0}
found_cities.default = m + 1

previous_depth_cities = {0 => 1}
previous_depth_cities.default = 0

(1..m).each do|depth|
  current_depth_cities = {}
  current_depth_cities.default = 0

  previous_depth_cities.each do |previous_city_index, previous_city_paths|
    roads[previous_city_index].each do |to_city_index|
      if found_cities[to_city_index] < depth
        next
      end

      current_depth_cities[to_city_index] += previous_city_paths
      found_cities[to_city_index] = depth
    end
  end

  previous_depth_cities = current_depth_cities

  if previous_depth_cities.key?(n-1)
     break
  end

  if found_cities.length == n || previous_depth_cities.length == 0
    break
  end
end

p previous_depth_cities[n-1] % 1_000_000_007