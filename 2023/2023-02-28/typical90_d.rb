h, w = gets.chomp.split.map(&:to_i)

grid = []
h_sum = Array.new(h, 0)
w_sum = Array.new(w, 0)

h.times do |i|
  row = gets.chomp.split.map(&:to_i)

  grid << row
  h_sum[i] = row.sum
  row.each_with_index { |v, j| w_sum[j] += v }
end

h.times do |i|
  ans = []
  w.times do |j|
    ans[j] = h_sum[i] + w_sum[j] - grid[i][j]
  end

  puts ans.join ' '
end
