cards = gets.chomp.split.map(&:to_i).tally

if cards.length == 2 && cards.values.sort == [2, 3]
  puts "Yes"
else
  puts "No"
end
