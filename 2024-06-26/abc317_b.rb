n = gets.chomp.to_i
numbers = gets.chomp.split.map(&:to_i).sort

before_missing, = numbers.slice_when { |before, after| before + 1 < after }.to_a

puts before_missing[-1] + 1
