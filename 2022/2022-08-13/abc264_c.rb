h1, _ = gets.chomp.split.map(&:to_i)
matrix1 = []
h1.times do
  matrix1 << gets.chomp.split.map(&:to_i)
end

h2, w2 = gets.chomp.split.map(&:to_i)
matrix2 = []
h2.times do
  matrix2 << gets.chomp.split.map(&:to_i)
end

i2 = 0
matrix = []
picked_col_index = nil
matrix1.each do |row|
  j2 = 0
  new_array = []
  col_index = []
  row.each_with_index do |col, index|
    if matrix2[i2][j2] == col
      col_index << index
      new_array << col
      j2 += 1
      if j2 >= w2
        break
      end
    end
  end
  if new_array.length == w2
    if picked_col_index.nil?
      picked_col_index = col_index
    else
      if picked_col_index != col_index
        next
      end
    end

    matrix << new_array
    i2 += 1
    if i2 >= h2
      break
    end
  end
end

puts matrix.length == h2 ? "Yes" : "No"