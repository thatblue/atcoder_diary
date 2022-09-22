n = gets.chomp.to_i

imos = Array.new(1001) {Array.new(1001, 0)}

n.times do
  l_x, l_y, r_x, r_y = gets.chomp.split.map(&:to_i)

  imos[l_x][l_y] += 1
  imos[r_x][r_y] += 1
  imos[l_x][r_y] -= 1
  imos[r_x][l_y] -= 1
end

0.upto(1000) do |x|
  current_num = imos[x][0]
  1.upto(1000) do |y|
    imos[x][y] += current_num
    current_num = imos[x][y]
  end
end

papers = Array.new(n + 1, 0)
0.upto(1000) do |y|
  current_num = imos[0][y]
  1.upto(1000) do |x|
    imos[x][y] += current_num
    current_num = imos[x][y]
    papers[current_num] += 1
  end
end

1.upto(n) do |i|
  p papers[i]
end
