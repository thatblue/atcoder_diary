n, q = gets.chomp.split.map!(&:to_i)
s = gets.chomp.chars

s_start_index = 0
(1..q).each do
  t, x = gets.chomp.split.map!(&:to_i)

  if t == 1
    s_start_index = s_start_index - x
    if s_start_index < 0
      s_start_index += n
    end
  elsif t == 2
    real_index = s_start_index + (x - 1)
    if real_index >= n
      real_index -= n
    end

    print s[real_index] + "\n"
  end
end