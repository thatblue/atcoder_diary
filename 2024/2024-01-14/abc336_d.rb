n = gets.chomp.to_i
array = gets.chomp.split.map(&:to_i)

if n == 1
  puts 1
  exit
end

ans = 1
l = 0
center = 1
current_size = 2
while center < n - 1
  r = center + current_size - 1
  if r > n - 1
    # もうこれ以上大きい山は作れないので、lを隣に移す
    l += 1
    center = l + 1
    current_size = 1
    next
  end

  # 現在の位置関係でサイズcurrent_sizeの山が作れるかを検証する
  success = true
  center.upto(r) do |pos|
    if array[pos] < current_size - (pos - center)
      success = false
      break
    end
  end

  if success
    # 作れたら現在のlからもっと大きい山が作れる可能性があるので、centerの位置だけをずらす
    ans = [current_size, ans].max
    center += 1
    current_size += 1
  else
    # ダメならlを隣に移して、center = l + 1からやり直し
    l += 1
    center = l + 1
    current_size = 1
  end
end

puts ans
