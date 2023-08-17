d = gets.chomp.to_i
n = gets.chomp.to_i

attendees = Array.new(d + 2, 0)
n.times do |i|
  from, to = gets.chomp.split.map(&:to_i)
  attendees[from] += 1
  attendees[to + 1] -= 1
  # attendees[to + 1] -= 1 if to < d
end

current_attendees = 0
1.upto(d) do |day|
  current_attendees += attendees[day]
  puts current_attendees
end
