THROUGH = 1
STOP = 2
$directions = { up: [-1, 0], down:[1, 0], left: [0, -1], right: [0, 1] }

UP = 1
DOWN = 2
LEFT = 3
RIGHT = 4

$n, $m = gets.chomp.split.map(&:to_i)

$map = []
$n.times do
  $map << gets.chomp.chars.map { |v| v == '#' ? 0 : 1 }
end

def movable?(i, j)
  return i.between?(2, $n - 1) && j.between?(2, $m - 1) && $map[i][j]
end

$movable = Array.new($n + 1) { Array.new($m + 1, 0) }
$movable[2][2] = STOP

def dfs(i, j)
  pp [i, j]
  $directions.each do |_, move|
    pp [i, j, _]
    next_i = i + move[0]
    next_j = j + move[1]

    while movable?(next_i, next_j)
      $movable[next_i][next_j] = THROUGH if $movable[next_i][next_j] == 0

      next_i += move[0]
      next_j += move[1]
    end

    last_i = next_i - move[0]
    last_j = next_j - move[1]

    $movable[last_i][last_j] = STOP if $movable[last_i][last_j] == THROUGH

    dfs(last_i, last_j) if last_i != i && last_i != j && $movable[last_i][last_j] > 0
  end
end

dfs(2, 2)

ans = 0
2.upto($n - 1) do |i|
  # puts $movable[i].join
  ans += $movable[i].count { |v| v > 0 }
end

puts ans
