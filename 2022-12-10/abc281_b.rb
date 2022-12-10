s = gets.chomp.chars

if s.length != 8
  puts 'No'
  exit
end

s_prefix = s[0]
s_number = s.slice(1..6).join
s_postfix = s[7]

puts ("A".."Z").include?(s_prefix) && s_number.to_i.to_s == s_number && ("A".."Z").include?(s_postfix) ? 'Yes' : 'No'
