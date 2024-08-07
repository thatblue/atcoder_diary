# cf. https://atcoder.jp/contests/codequeen2024-final-N9tn8QqD/editorial/10593
# 解説の写経
RIDE = 0
DONT_RIDE = 1
N, K, T = gets.chomp.split.map(&:to_i)
total_precips = 0
cumu_precips = gets.chomp.split.map { |value| total_precips += value.to_i }
cumu_precips.unshift 0

dp = Array.new(K + 1) { Array.new(N + 1, total_precips) }
dp[0][0] = 0
(0..K).each do |i|
  (0...N).each do |t|
    # 時間tで乗らないケース(時間t+1に結果を配る)
    dp[i][t + 1] = [
      dp[i][t + 1], # 前に計算した結果(このタイミングでちょうど降りたとき)
      dp[i][t] # 現在の状態から引き続き乗らない場合
    ].min
    # 時間tで乗るケース(時間t+Tに結果を配る)
    dp[i + 1][t + T] = (dp[i][t] + cumu_precips[t + T] - cumu_precips[t]) if i < K && t <= N - T
  end
end

puts dp[K][N]
