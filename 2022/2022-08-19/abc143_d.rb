n = gets.chomp.to_i

edges = gets.chomp.split.map(&:to_i).sort!

triangle_count = 0

i = 0
while i < n - 2
  j = i + 1
  while j < n - 1
    max_longest_edge = edges[i] + edges[j] - 1
    too_long_index = edges[j+1..n-1].bsearch_index {|longest_edge| longest_edge > max_longest_edge}
    too_long_index ||= n - j - 1

    triangle_count += too_long_index

    j += 1
  end
  i += 1
end

p triangle_count
