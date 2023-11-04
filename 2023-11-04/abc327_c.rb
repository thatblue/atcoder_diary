grid = []

9.times do
  grid << gets.chomp.split.map(&:to_i)
end

transposed = grid.transpose

def is_duplicated?(array)
  array.uniq.count < 9
end

9.times do |i|
  if is_duplicated?(grid[i]) || is_duplicated?(transposed[i])
    puts 'No'
    exit
  end
end

[0, 3, 6].each do |i|
  [0, 3, 6].each do |j|
    if is_duplicated?(grid[i][(j)..(j + 2)] + grid[i + 1][(j)..(j + 2)] + grid[i + 2][(j)..(j + 2)])
      puts 'No'
      exit
    end
  end
end

puts 'Yes'
