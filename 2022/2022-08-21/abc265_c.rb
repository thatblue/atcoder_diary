require 'set'

h, w = gets.chomp.split.map(&:to_i)

grid = []

h.times do
  grid << gets.chomp.chars
end

visited = Set.new

i = 0
j = 0
loop do
  if visited.include?([i, j])
    p -1
    exit
  end

  move = grid[i][j]
  next_i = nil
  next_j = nil
  if move == "U"
    if i > 0
      next_i = i - 1
      next_j = j
    end
  elsif move == "D"
    if i < h - 1
      next_i = i + 1
      next_j = j
    end
  elsif move == "L"
    if j > 0
      next_i = i
      next_j = j - 1
    end
  elsif move == "R"
    if j < w - 1
      next_i = i
      next_j = j + 1
    end
  end

  if next_i.nil?
    puts (i + 1).to_s + " " + (j + 1).to_s
    exit
  end

  visited.add([i, j])
  i = next_i
  j = next_j
end