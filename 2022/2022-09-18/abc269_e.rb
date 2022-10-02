$stdout.sync = true

n = gets.chomp.to_i

i_head = 1
i_tail = n
while i_head < i_tail do
  i_center = (i_head + i_tail) / 2
  i_count = i_center - (i_head - 1)

  puts ["?", i_head, i_center, 1, n].join(" ")
  answer = gets.chomp.to_i

  if answer == -1
    exit
  elsif answer == i_count
    i_head = i_center + 1
  else
    i_tail = i_center
  end
end

i = i_head

j_head = 1
j_tail = n
while j_head < j_tail do
  j_center = (j_head + j_tail) / 2
  j_count = j_center - (j_head - 1)

  puts ["?", 1, n, j_head, j_center].join(" ")
  answer = gets.chomp.to_i

  if answer == -1
    exit
  elsif  answer == j_count
    j_head = j_center + 1
  else
    j_tail = j_center
  end
end

j = j_head

puts ["!", i, j].join(" ")
