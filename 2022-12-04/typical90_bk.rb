# cf. https://atcoder.jp/contests/typical90/submissions/23327484
h, w = gets.chomp.split.map(&:to_i)

grid = []
count_max = 1
h.times do
  grid << gets.chomp.split.map(&:to_i)
end
trans_grid = grid.transpose

bit_max = 2 ** h - 1
(1..bit_max).each do |bit|
  current_bit = bit.to_s(2).rjust(h, '0')

  h_indexes = current_bit.chars.map.with_index { |flag, index| flag == '1' ? index : nil }.compact
  counts = Hash.new(0)

  w.times do |w_index|
    unique_values = trans_grid[w_index].map.with_index { |value, index| h_indexes.include?(index) ? value : nil }.compact.uniq

    if unique_values.count == 1
      counts[unique_values.pop] += 1
    end
  end

  current_max = counts.max { |a, b| a[1] <=> b[1] }

  if current_max != nil
    count_max = [current_max[1] * h_indexes.count, count_max].max
  end
end

puts count_max
