n = gets.chomp.to_i
MAX_CANDIDATE = 300_000
is_prime = Array.new(MAX_CANDIDATE + 1, true)
is_prime[0] = false
is_prime[1] = false

primes = []
2.upto(MAX_CANDIDATE) do |i|
  next unless is_prime[i]

  primes << i
  multiple_of_i = i * 2
  while multiple_of_i <= MAX_CANDIDATE
    is_prime[multiple_of_i] = false
    multiple_of_i += i
  end
end

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
