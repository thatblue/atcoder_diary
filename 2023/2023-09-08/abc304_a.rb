n = gets.chomp.to_i

people = []
min_age = 10**9 + 1
min_pos = nil

n.times do |i|
  name, age = gets.chomp.split
  age = age.to_i

  people << name
  if min_age > age
    min_age = age
    min_pos = i
  end
end

puts people.rotate(min_pos)
