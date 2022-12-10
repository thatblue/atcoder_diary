n, t = gets.chomp.split.map(&:to_i)

playlist_cumu = []
cumu_sum = 0
gets.chomp.split.each do |current_time|
  cumu_sum += current_time.to_i
  playlist_cumu << cumu_sum
end

last_loop_time = t % cumu_sum

index = playlist_cumu.bsearch_index {|x| last_loop_time < x }
last_played_time = index > 0 ? playlist_cumu[index - 1] : 0

puts [index + 1, last_loop_time - last_played_time].join(" ")