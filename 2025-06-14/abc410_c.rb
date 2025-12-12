def calc_index(no, offset, n)
  index = no - 1
  index += offset
  index % n
end

n, q = gets.chomp.split.map(&:to_i)

array = (1..n).to_a
array_offset = 0
q.times do
  query = gets.chomp.split.map(&:to_i)

  if query[0] == 1
    index = calc_index(query[1], array_offset, n)
    value = query[2]
    array[index] = value
  elsif query[0] == 2
    index = calc_index(query[1], array_offset, n)
    puts array[index]
  else
    array_offset += query[1]
    array_offset %= n
  end
end
