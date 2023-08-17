require 'prime'

n = gets.chomp.to_i

candidate = 2
primes = []
while candidate**2 <= n
  primes << candidate if candidate.prime?
  candidate += 1
end

primes_length = primes.count
ans = 0
0.upto(primes_length - 3) do |i|
  break if primes[i]**5 > n
  (i + 1).upto(primes_length - 2) do |j|
    break if primes[i]**2 * primes[j]**3 > n

    (j + 1).upto(primes_length - 1) do |k|
      break if primes[i]**2 * primes[j] * primes[k]**2 > n

      ans += 1
    end
  end
end

puts ans
