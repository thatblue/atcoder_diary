require 'prime'

t = gets.chomp.to_i

t.times do
  n_i = gets.chomp.to_i

  n_prime_divisors = n_i.prime_division

  puts n_prime_divisors.count >= 2 ? 'Yes' : 'No'
end
