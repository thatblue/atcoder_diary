k = gets.chomp.to_i

sqrt = Math.sqrt(k).floor

divisors = []
1.upto(sqrt) do |i|
  div, mod = k.divmod(i)
  next if mod > 0
  divisors << i << div
end

divisors.sort!.uniq!

answer = 0
divisors.each_with_index do |a, index|
  divisors[index..].each do |b|
    ab = a * b
    break if ab > k

    c, mod = k.divmod(ab)

    next if mod > 0

    break if b > c

    answer += 1
  end
end

puts answer
