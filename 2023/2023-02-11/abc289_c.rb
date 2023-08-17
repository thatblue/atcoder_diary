n, m = gets.chomp.split.map(&:to_i)

sets = []
m.times do
    gets.chomp.to_i
    set = gets.chomp.split.map(&:to_i)
    bit = Array.new(n, 0)
    set.each do |i|
        bit[i - 1] = 1
    end
    sets << bit.join.to_i(2)
end
 
ans = 0
full_bit = ('1' * n).to_i(2)
1.upto(m) do |num|
    sets.combination(num) do |group|
        sum = 0
        group.each do |part|
            sum |= part
        end

        ans += 1 if sum == full_bit
    end
end

puts ans
