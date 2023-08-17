array = gets.chomp.split.map(&:to_i)
sorted = array.sort

if array != sorted
  puts 'No'
  exit
end

if sorted[0] < 100 || sorted[-1] > 675
  puts 'No'
  exit
end

if !array.filter { |v| v % 25 > 0 }.empty?
  puts 'No'
  exit
end

puts 'Yes'
