n = gets.chomp.to_i

words = []

n.times do
  words << gets.chomp
end

n.times do |i|
  n.times do |j|
    next if i == j
    combined = words[i] + words[j]
    if combined == combined.reverse
      puts 'Yes'
      exit
    end
  end
end

puts 'No'
