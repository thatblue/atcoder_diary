k = gets.chomp.to_i

time = Time.local(2022,7,2,21,0,0)

print (time + k * 60).strftime('%H:%M')