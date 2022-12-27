time = 0
min_mod = 10
mod_count = 0

5.times do
  dish = gets.chomp.to_i

  div, mod = dish.divmod(10)
  time += div * 10
  min_mod = [min_mod, mod].min if mod > 0
  mod_count += 1 if mod > 0
end

time += (mod_count - 1) * 10 if mod_count > 1
time += min_mod if min_mod < 10

puts time
