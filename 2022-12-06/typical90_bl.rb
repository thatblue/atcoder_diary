n, q = gets.chomp.split.map(&:to_i)

heights = gets.chomp.split.map(&:to_i)
diffs = Array.new(n - 1)
(n-1).times do |i|
  diffs[i] = heights[i + 1] - heights[i]
end

q.times do
  l, r, v = gets.chomp.split.map(&:to_i)
  l_index = l - 1
  r_index = r - 1

  if l_index > 0
    diffs[l_index - 1] += v
  end

  if r_index < n - 1
    diffs[r_index] -= v
  end

  puts diffs.map { |x| x.abs }.sum
end