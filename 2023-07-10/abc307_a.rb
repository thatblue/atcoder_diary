n = gets.chomp.to_i

array = gets.chomp.split.map(&:to_i)

ans = []

n.times do |i|
  start_of_week = i * 7
  end_of_week = (i + 1) * 7 - 1
  ans << array[start_of_week..end_of_week].sum
end

puts ans.join ' '
