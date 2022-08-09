*, x = gets.chomp.split.map(&:to_i)
s = gets.chomp.chars

compressed = []

s.each do |command|
  prev_command = compressed.pop
  if command == "U" && prev_command != nil && prev_command != "U"
    next
  else
    compressed << prev_command
    compressed << command
  end
end

current_node = x
compressed.each do |command|
  if command == "U"
    current_node = current_node / 2
  elsif command == "L"
    current_node = current_node * 2
  elsif command == "R"
    current_node = current_node * 2 + 1
  end
end

p current_node
