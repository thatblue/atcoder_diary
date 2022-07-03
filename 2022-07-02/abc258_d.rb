n, x = gets.chomp.split.map!(&:to_i)

shortest_time = nil
shortest_reach_time = 0
(1..n).each do|stage|
  story_time, game_time = gets.chomp.split.map!(&:to_i)
  shortest_reach_time += story_time + game_time

  current_repeat_time = shortest_reach_time + (x - stage) * game_time

  shortest_time ||= current_repeat_time
  shortest_time = [shortest_time, current_repeat_time].min
  if stage == x
    break
  end
end

p shortest_time
