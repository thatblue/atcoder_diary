n, q = gets.chomp.split.map(&:to_i)
array = gets.chomp.split.map(&:to_i)

offset = 0
q.times do
  t, x_n, y_n = gets.chomp.split.map(&:to_i)

  case t
  when 1 then
    array[(x_n + offset - 1) % n], array[(y_n  + offset - 1) % n] = array[(y_n  + offset - 1) % n], array[(x_n + offset - 1) % n]
  when 2 then
    offset -= 1
    offset %= n
  when 3 then
    p array[(x_n + offset - 1) % n]
  else
    # ここには到達しないはず
  end
end
