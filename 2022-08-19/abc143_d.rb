n = gets.chomp.to_i

combinations = gets.chomp.split.map(&:to_i).combination(3).to_a

triangle_count = 0
combinations.each do |edges|
  edges.sort!
  if edges[0] + edges[1] <= edges[2]
    next
  end

  triangle_count += 1
end

p triangle_count
