n, q = gets.chomp.split.map(&:to_i)

players = Array.new(n + 1, 0)
q.times do
  event, player_no = gets.chomp.split.map(&:to_i)

  if event == 1
    players[player_no] += 1
  elsif event == 2
    players[player_no] += 2
  elsif event == 3
    puts players[player_no] >= 2 ? 'Yes' : 'No'
  end
end
