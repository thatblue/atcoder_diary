s = gets.chomp

rice_pos = s.index('R')
soup_pos = s.index('M')

puts rice_pos < soup_pos ? 'Yes' : 'No'
