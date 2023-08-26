n = gets.chomp.to_i

settoku_areas = []
chair_sum = 0
takahashi_chair_sum = 0
n.times do
  takahashi, aoki, chair = gets.chomp.split.map(&:to_i)
  chair_sum += chair
  if takahashi > aoki
    takahashi_chair_sum += chair
  else
    settoku_areas << {
      :chair => chair,
      :settoku => (((takahashi + aoki) / 2) - takahashi).abs + 1
    }
  end
end

if chair_sum / 2 < takahashi_chair_sum
  puts 0
  exit
end

settoku_area_count = settoku_areas.count

settoku_count = nil
1.upto(settoku_area_count) do |i|
  (0...settoku_area_count).to_a.combination(i).each |areas|
    current_chair_sum = 0
    current_settoku_count = 0
    areas.each do |area|
      
    end
  end
end

