n = gets.chomp.to_i

divisors_of_n = [1]
(2..9).each do |j|
  next if n % j > 0
  divisors_of_n << j
end

ans = [1]
(1..n).each do |i|
  j = nil
  divisors_of_n.each do |j_candidate|
    divisor = n / j_candidate
    j = j_candidate if i % divisor == 0
    break unless j.nil?
  end
  j ||= '-'
  ans << j
end

puts ans.join
