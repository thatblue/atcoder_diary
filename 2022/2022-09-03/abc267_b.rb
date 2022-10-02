pin_index_to_line = [4, 3, 5, 2, 4, 6, 1, 3, 5, 7]

s = gets.chomp.chars.map(&:to_i)

if s[0] == 1
  puts 'No'
  exit
end

pin_exists = Array.new(8, 0)
s.each_with_index do |stat, index|
  if stat == 1
    pin_exists[pin_index_to_line[index]] = 1
  end
end

pin_exists.shift
pin_exists_str = pin_exists.join.squeeze

puts pin_exists_str.include?("101") ? 'Yes' : 'No'
