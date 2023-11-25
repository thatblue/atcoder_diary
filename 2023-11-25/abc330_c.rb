include Math

d = gets.chomp.to_i

search_max = Math.sqrt(d).to_i
ans = d
1.upto(search_max) do |x|
  y = Math.sqrt((d - x**2).abs).to_i
  current_ans = ((x**2 + y**2) - d).abs
  ans = [ans, current_ans].min
end

puts ans
