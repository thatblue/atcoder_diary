h, w = gets.chomp.split.map(&:to_i)

a_matrix = []
h.times do
  a_matrix << gets.chomp.split.map(&:to_i)
end

b_matrix = []
h.times do
  b_matrix << gets.chomp.split.map(&:to_i)
end

diff = Array.new(h) { Array.new(w) }
h.times do |i|
  w.times do |j|
    diff[i][j] = a_matrix[i][j] - b_matrix[i][j]
  end
end

count = 0
h.times do |i|
  w.times do |j|
    if diff[i][j] == 0
      next
    end

    if i == h - 1 || j == w - 1
      puts "No"
      exit
    end

    count += diff[i][j].abs
    add_count = -diff[i][j]
    diff[i][j] += add_count
    diff[i + 1][j] += add_count
    diff[i][j + 1] += add_count
    diff[i + 1][j + 1] += add_count
  end
end

puts "Yes"
puts count
