n, k = gets.chomp.split.map(&:to_i)
array = gets.chomp.split.map(&:to_i).sort

leave_count = n - k
ans = array[-1] - array[0] + 1
0.upto(n - leave_count) do |i|
  ans = [ans, array[i + leave_count - 1] - array[i]].min
end

puts ans
