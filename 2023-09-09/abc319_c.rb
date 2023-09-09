# 概ね解説の写経
# cf. https://atcoder.jp/contests/abc319/editorial/7114

line_indexes = [
  # 横方向
  [0, 1, 2], [3, 4, 5], [6, 7, 8],
  # 縦方向
  [0, 3, 6], [1, 4, 7], [2, 5, 8],
  # 斜め
  [0, 4, 8], [2, 4, 6]
]
cell_indexes = (0...9).to_a

cells = []
3.times do |i|
  row = gets.chomp.split.map(&:to_i)
  cells += row
end

gakkari_lines = []
line_indexes.each do |indexes|
  i_1, i_2, i_3 = indexes
  line_values = [cells[i_1], cells[i_2], cells[i_3]].uniq
  if line_values.count == 2
    gakkari_lines << indexes
  end
end

if gakkari_lines.empty?
  puts 1.0
  exit
end

not_gakkari_count = 0
all_count = 0
cell_indexes.permutation.each do |order|
  all_count += 1

  gakkari = false
  gakkari_lines.each do |indexes|
    line_values_by_order = order.map.with_index { |v, i| indexes.include?(v) ? cells[v] : nil }.compact
    if line_values_by_order[0] == line_values_by_order[1]
      gakkari = true
      break
    end
  end

  next if gakkari

  not_gakkari_count += 1
end

puts not_gakkari_count.to_f / all_count
