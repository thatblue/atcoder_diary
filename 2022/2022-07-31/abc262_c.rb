n = gets.chomp.to_i
array = gets.chomp.split.map(&:to_i)
array.unshift(0)

same_value_count = 0
array.each_with_index do |value, index|
  if index == 0 || value != index
    next
  end
  same_value_count += 1
end

pairs = 0
(1..n-1).each do|i|
  if i != array[i]
    tmp_j = array[i]
    if tmp_j > i && array[tmp_j] == i
      pairs += 1
    end
  end
end

p pairs + same_value_count * (same_value_count - 1) / 2
