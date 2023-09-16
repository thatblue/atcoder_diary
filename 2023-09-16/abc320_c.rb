m = gets.chomp.to_i
reels = []
common_panels = nil
shortests = {}
common_panels = nil

reels << gets.chomp * 3
reels << gets.chomp * 3
reels << gets.chomp * 3
common_panels = reels[0].chars.intersection(reels[1].chars, reels[2].chars)

if common_panels.empty?
  puts -1
  exit
end

shortest_times = Hash.new(Float::INFINITY)
(0..2).to_a.permutation.each do |order|
  time = 0
  common_panels.each do |panel|
    first, second, third = order
    time = reels[first].index(panel)
    time = reels[second].index(panel, time + 1)
    time = reels[third].index(panel, time + 1)
    shortest_times[panel] = [shortest_times[panel], time].min
  end
end

puts shortest_times.values.min
