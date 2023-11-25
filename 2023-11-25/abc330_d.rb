n = gets.chomp.to_i

map = []
n.times do
  map << gets.chomp.chars.map { |v| v == 'o' }
end

row_count = []
n.times do |i|
  cumu_row = 0
  row_count << map[i].map { |v| v ? cumu_row += 1 : cumu_row }
end

col_count = []
n.times do |j|
  cumu_col = 0
  col = []
  n.times do |i|
    col << (map[i][j] ? cumu_col += 1 : cumu_col)
  end
  col_count << col
end

ans = 0
n.times do |i|
  n.times do |j|
    next unless map[i][j]

    # 左上
    ans += (row_count[i][n-1] - row_count[i][j]) * (col_count[j][n-1] - col_count[j][i]) if i < n - 1 && j < n - 1
    # 右上
    ans += (row_count[i][j - 1]) * (col_count[j][n-1] - col_count[j][i]) if i < n - 1 && j > 0

    # 左下
    ans += (row_count[i][n-1] - row_count[i][j]) * (col_count[j][i - 1]) if i > 0 && j < n - 1
    # 右下
    ans += (row_count[i][j - 1]) * (col_count[j][i - 1]) if i > 0 && j > 0
  end
end

puts ans
