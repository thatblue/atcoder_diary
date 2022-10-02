n = gets.chomp.to_i
COORD_MAX = 1000

imos = Array.new(COORD_MAX + 1) { Array.new(COORD_MAX + 1, 0) }

n.times do
  l_x, l_y, r_x, r_y = gets.chomp.split.map(&:to_i)

  imos[l_x][l_y] += 1
  imos[r_x][r_y] += 1
  imos[l_x][r_y] -= 1
  imos[r_x][l_y] -= 1
end

0.upto(COORD_MAX) do |x|
  1.upto(COORD_MAX) do |y|
    imos[x][y] += imos[x][y - 1]
  end
end

0.upto(COORD_MAX) do |y|
  1.upto(COORD_MAX) do |x|
    imos[x][y] += imos[x - 1][y]
  end
end

ans = imos.flatten.tally

1.upto(n) do |i|
  puts ans[i] || 0
end
