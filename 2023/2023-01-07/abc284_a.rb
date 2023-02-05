n = gets.chomp.to_i

strings = []
n.times do
  strings.unshift gets.chomp
end

puts strings
