s = gets.chomp.chars
ABC = ['A', 'B', 'C']

ans = []
s.each do |char|
  ans << char

  next if ans.size < 3

  if ans[-3..-1] == ABC
    ans.pop(3)
  end
end

puts ans.join
