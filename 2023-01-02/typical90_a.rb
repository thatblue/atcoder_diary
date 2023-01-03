n, l = gets.chomp.split.map(&:to_i)
k = gets.chomp.to_i
piece_count = k + 1

prev_length = 0
min = l
pieces = gets.chomp.split.map do |value|
  piece = value.to_i - prev_length
  min = [min, piece].min
  prev_length = value.to_i
  piece
end

pieces << l - prev_length
min = [min, pieces[-1]].min

# スコアの最大はどう頑張っても平均を超えない
average = l / piece_count

max = average
while min < max
  center = (min + max + 1) / 2

  current_piece_count = 0
  current_length = 0
  piece_min = l + 1

  pieces.each do |piece|
    current_length += piece
    if center <= current_length
      current_piece_count += 1
      piece_min = [piece_min, current_length].min
      current_length = 0
    end
  end

  if piece_count <= current_piece_count
    min = center
  else
    max = center - 1
  end
end

puts min
