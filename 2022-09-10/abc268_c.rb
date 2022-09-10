n = gets.chomp.to_i
dishes = gets.chomp.split.map(&:to_i)

satisfied = Array.new(n, 0)

dishes.each_with_index do |dish, i|
  offset = (dish - i) % n
  satisfied[(offset - 1) % n] += 1
  satisfied[(offset) % n] += 1
  satisfied[(offset + 1) % n] += 1
end

p satisfied.max
