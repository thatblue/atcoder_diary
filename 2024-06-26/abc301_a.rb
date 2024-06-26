n = gets.chomp.to_i
s = gets.chomp

takahashi_win = s.count 'T'
aoki_win = s.count 'A'

if takahashi_win == aoki_win
  puts s[-1] == 'A' ? 'T' : 'A'
  exit
end

puts takahashi_win > aoki_win ? 'T' : 'A'
