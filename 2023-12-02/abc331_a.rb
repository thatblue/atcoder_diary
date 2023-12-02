m, d = gets.chomp.split.map(&:to_i)
year, month, day = gets.chomp.split.map(&:to_i)

day += 1
if day > d
  day = 1
  month += 1
end

if month > m
  day = 1
  month = 1
  year += 1
end

puts [year, month, day].join ' '
