n, k = gets.chomp.split.map(&:to_i)
s = gets.chomp.chars

visited = {}
ans = 0
s.permutation.each do |chars|
  sorted = chars.join
  next if visited.key?(sorted)

  visited[sorted] = true

  next if (0..n-k).any? do |i|
    sorted[i, k] == sorted[i, k].reverse
  end

  ans += 1
end

puts ans
