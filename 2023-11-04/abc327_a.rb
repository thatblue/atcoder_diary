gets.chomp.to_i
s = gets.chomp

puts s.index('ab').nil? && s.index('ba').nil? ? 'No' : 'Yes'
