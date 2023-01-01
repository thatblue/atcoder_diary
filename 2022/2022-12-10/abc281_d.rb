n, k, d = gets.chomp.split.map(&:to_i)

array = gets.chomp.split.map(&:to_i)

dp = Array.new(n + 1) { Array.new(k + 1) { Array.new(d, -1) } }
dp[0][0][0] = 0

n.times do |x|
  0.upto(k) do |y|
    d.times do |z|
      next if dp[x][y][z] == -1

      dp[x + 1][y][z] = [dp[x + 1][y][z], dp[x][y][z]].max

      if y < k
        target_mod = (z + array[x]) % d
        dp[x + 1][y + 1][target_mod] = [dp[x + 1][y + 1][target_mod], dp[x][y][z] + array[x]].max
      end
    end
  end
end

puts dp[n][k][0]
