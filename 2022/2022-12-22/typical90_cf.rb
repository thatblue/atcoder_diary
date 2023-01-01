n = gets.chomp.to_i
s = gets.chomp.chars

answers = Array.new(n, 0)

0.upto(n - 2) do |left|
  current_char = s[left]
  if left > 0 && current_char == s[left - 1]
    answers[left] = answers[left - 1]
    next
  end

  left.upto(n - 1) do |right|
    if current_char != s[right]
      answers[left] = n - right
      break
    end
  end
end

puts answers.sum
