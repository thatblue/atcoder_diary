require 'prime'

n = gets.chomp.to_i
MAX_CANDIDATE = 300_000

primes = Prime.instance.each(MAX_CANDIDATE).to_a
primes_size = primes.size

ans = 0
primes.each_with_index do |a, a_index|
  break if a**5 > n

  (a_index+1).upto(primes_size-2) do |b_index|
    b = primes[b_index]
    break if a**2 * b**3 > n

    (b_index+1).upto(primes_size-1) do |c_index|
      c = primes[c_index]
      break if a**2 * b * c**2 > n

      ans += 1
    end
  end
end

puts ans
