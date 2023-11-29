n = gets.chomp.to_i

array = gets.chomp.split.map(&:to_i)

average, mod = array.sum.divmod(n)

under_average = 0
over_average = 0
over_average_count = 0
array.each do |value|
    under_average += average - value if value < average
    over_average += value - average if average < value
    over_average_count += 1 if average < value
end

if over_average_count >= mod
    puts under_average
    exit
end

# 平均ぴったりよりも増やす必要がある
puts over_average - over_average_count
