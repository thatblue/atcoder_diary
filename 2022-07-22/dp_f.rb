s = gets.chomp.chars
t = gets.chomp.chars

s_length = s.length
t_length = t.length
dp = Array.new(s_length) {Array.new(t_length, 0)}

dp[0][0] = 1 if s[0] == t[0]

(1..s_length-1).each do |i|
  dp[i][0] = dp[i-1][0]
  dp[i][0] = 1 if s[i] == t[0]
end

(1..t_length-1).each do |j|
  dp[0][j] = dp[0][j-1]
  dp[0][j] = 1 if s[0] == t[j]
end

(1..s_length - 1).each do |i|
  tail_s_sub = s[i]
  (1..t_length - 1).each do |j|
    tail_t_sub = t[j]

    previous = [dp[i-1][j], dp[i][j-1]].max
    if tail_s_sub == tail_t_sub && dp[i-1][j] == dp[i][j-1]
      dp[i][j] = previous + 1
    else
      dp[i][j] = previous
    end
  end
end

lcs = []
i = s_length - 1
search_finished = false
(t_length - 1).downto(0) do |j|
  loop do
    if i == 0 || j == 0
      # 左か上かどちらかが端に到達しているので斜め上を0とする
      current = dp[i][j]
      upper = dp[i-1][j]
      left = dp[i][j-1]

      if i == 0
        upper = 0
      end

      if j == 0
        left = 0
      end
      diagonally_above = 0
    else
      current = dp[i][j]
      upper = dp[i-1][j]
      left = dp[i][j-1]
      diagonally_above = dp[i - 1][j - 1]
    end

    if current == diagonally_above
      # 現在の値の内部にいるので左上に移動する
      i -= 1
      break
    end

    if current > diagonally_above
      if diagonally_above == upper && diagonally_above == left
        # 現在の値の角にいる
        lcs.unshift(t[j])
        i -= 1

        if diagonally_above == 0
          # 文字は全部見つけきったので終了
          search_finished = true
        end
        break
      end

      if left <= upper
        # 現在の値の左端にいる
        i -= 1
        next
      end

      # 現在の値の上端にいる
      break
    end
  end

  if search_finished
    break
  end
end


puts lcs.join
