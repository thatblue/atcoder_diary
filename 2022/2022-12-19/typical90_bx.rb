n = gets.chomp.to_i

total = 0
cumu_sum = gets.chomp.split.map { |value| total += value.to_i }
cumu_sum.unshift(0)

tenth, mod = total.divmod(10)

if mod > 0
  puts "No"
  exit
end

left_index = 0
right_index = 1

while left_index < n && right_index <= n
  if left_index < right_index
    current_part = cumu_sum[right_index] - cumu_sum[left_index]
  else
    current_part = (cumu_sum[n] - cumu_sum[left_index]) + (cumu_sum[right_index])
  end

  if current_part == tenth
    # ちょうどの箇所を発見したので終了
    puts "Yes"
    exit
  elsif current_part < tenth
    # 足りないので幅を広げたい
    right_index += 1
  else
    # 多い場合はとりあえず左端を進める
    left_index += 1

    # 範囲を狭める余地がないので次の領域を見る
    right_index += 1 if left_index == right_index
  end

  back_to_start, left_index = left_index.divmod(n + 1)
  break if back_to_start > 0
  right_index %= (n + 1)
end

puts "No"
