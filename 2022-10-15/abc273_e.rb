note = Hash.new
note.default = []
array = []

q = gets.chomp.to_i
ans = Array.new(q)
q.times do |i|
  operation, value = gets.chomp.split

  if operation == "ADD"
    array << value
  elsif operation == "DELETE"
    array.pop
  elsif operation == "SAVE"
    note[value] = array.dup
  else
    # operation == "LOAD"
    array = note[value].dup
  end

  ans[i] = (array.empty? ? -1 : array[-1])
end

puts ans.join(" ")
