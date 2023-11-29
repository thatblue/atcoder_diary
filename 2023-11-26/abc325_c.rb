require "ac-library-rb/dsu"

h, w = gets.chomp.split.map(&:to_i)
side_positions = [
  {:i => -1, :j => -1}, {:i => -1, :j => 0}, {:i => -1, :j => 1},
  {:i => 0, :j => -1}, {:i => 0, :j => 1},
  {:i => 1, :j => -1}, {:i => 1, :j => 0}, {:i => 1, :j => 1},
]

grid = []
h.times do
  grid << gets.chomp.chars.map { |v| v == '#' }
end

uf_tree = AcLibraryRb::DSU.new(h * w)

h.times do |i|
  w.times do |j|
    side_positions.each do |shift|
      next unless grid[i][j]
      side_i = i + shift[:i]
      side_j = j + shift[:j]

      next unless side_i.between?(0, h - 1)
      next unless side_j.between?(0, w - 1)
      next unless grid[side_i][side_j]

      uf_tree.merge(w * i + j, w * side_i + side_j)
    end
  end
end

ans = 0
uf_tree.groups.each do |group|
  pos_id = group.first
  i, j = pos_id.divmod(w)
  ans += 1 if grid[i][j]
end

puts ans
