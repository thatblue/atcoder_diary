n = gets.chomp.to_i

ramps = []
(1..n).each do
  ramps.push(gets.chomp.chars.map!(&:to_i))
end

min_strength = nil
(1..n).each do|to_index|
  i_min_strength = nil
  (1..n).each do |from_index|
    if to_index == from_index
      next
    end

    distance = (ramps[to_index][0] - ramps[from_index][0]).abs + (ramps[to_index][1] - ramps[from_index][1]).abs
    least_required_strength = distance / ramps[from_index][2]
    i_min_strength |= least_required_strength
    i_min_strength = [i_min_strength, least_required_strength].min
  end
  min_strength = [min_strength, i_min_strength].min
end

p min_strength