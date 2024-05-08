s = gets.chomp.chars

first_is_ng = s[0] != '<'
last_is_ng = s[-1] != '>'

if first_is_ng || last_is_ng
  puts 'No'
  exit
end

s[1..-2].each do |c|
  if c != '='
    puts 'No'
    exit
  end
end

puts 'Yes'
