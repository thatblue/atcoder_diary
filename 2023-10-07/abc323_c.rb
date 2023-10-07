n, m = gets.chomp.split.map(&:to_i)
points = gets.chomp.split.map(&:to_i)

point_indexes = Hash.new {|hash, key| hash[key] = []}
points.each_with_index do |point, index|
  point_indexes[point] << index
end
point_reverse_orders = point_indexes.keys.reverse

current_max = 0
results = []
scores = []
score_distribution = Hash.new(0)
n.times do |index|
  player_id = index + 1
  player_results = gets.chomp.chars.map { |v| v == 'o' }
  player_score = player_results.map.with_index do |is_ac, prob_index|
    is_ac ? points[prob_index] : 0
  end.sum + player_id

  results << player_results
  scores << player_score
  score_distribution[player_score] += 1

  current_max = [current_max, player_score].max
end

scores.each_with_index do |score, player_id|
  if current_max == score && score_distribution[score] == 1
    # 単独トップの場合はそのままでよい
    puts 0
    next
  end

  diff = current_max - score
  ans = 0
  ans_detected = false
  # 点数の高い方から順にいく
  point_reverse_orders.each do |point|
    point_indexes[point].each do |prob_index|
      # AC済みなら追加点にはならないのでスキップ
      next if results[player_id][prob_index]

      ans += 1
      diff -= points[prob_index]

      # ACを取って負数にならなければ次の問題を見る
      next unless diff.negative?

      puts ans
      ans_detected = true
      break
    end

    # 現在の得点の問題で答えが出ていれば次のプレイヤーに移る
    break if ans_detected
  end
end
