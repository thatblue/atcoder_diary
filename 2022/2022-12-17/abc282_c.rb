n = gets.chomp.to_i
s = gets.chomp.chars

replaced = []
in_bracket = false
n.times do |index|
  current_char = s[index]

  if current_char == '"'
    in_bracket = !(in_bracket)
    replaced << current_char
    next
  end

  if current_char == "," && !in_bracket
    replaced << "."
    next
  end

  replaced << current_char
end

puts replaced.join