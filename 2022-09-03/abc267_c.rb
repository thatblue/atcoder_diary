*, m = gets.chomp.split.map(&:to_i)
array = gets.chomp.split.map(&:to_i)

total = 0
cumu_sum = []
ans = 0
current_value = 0
array.each_with_index do |a_i, index|
  total += a_i
  cumu_sum << total
  if index < m
    current_value += a_i * (index + 1)
    ans = current_value
    next
  end

  prev_index = index - m - 1
  if prev_index >= 0
    current_value -= (cumu_sum[index - 1] - cumu_sum[prev_index])
  else
    current_value -= cumu_sum[index - 1]
  end

  current_value += a_i * m

  ans = [ans, current_value].max
end
p ans
