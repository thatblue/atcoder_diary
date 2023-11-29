n, m = gets.chomp.split.map(&:to_i)
presents = gets.chomp.split.map(&:to_i).sort

cumu_count = {}
cumu_count[-1] = 0

all_count = 0
presents.each do |pos|
  cumu_count[pos - 1] ||= all_count
  cumu_count[pos] ||= all_count
  all_count += 1
  cumu_count[pos] = all_count
end

reversed_positions = cumu_count.keys.reverse
ans = 0
presents.each do |pos|
  max_pos = reversed_positions.bsearch { |v| v < pos + m }
  ans = [ ans, cumu_count[max_pos] - cumu_count[pos - 1] ].max
end

puts ans
