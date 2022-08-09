y = gets.chomp.to_i

add = [2, 1, 0, 3]

remain = y % 4

p y + add[remain]
