require 'set'

H, W = gets.chomp.split.map(&:to_i)

i_next = [-1, 0, 1, 0]
j_next = [0, 1, 0, -1]
next_chars = { 's' => 'n', 'n' => 'u', 'u' => 'k', 'k' => 'e', 'e' => 's' }

map = []
H.times do
  map << gets.chomp.chars
end

def in_map(i, j)
  i.between?(0, H - 1) && j.between?(0, W - 1)
end

if map[0][0] != 's'
  puts 'No'
  exit
end

visited = Array.new(H) { Array.new(W, false) }
candidates = Set.new([[0, 0]])

current_char = 's'
until candidates.empty?
  next_candidates = Set.new
  current_char = next_chars[current_char]

  candidates.each do |i, j|
    4.times do |direction|
      next_i = i + i_next[direction]
      next_j = j + j_next[direction]
      next unless in_map(next_i, next_j)

      next if visited[next_i][next_j]

      if map[next_i][next_j] == current_char && next_i == H - 1 && next_j == W - 1
        puts 'Yes'
        exit
      end

      next_candidates.add([next_i, next_j]) if map[next_i][next_j] == current_char
    end

    visited[i][j] = true
  end

  candidates = next_candidates
end

puts 'No'
