require 'prime'

n = gets.chomp.to_i

prime_division_count = n.prime_division.map { |prime| prime[1] }.sum

puts Math.log2(prime_division_count).ceil