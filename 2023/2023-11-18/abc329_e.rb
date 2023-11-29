n, m = gets.chomp.split.map(&:to_i)
s = gets.chomp
t = gets.chomp

def matched?(latest, t, m)
  m.times do |i|
    return false if latest[i] != "#" && latest[i] != t[i]
  end

  true
end

index = -1
visited = Array.new(n - m + 1, false)
end_of_search = n - m
while index < end_of_search
  index += 1
  next if visited[index]

  if matched?(s[index..index + m - 1], t, m)
    visited[index] = true
    m.times { |j| s[index + j] = "#" }
    index = [index - m, -1].max
  end
end

puts s == '#' * n ? 'Yes' : 'No'
