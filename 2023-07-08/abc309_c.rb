n, k = gets.chomp.split.map(&:to_i)

medicines = Hash.new
medicines.default = 0
end_of_days = 0
n.times do
  days, count = gets.chomp.split.map(&:to_i)

  medicines[1] += count
  medicines[days + 1] -= count

  end_of_days = [end_of_days, days].max
end

imos_days = medicines.keys.sort

current_medicines = 0
imos_days.each do |day|
  current_medicines += medicines[day]

  if current_medicines <= k
    puts day
    exit
  end
end
