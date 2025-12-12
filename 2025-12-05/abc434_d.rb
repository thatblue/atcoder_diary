sky = Array.new(2002) { Array.new(2002, 0) }
clouds = Array.new(2002) { Array.new(2002, 0) }

n = gets.chomp.to_i

(1..n).each do |i| 
  x_start, x_end, y_start, y_end = gets.chomp.split.map(&:to_i)
  sky[x_start][y_start] += 1
  sky[x_start][y_end + 1] -= 1
  sky[x_end + 1][y_start] -= 1
  sky[x_end + 1][y_end + 1] += 1

  clouds[x_start][y_start] += i
  clouds[x_start][y_end + 1] -= i
  clouds[x_end + 1][y_start] -= i
  clouds[x_end + 1][y_end + 1] += i
end

# x方向のいもす
2002.times do |i|
  (1..2001).each do |j|
    sky[i][j] += sky[i][j-1]
    clouds[i][j] += clouds[i][j-1]
  end
end

# y方向のいもす
(1..2001).each do |i|
  2002.times do |j|
    sky[i][j] += sky[i-1][j]
    clouds[i][j] += clouds[i-1][j]
  end
end

clear = 0
results = Array.new(n + 1, 0)
(1..2000).each do |i|
  (1..2000).each do |j|
    next if sky[i][j] > 1
    clear += 1 if sky[i][j].zero?
    results[clouds[i][j]] += 1 if sky[i][j] == 1
  end
end

(1..n).each do |i|
  puts clear + results[i]
end
