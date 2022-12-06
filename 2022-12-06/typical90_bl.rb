n, q = gets.chomp.split.map(&:to_i)

heights = gets.chomp.split.map(&:to_i)
diffs = Array.new(n - 1)
diffs_sum = 0
(n-1).times do |i|
  diffs[i] = heights[i + 1] - heights[i]
  diffs_sum += diffs[i].abs
end

q.times do
  l, r, v = gets.chomp.split.map(&:to_i)
  l_index = l - 1
  r_index = r - 1

  if l_index > 0
    diffs_sum += (diffs[l_index - 1] + v).abs - (diffs[l_index - 1]).abs
    diffs[l_index - 1] += v
  end

  if r_index < n - 1
    diffs_sum += (diffs[r_index] - v).abs - (diffs[r_index]).abs
    diffs[r_index] -= v
  end

  puts diffs_sum
end