k, g, m = gets.chomp.split.map(&:to_i)

current_glass = 0
current_mug = 0
k.times do
  next current_glass = 0 if current_glass == g
  next current_mug = m if current_mug == 0

  glass_vacancy = g - current_glass
  move_amount = [glass_vacancy, current_mug].min
  current_glass += move_amount
  current_mug -= move_amount
end

puts "#{current_glass} #{current_mug}"
