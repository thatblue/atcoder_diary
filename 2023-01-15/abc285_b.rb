n = gets.chomp.to_i
s = gets.chomp.chars

ans = []
1.upto(n - 1) do |i|
  l_max = n - i
  current_ans = 0
  1.upto(l_max) do |k|
    break if s[k -1] == s[k + i - 1]
    current_ans = k
  end
  ans << current_ans
end

puts ans
