s = gets.chomp.chars
t = gets.chomp.chars

s_length = s.length
t_length = t.length

s.unshift('')
t.unshift('')
dp = Array.new(s_length + 1) {Array.new(t_length + 1, 0)}

(1..s_length).each do |i|
  tail_s_sub = s[i]
  (1..t_length).each do |j|
    tail_t_sub = t[j]
    previous = [dp[i-1][j], dp[i][j-1]].max
    if tail_s_sub == tail_t_sub
      dp[i][j] = dp[i-1][j-1] + 1
    else
      dp[i][j] = previous
    end
  end
end

lcs_len = dp[s_length][t_length]
lcs = []
i = s_length
j = t_length

while lcs.length < lcs_len
  if s[i] == t[j]
    lcs.unshift(s[i])
    i -= 1
    j -= 1
  elsif dp[i][j] == dp[i-1][j]
    i -= 1
  else
    j -= 1
  end
end

puts lcs.join
