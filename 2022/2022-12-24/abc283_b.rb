n = gets.chomp.to_i
array = gets.chomp.split.map(&:to_i)

q = gets.chomp.to_i

q.times do
  query = gets.chomp.split.map(&:to_i)

  if query[0] == 1
    array[query[1] - 1] = query[2]
  else
    puts array[query[1] - 1]
  end
end
