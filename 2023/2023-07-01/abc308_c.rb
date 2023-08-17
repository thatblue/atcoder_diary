require 'set'

n = gets.chomp.to_i

standings = {}

n.times do |index|
  i = index + 1
  a_i, b_i = gets.chomp.split.map(&:to_i)

  rate = a_i.to_r / (a_i + b_i)
  standings[rate] ||= SortedSet.new
  standings[rate].add(i)
end

order = []
standings.keys.sort.reverse.each do |rate|
  print standings[rate].to_a.join ' '
  print ' '
end

print "\n"
