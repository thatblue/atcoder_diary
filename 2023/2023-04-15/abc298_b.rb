n = gets.chomp.to_i

a_matrix = []

n.times do |i|
  a_matrix[i] = gets.chomp.split.map(&:to_i)
end

equals_0 = true
equals_90 = true
equals_180 = true
equals_270 = true

index_max = n - 1
n.times do |i|
  b_row = gets.chomp.split.map(&:to_i)

  b_row.each_with_index do |col, j|
    equals_0 = equals_0 && col == 1 if a_matrix[i][j] == 1
    equals_90 = equals_90 && col == 1 if a_matrix[(index_max - j).abs][i] == 1
    equals_180 = equals_180 && col == 1 if a_matrix[index_max - i][index_max - j] == 1
    equals_270 = equals_270 && col == 1 if a_matrix[j][(index_max - i).abs] == 1
  end
end

puts equals_0 || equals_90 || equals_180 || equals_270 ? 'Yes' : 'No'
