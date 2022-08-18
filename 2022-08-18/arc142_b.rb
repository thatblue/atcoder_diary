n = gets.chomp.to_i

array = Array.new(n) {Array.new(n)}

num = 1
i = 0
while i < n
  n.times do |j|
    array[i][j] = num
    num += 1
  end
  i += 2
end

i = 1
while i < n
  n.times do |j|
    array[i][j] = num
    num += 1
  end
  i += 2
end

array.each do |row|
  puts row.join(' ')
end