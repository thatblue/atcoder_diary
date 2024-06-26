n = gets.chomp.to_i
colors = gets.chomp.split.map(&:to_i)

ans = {}
(0..(2 * n - 3)).each do |index|
  if colors[index] != colors[index + 1] && colors[index] == colors[index + 2]
    ans[colors[index]] = true
  end
end

puts ans.size
