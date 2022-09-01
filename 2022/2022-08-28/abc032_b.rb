require 'set'

s = gets.chomp
k = gets.chomp.to_i

candidates = Set.new
max_index = s.length - k

(0..max_index).each do |start_index|
  candidates.add(s[start_index...(start_index + k)])
end

p candidates.length