n = gets.chomp.to_i
dishes = gets.chomp.split.map.with_index do |dish, index|
  (dish.to_i - index + n) % n
end

diffs = dishes.tally.sort.to_h
diffs.default = 0

max_satisfied = 0
diffs.each do |offset, count|
  offset_before = offset == 0 ? n - 1 : offset - 1
  offset_after = offset == n - 1 ? 0 : offset + 1

  max_satisfied = [max_satisfied, count + diffs[offset_before] + diffs[offset_after]].max
end

p max_satisfied
