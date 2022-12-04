n = gets.chomp.to_i
array = gets.chomp.split.map(&:to_i)
sorted_array = array.sort.uniq
sorted_num_count = sorted_array.count

num_count = Array.new(n, 0)

n.times do |k|
  a_k = array[k]

  target_index = sorted_array.bsearch_index { |x| x > a_k }
  larger_count = target_index.nil? ? 0 : sorted_num_count - target_index
  num_count[larger_count] += 1
end

num_count.each do |ans|
  p ans
end
