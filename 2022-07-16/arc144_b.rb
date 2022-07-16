n, a, b = gets.chomp.split.map(&:to_i)
array = gets.chomp.split.map(&:to_i).sort
max_of_min = array.sum / n

min = array[0]
(0..(n/2)).each do |smaller_index|
  previous_diff = array[-1 - smaller_index] - array[smaller_index]
  loop do
    smaller_index_value = array[smaller_index] + a
    larger_index_value = array[-1 - smaller_index] - b
    diff = array[-1 - smaller_index] - array[smaller_index]
    if previous_diff < diff || diff == 0
      break
    end

    array[smaller_index] = smaller_index_value
    array[-1 - smaller_index] = larger_index_value

    previous_diff = diff

    min = [min, [smaller_index_value, larger_index_value].min].max
  end
end

p min