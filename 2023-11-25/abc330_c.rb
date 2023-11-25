d = gets.chomp.to_i

search_max = Math.sqrt(d).to_i
ans = d
1.upto(search_max) do |x|
  [Math.sqrt((d - x**2).abs).floor, Math.sqrt((d - x**2).abs).ceil].each do |y|
    current_ans = ((x**2 + y**2) - d).abs
    ans = [ans, current_ans].min
  end
end

puts ans
