n = gets.chomp.to_i

paths = []
paths[0] = nil
n.times do
  paths << gets.chomp.split.map.with_index { |v, i| v == '1' ? i + 1 : nil }.compact
end

(1..n).each do |i|
  puts paths[i].join ' '
end
