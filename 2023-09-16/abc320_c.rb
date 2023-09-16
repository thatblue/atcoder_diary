m = gets.chomp.to_i

reels = []
common_panels = nil

reels << gets.chomp.chars.map(&:to_i)

reels << gets.chomp.chars.map(&:to_i)
common_panels = reels[0].intersection(reels[1])

reels << gets.chomp.chars.map(&:to_i)
common_panels = common_panels.intersection(reels[2])

if common_panels.empty?
  puts -1
  exit
end

common_reel_positions = Hash.new {|hash, key| hash[key] = {} }

reels.each_with_index do |reel, reel_index|
  reel.each_with_index do |panel, time|
    next unless common_panels.include?(panel)
    common_reel_positions[panel][time] = reel_index
  end
end


fastest_bingos = common_panels.map { |v| [v, m] }.to_h
common_panels.each do |panel|
  panels = {}
  common_reel_positions[panel].keys.sort.each do |time|
    panel = common_reel_positions[time]
    next if panels.include?(panel)
    panels[panel] = time
  end

  
end

puts fastest_bingos.values.min
