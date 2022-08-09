n, k = gets.chomp.split.map(&:to_i)
array = gets.chomp.split.map(&:to_i)

path = [1]
loop_start_index = nil
found_cities = {1 => 0}
(1..n).each do |index|
  latest_city = path[-1]
  latest_city_index = latest_city - 1
  current_city = array[latest_city_index]
  loop_start_index = found_cities[current_city]

  path << current_city
  found_cities[current_city] = index

  if loop_start_index
    break
  end

end

if path.length - 1 > k
  p path[k]
  exit
end

loop_length = path.length - loop_start_index - 1
steps_in_loop = k - loop_start_index

p path[loop_start_index + (steps_in_loop % loop_length)]
