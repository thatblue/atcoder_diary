t, n = gets.chomp.split.map(&:to_i)

div, mod = 100.divmod(t)

if mod == 0
  puts div * n
  exit
end

mul = (100 - mod) / div

puts div * n + mod * n
