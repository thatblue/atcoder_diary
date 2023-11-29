n = gets.chomp.to_i

imos = Array.new(101) { Array.new(101, 0) }
n.times do
  x_s, x_e, y_s, y_e = gets.chomp.split.map(&:to_i)
  imos[x_s][y_s] += 1
  imos[x_s][y_e] -= 1
  imos[x_e][y_s] -= 1
  imos[x_e][y_e] += 1
end

101.times do |x|
  cumu = imos[x][0]
  1.upto(100) do |y|
    cumu += imos[x][y]
    imos[x][y] = cumu
  end
end

101.times do |y|
  cumu = imos[0][y]
  1.upto(100) do |x|
    cumu += imos[x][y]
    imos[x][y] = cumu
  end
end

puts imos.sum { |row| row.count { |v| v > 0 } }
