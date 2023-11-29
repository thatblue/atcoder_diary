n, m = gets.chomp.split.map(&:to_i)
points = gets.chomp.split.map(&:to_i)

point_indexes = Hash.new {|hash, key| hash[key] = []}
points.each_with_index do |point, index|
  point_indexes[point] << index
end
point_reverse_order = point_indexes.keys.sort.reverse

score_max = 0
results = []
scores = []
n.times do |index|
  player_id = index + 1
  player_results = gets.chomp.chars.map { |v| v == 'o' }
  player_score = player_results.map.with_index do |is_ac, prob_index|
    is_ac ? points[prob_index] : 0
  end.sum + player_id

  results << player_results
  scores << player_score
  score_max = [score_max, player_score].max
end

scores.each_with_index do |score, player_index|
  if score_max == score
    # 自分がトップの場合はそのままでよい(同率1位は制約上ありえない)
    puts 0
    next
  end

  diff = score_max - score
  ans = 0
  ans_detected = false
  # 点数の高い方から順にいく
  point_reverse_order.each do |point|
    point_indexes[point].each do |prob_index|
      # AC済みなら追加点にはならないのでスキップ
      next if results[player_index][prob_index]

      ans += 1
      diff -= point

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
