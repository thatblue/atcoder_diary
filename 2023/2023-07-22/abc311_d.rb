NOT_REACHABLE = 0
THROUGH = 1
STOP = 2
directions = { up: { i: -1, j: 0 }, down: { i: 1, j: 0 }, left: { i: 0, j: -1 }, right: { i: 0, j: 1 } }

$n, $m = gets.chomp.split.map(&:to_i)

$map = []
$n.times do
  $map << gets.chomp.chars.map { |v| v == '#' ? false : true }
end

def movable?(i, j)
  return i.between?(1, $n - 2) && j.between?(1, $m - 2) && $map[i][j]
end

visited_nodes = { [1, 1] => true }
current_nodes = { [1, 1] => true }
stopped_nodes = { [1, 1] => true }

until current_nodes.empty?
  next_nodes = {}
  current_nodes.each do |node, _|
    i, j = node

    directions.each do |_, move|
      next_i = i + move[:i]
      next_j = j + move[:j]

      # 全く動けないならこの時点で終了
      next unless movable?(next_i, next_j)

      while movable?(next_i, next_j)
        visited_nodes[[next_i, next_j]] = true
        next_i += move[:i]
        next_j += move[:j]
      end

      last_i = next_i - move[:i]
      last_j = next_j - move[:j]

      # 既に止まったことのあるノードであればここで終了
      next if stopped_nodes[[last_i, last_j]]

      # 初めて止まったノードなら次の探索対象とする
      stopped_nodes[[last_i, last_j]] = true
      next_nodes[[last_i, last_j]] = true
    end
  end

  current_nodes = next_nodes
end

puts visited_nodes.length
