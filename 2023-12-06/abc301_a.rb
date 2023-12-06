n = gets.chomp.to_i
s = gets.chomp.chars

takahashi_win = 0
aoki_win = 0
first_half_winner = nil
half_count = n / 2
s.each do |result|
  takahashi_win += 1 if result == 'T'
  aoki_win += 1 if result == 'A'

  if first_half_winner.nil?
    first_half_winner = result if takahashi_win == half_count
    first_half_winner = result if aoki_win == half_count
  end
end

if takahashi_win == aoki_win
  puts first_half_winner
else
  puts takahashi_win > aoki_win ? 'T' : 'A'
end
