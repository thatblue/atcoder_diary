n = gets.chomp.to_i

grid = []

n.times do
  grid << gets.chomp.chars.map(&:to_i)
end

new_grid = Array.new(n) { Array.new(n) }

n.times do |i|
  n.times do |j|
    if i == 0 && j > 0
      new_grid[i][j] = grid[i][j - 1]
    elsif j == n - 1 && i > 0
      new_grid[i][j] = grid[i - 1][j]
    elsif i == n - 1 && j < n - 1
      new_grid[i][j] = grid[i][j + 1]
    elsif j == 0 && i < n - 1
      new_grid[i][j] = grid[i + 1][j]
    else
      new_grid[i][j] = grid[i][j]
    end
  end
end

n.times do |i|
  puts new_grid[i].join
end
