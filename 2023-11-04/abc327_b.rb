require 'prime'

b = gets.chomp.to_i

a = 1
loop do
  a_pow_a = a ** a
  break if a_pow_a > b

  if a_pow_a == b
    puts a
    exit
  end

  a += 1
end

puts -1
