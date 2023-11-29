n = gets.chomp.to_i
people = gets.chomp.split.map(&:to_i)

saikyo = people.max
saikyo_count = people.count { |v| v == saikyo }
people_1 = people[0]

if saikyo == people_1
    puts saikyo_count > 1 ? 1 : 0 if saikyo == people_1
else
    puts saikyo - people_1 + 1
end
