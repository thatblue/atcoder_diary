s = gets.chomp
n = gets.chomp.to_i

s.count('?').times do
  if s.sub('?', '1').gsub('?', '0').to_i(2) <= n
    s.sub!('?', '1')
  else
    s.sub!('?', '0')
  end
end

ans = s.to_i(2)

puts ans <= n ? ans : -1
