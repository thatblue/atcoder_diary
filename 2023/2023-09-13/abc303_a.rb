n = gets.chomp.to_i
s = gets.chomp.chars
t = gets.chomp.chars

similar_1 = ['1', 'l']
similar_0 = ['0', 'o']

n.times do |i|
  next if s[i] == t[i]
  next if similar_1.include?(s[i]) && similar_1.include?(t[i])
  next if similar_0.include?(s[i]) && similar_0.include?(t[i])

  puts 'No'
  exit
end

puts 'Yes'
