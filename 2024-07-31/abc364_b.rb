DIRECTIONS = {
  'U' => { i: -1, j: 0 },
  'D' => { i: 1, j: 0 },
  'L' => { i: 0, j: -1 },
  'R' => { i: 0, j: 1 }
}
def can_move?(i, j)
  i.between?(0, H-1) && j.between?(0, W-1) && MAP[i][j] == '.'
end

H, W = gets.chomp.split.map(&:to_i)

s_i, s_j = gets.chomp.split.map { |v| v.to_i - 1 }

MAP = []
H.times do
  MAP << gets.chomp.chars
end
moves = gets.chomp.chars

current_i = s_i
current_j = s_j
moves.each do |move|
  # 移動不可であればスキップ
  next unless can_move?(current_i + DIRECTIONS[move][:i], current_j + DIRECTIONS[move][:j])

  current_i += DIRECTIONS[move][:i]
  current_j += DIRECTIONS[move][:j]
end

puts "#{current_i + 1} #{current_j + 1}"
