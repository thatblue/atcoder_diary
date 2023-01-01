H, W = gets.chomp.split.map(&:to_i)

$matrix = []

H.times do
  $matrix << gets.chomp.split.map {|value| value == '1' }
end

def isolated?(i, j)
  result = true

  result &= $matrix[i][j] != $matrix[i - 1][j] if i > 0
  result &= $matrix[i][j] != $matrix[i][j - 1] if j > 0
  result &= $matrix[i][j] != $matrix[i + 1][j] if i < H - 1
  result &= $matrix[i][j] != $matrix[i][j + 1] if j < W - 1

  result
end

isolated_rows = []
H.times do |i|
  W.times do |j|
    if isolated?(i, j)
      isolated_rows << i
      break
    end
  end
end

continuous_rows = []
reverse_count = 0
isolated_rows.each_with_index do |row_index, array_index|
  if array_index == isolated_rows.length - 1 || row_index + 1 == isolated_rows[array_index + 1]
    # 連続した行の末端
    if continuous_rows.length == 1
      # 離れた行であればその行を処理するしかない
      current_row = continuous_rows[0]
      $matrix[current_row] = $matrix[current_row].map { |value| !value }
      reverse_count += 1
    else
      # 複数行を処理する場合は偶数行を処理する
      continuous_rows.each_with_index do |current_row, index|
        next if index.even?
        $matrix[current_row] = $matrix[current_row].map { |value| !value }
        reverse_count += 1
      end
    end

    continuous_rows = []
  end

  continuous_rows << row_index
end


H.times do |i|
  W.times do |j|
    if isolated?(i, j)
      puts -1
      exit
    end
  end
end

puts reverse_count
