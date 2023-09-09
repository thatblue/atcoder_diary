
grid = []
$false_hope_pairs = {}
def check_false_hope(values)
  hash = {}
  values.each do |pos, value|
    hash[value] ||= []
    hash[value] << pos
  end

  if hash.count == 2
    hash.each do |value, positions|
      if positions.count == 2
        $false_hope_pairs[positions] = true
        $false_hope_pairs[positions.reverse] = true
      end
    end
  end
end

3.times do |i|
  row = gets.chomp.split.map(&:to_i)
  grid << row
  check_false_hope({ [i, 0] => row[0], [i, 1] => row[1], [i, 2] => row[2] })
end

3.times do |j|
  check_false_hope({ [0, j] => grid[0][j], [1, j] => grid[1][j], [2, j] => grid[2][j] })
end

check_false_hope( {[0, 0] => grid[0][0], [1, 1] => grid[1][1], [2, 2] => grid[2][2] } )
check_false_hope( {[0, 2] => grid[0][2], [1, 1] => grid[1][1], [2, 0] => grid[2][0] } )

gakkari_count = 0
all_count = 0
[[0, 0], [0, 1], [0, 2], [1, 0], [1, 1], [1, 2], [2, 0], [2, 1], [2, 2]].permutation.each do |order|
  all_count += 1
  prev_pos = nil
  order.each do |pos|
    if prev_pos.nil?
      prev_pos = pos
      next
    end

    if $false_hope_pairs[[prev_pos, pos]]
      gakkari_count += 1
      break
    end

    prev_pos = pos
  end
end

puts (all_count - gakkari_count).to_f / all_count
