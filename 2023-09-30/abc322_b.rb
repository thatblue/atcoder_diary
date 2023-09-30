n, m = gets.chomp.split.map(&:to_i)

s = gets.chomp
t = gets.chomp

s_is_prefix = t.byteindex(s) == 0
s_is_postfix = t.byterindex(s) == m - n

if s_is_prefix && s_is_postfix
  puts 0
elsif s_is_prefix
  puts 1
elsif s_is_postfix
  puts 2
else
  puts 3
end
