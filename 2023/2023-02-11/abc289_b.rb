n, m = gets.chomp.split.map(&:to_i)

re_points = gets.chomp.split.map(&:to_i)

order = []
stack = []
1.upto(n) do |i|
    if re_points.include? i
        stack << i
        next
    end

    order << i
    if stack.length > 0
        order = order + stack.reverse
        stack = []
    end
end

puts order.join ' '
