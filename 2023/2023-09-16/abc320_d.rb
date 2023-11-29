n, m = gets.chomp.split.map(&:to_i)

$diffs = Array.new(n+1) { {} }

m.times do
  a, b, x, y = gets.chomp.split.map(&:to_i)
  $diffs[a][b] = [x, y]
  $diffs[b][a] = [-x, -y]
end

$positions = {}
$positions[1] = [0, 0]
def search_positions(current_node)
  current_position = $positions[current_node]

  $diffs[current_node].each do |next_node, diff|
    next if $positions.include?(next_node)

    $positions[next_node] = [current_position[0] + diff[0], current_position[1] + diff[1]]
    search_positions(next_node)
  end
end

search_positions(1)

(1..n).each do |i|
  # 1からたどれないノードは座標を定義できない
  unless $positions.include?(i)
    puts 'undecidable'
    next
  end

  puts $positions[i].join ' '
end
