POSITION = 0
SIZE = 1
n = gets.chomp.to_i

snukes = Hash.new
end_time = 0
n.times do |index|
  time, pos, size = gets.chomp.split.map(&:to_i)
  if time < pos
    next
  end
  snukes[time] = [pos, size]
  end_time = time
end

dp = Array.new(end_time + 1) { Array.new(5, 0) }

1.upto(end_time) do |current_time|
  range = [current_time + 1, 5].min
  range.times do |pos|
    if snukes[current_time].nil?
      gained_size = 0
    else
      gained_size = snukes[current_time][POSITION] == pos ? snukes[current_time][SIZE] : 0
    end
    pos_min = [pos - 1, 0].max
    pos_max = [current_time, pos + 1, 4].min
    dp[current_time][pos] = dp[current_time - 1][pos_min..pos_max].max + gained_size
  end
end

p dp[end_time].max
