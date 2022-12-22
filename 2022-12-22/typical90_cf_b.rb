n = gets.chomp.to_i
s = gets.chomp.chars

def triangular(n)
  n * (n + 1) / 2
end

answer = triangular(n)
prev_char = s[0]
continue = 1

1.upto(n - 1) do |i|
  if prev_char != s[i]
    answer -= triangular(continue)
    continue = 1
    prev_char = s[i]
    next
  end

  continue += 1
end

answer -= triangular(continue)

puts answer
