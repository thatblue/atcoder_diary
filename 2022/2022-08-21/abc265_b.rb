n, m, t = gets.chomp.split.map(&:to_i)

waiting = gets.chomp.split.map(&:to_i)
bonus_room = Array.new(m + 1)

m.times do
  room, time = gets.chomp.split.map(&:to_i)
  bonus_room[room] = time
end

remaining_time = t
waiting.each_with_index do |elapse_time, index|
  current_room = index + 1
  unless bonus_room[current_room].nil?
    remaining_time += bonus_room[current_room]
  end

  remaining_time -= elapse_time
  if remaining_time <= 0
    puts "No"
    exit
  end
end

puts "Yes"