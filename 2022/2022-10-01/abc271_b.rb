n, q = gets.chomp.split.map(&:to_i)

arrays = []
n.times do
  arrays << gets.chomp.split.map(&:to_i)
end

q.times do
  s, t = gets.chomp.split.map(&:to_i)
  p arrays[s - 1][t]
end
