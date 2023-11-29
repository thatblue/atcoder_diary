n = gets.chomp.to_i
s = gets.chomp.chars

char_count = Array.new(26, 0)
current_char = 0
current_char_count = 0
s.each_with_index do |char, index|
  char_index = char.ord - 'a'.ord
  if index == 0 || current_char != char
    current_char = char
    current_char_count = 1
    char_count[char_index] = [current_char_count, char_count[char_index]].max
    next
  end

  current_char_count += 1
  char_count[char_index] = [current_char_count, char_count[char_index]].max
end

puts char_count.sum
