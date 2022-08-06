n = gets.chomp.to_i
persons = gets.chomp.split.map(&:to_i)
persons.unshift(0, 0)

if n == 2
  p 1
  exit
end

generation = 1
current_person = persons[n]
loop do
  if current_person == 1
    break
  end

  current_person = persons[current_person]
  generation += 1
end

p generation