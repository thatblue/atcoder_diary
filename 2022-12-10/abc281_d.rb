n, k, d = gets.chomp.split.map(&:to_i)

array = gets.chomp.split.map(&:to_i)

dp = Array.new(n) { Array.new(k + 1) { Array.new(d, -1) } }
dp[0][1][array[0] % d] = array[0]

(1..n - 1).each do |x|
  # x = 配列何個目までの間か
  current_mod = array[x] % d
  d.times do |z|
    if z == current_mod
      dp[x][1][z] = [dp[x - 1][1][z], array[x]].max
    else
      dp[x][1][z] = dp[x - 1][1][z]
    end
  end

  y_max = [x + 1, k].min
  (2..y_max).each do |y|
    # y = 何個選んだか
    d.times do |z|
      target_mod = (z + current_mod) % d
      # z = 現在求めたいmod
      if dp[x - 1][y - 1][target_mod] > 0
        dp[x][y][z] = [dp[x - 1][y - 1][target_mod] + array[x], dp[x - 1][y][z]].max
      else
        dp[x][y][z] = dp[x - 1][y][z]
      end
    end
  end
end

puts dp[n - 1][k][0]