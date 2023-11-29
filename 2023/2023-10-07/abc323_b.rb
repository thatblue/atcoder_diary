n = gets.chomp.to_i

win_counts = Hash.new {|hash, key| hash[key] = []}
n.times do |i|
  id = i + 1
  win_count = gets.chomp.count('o')
  win_counts[win_count] << id
end

ans = []
(n-1).downto(0) do |win_count|
  ans += win_counts[win_count]
end

puts ans.join ' '
