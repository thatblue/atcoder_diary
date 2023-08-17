n = gets.chomp.to_i
chars = gets.chomp.chars

stack = []
current = []
chars.each do |char|
  if char == '('
    unless current.empty?
      stack << current
      current = []
    end
    current << char
  elsif char == ')'
    if current.empty? || current[0] != '('
      current << char
    else
      current = stack.empty? ? [] : stack.pop
    end
  else
    current << char
  end
end
stack << current

puts stack.flatten.join
