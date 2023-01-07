t = gets.chomp.to_i

t.times do
  gets.chomp.to_i
  values = gets.chomp.split
  count = values.count { |value| value.to_i.odd? }
  puts count
end
