h, w = gets.chomp.split.map(&:to_i)

h.times do
  ans = gets.chomp.split.map { |v| v.to_i.zero? ? '.' : ('A'.ord + v.to_i - 1).chr }

  puts ans.join
end
