n = gets.chomp.to_i
dishes = gets.chomp.split.map(&:to_i)

happy_count = Array.new(n, 0)

dishes.each_with_index do |pos, dish|
  happy_count[(dish - pos - 1) % n] += 1
  happy_count[(dish - pos) % n] += 1
  happy_count[(dish - pos + 1) % n] += 1
end

puts happy_count.max
