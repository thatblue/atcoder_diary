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
    next if checked[i][j]

    if grid[i][j] == '#'
      width = 3
      width += 2 while grid[i][j + width - 1] == '.' && !grid[i][j + width - 1].nil?
      crosses[(width - 1) / 2] += 1

      width.times do |k|
        if i + k < h
          checked[i + k][j + k] = true if j + k < w
          checked[i + k][j + width - 1 - k] = true if j + width - 1 - k
        end
      end
    end

    checked[i][j] = true
  end
end

puts crosses[1..].join(' ')
