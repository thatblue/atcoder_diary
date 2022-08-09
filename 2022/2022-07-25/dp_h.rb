h, g = gets.chomp.split.map(&:to_i)

grid = []

h.times do
  grid << gets.chomp.chars
end

dp = Array.new(h + 1) {Array.new(g + 1, 0)}

dp[1][1] = 1

(1..h).each do |i|
  (1..g).each do |j|
    if i == 1 && j == 1
      next
    end

    if grid[i - 1][j - 1] == "#"
      # 壁には到達不可なのでスキップ
      next
    end

    dp[i][j] = dp[i-1][j] + dp[i][j-1]
  end
end

p dp[h][g] % (10**9 + 7)
