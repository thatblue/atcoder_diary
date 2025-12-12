tests = gets.chomp.to_i

tests.times do
  cases, initial_height = gets.chomp.split.map(&:to_i)

  height_min = height_max = initial_height
  current_time = 0
  succeeded = true
  cases.times do
    next_time, lower, upper = gets.chomp.split.map(&:to_i)
    next unless succeeded # 失敗したことが分かったら読み込むだけ読み込んでスルー

    time_diff = next_time - current_time

    # 現在地から現実的に移動可能な最大・最小の高度を求める
    next_height_max = [height_max + time_diff, upper].min
    next_height_min = [height_min - time_diff, lower].max

    if next_height_min > upper || next_height_max < lower
      # 移動可能な高度の範囲を超えている
      succeeded = false
      puts 'No'
    end

    current_time = next_time
    height_min = next_height_min
    height_max = next_height_max
  end

  puts 'Yes' if succeeded
end