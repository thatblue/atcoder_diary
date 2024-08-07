n, t, p = gets.chomp.split.map(&:to_i)
lengths = gets.chomp.split.map(&:to_i).sort.reverse

puts [t - lengths[p-1], 0].max
