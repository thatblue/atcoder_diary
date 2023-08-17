n = gets.chomp.to_i

sticks = {}

n.times do
  word = gets.chomp
  reversed = word.reverse

  sticks[word] = true if !sticks.key?(word) && !sticks.key?(reversed)
end

puts sticks.length
