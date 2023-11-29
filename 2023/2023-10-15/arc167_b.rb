require 'prime'

VERY_LARGE_PRIME = 998244353

def triangular(n)
  n * (n + 1) / 2
end

a, b = gets.chomp.split.map(&:to_i)

if b.zero?
  puts 0
  exit
end

prime_divisions_a = a.prime_division

prime_divisions_a_pow_b = prime_divisions_a.map {|p, e| [p, e * b]}
divisors_count = prime_divisions_a_pow_b.map{ |p, e| e }.reduce(1) { |prev, current| prev * (current + 1) }

primes_of_product = prime_divisions_a_pow_b.map do |p, e|
  [p, (triangular(e) * (divisors_count / (e + 1)))]
end

a_first_prime = prime_divisions_a.first
product_first_prime = primes_of_product.first

puts (product_first_prime[1] / a_first_prime[1]) % VERY_LARGE_PRIME
