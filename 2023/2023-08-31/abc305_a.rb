n = gets.chomp.to_i

latest_stand_index, past = n.divmod(5)

puts past < 3 ? latest_stand_index * 5 : (latest_stand_index + 1) * 5
