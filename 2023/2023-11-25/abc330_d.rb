n = gets.chomp.to_i

row_count = []
col_count = Array.new(n, 0)
map = []
n.times do |i|
  row = gets.chomp.chars.map { |v| v == 'o' }
  map << row
  row_count << row.count { |v| v }
  row.each_with_index do |v, j|
    col_count[j] += 1 if v
  end
end

ans = 0
n.times do |i|
  n.times do |j|
    next unless map[i][j]

    ans += (row_count[i] - 1) * (col_count[j] - 1)
  end
end

puts ans
