n, m = gets.chomp.split.map(&:to_i)

relations = Array.new(n + 1) { [] }
m.times do
    a, b = gets.chomp.split.map(&:to_i)
    relations[b] << a
end

end_of_tree = []
(1..n).each do |i|
    end_of_tree << i if relations[i].empty?
end

puts end_of_tree.count > 1 ? -1 : end_of_tree[0]
