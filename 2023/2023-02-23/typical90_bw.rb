require 'prime'

n = gets.chomp.to_i

prime_count = Prime.prime_division(n).map { |value| value[1] }.sum

0.upto(40) do |i|
  if 2 ** i >= prime_count
    puts i
    exit
  end
end
