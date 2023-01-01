n, k, d = gets.chomp.split.map(&:to_i)

array = gets.chomp.split.map(&:to_i)

dp = Array.new(n) { Array.new(k + 1) { Array.new(d, -1) } }
dp[0][1][array[0] % d] = array[0]

(1..n - 1).each do |x|
  # xまでの中で選ぶ
  current_value = array[x]
  current_mod = current_value % d
  d.times do |z|
    if z == current_mod
      dp[x][1][z] = [dp[x - 1][1][z], current_value].max
    else
      dp[x][1][z] = dp[x - 1][1][z]
    end
  end

  y_max = [k, x + 1].min

  2.upto(y_max) do |y|
    # y個選ぶ
    d.times do |z|
      # current_valueを選ばない場合は手前までの配列で同条件の値が入る
      dp[x][y][z] = dp[x - 1][y][z]

      target_mod = (d - current_mod + z) % d
      if dp[x - 1][y - 1][target_mod] > -1
        # current_valueを選べる場合
        dp[x][y][z] = [dp[x - 1][y - 1][target_mod] + current_value, dp[x][y][z]].max
      end
    end
  end
end

puts dp[n - 1][k][0]
