n, q = gets.chomp.split.map(&:to_i)
s = gets.chomp.chars

cumu_ans = []
prev_char = nil
s.each_with_index do |char, index|
  if index == 0
    cumu_ans[index] = 0
  else
    cumu_ans[index] = cumu_ans[index - 1]
    cumu_ans[index] += 1 if prev_char == char
  end

  prev_char = char
end

q.times do
  l, r = gets.chomp.split.map(&:to_i)

  puts cumu_ans[r - 1] - cumu_ans[l - 1]
end
