require 'set'

n, m = gets.chomp.split.map(&:to_i)

paired = Array.new(n + 1) { Set.new }

m.times do
  participants = gets.chomp.split.map(&:to_i)

  participants[1..].each do |participant|
    paired[participant].merge(participants)
    paired[participant]
  end
end

paired[1..].each do |paired_set|
  if paired_set.length < n
    puts "No"
    exit
  end
end

puts "Yes"
