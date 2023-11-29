include Math

n = gets.chomp.to_i
s = gets.chomp.chars.map(&:to_i)

s_sorted = s.sort.join
max = 10**n
max_sqrt = Math.sqrt(max).ceil

ans = 0
1.upto(max_sqrt) do |num|
  square_sorted = (num**2).to_s.chars.sort.join.rjust(n, '0')

  ans += 1 if s_sorted == square_sorted
end

puts ans
