h, w = gets.chomp.split.map(&:to_i)
n = [h, w].min
crosses = Array.new(n + 1, 0)

grid = []

h.times do
  grid << gets.chomp.chars
end

checked = Array.new(h) { Array.new(w, false) }
h.times do |i|
  w.times do |j|
    next if grid[i][j] == '.' || checked[i][j]

    checked[i][j] = true
    length = 0
    while (i + length + 1) < h && (j + length + 1) < w &&  grid[i + length + 1][j + length + 1] == '#'
      length += 1
      checked[i + length][j + length] = true
    end

    crosses[length / 2] += 1 if length.positive?
  end
end

puts crosses[1..].join(' ')
