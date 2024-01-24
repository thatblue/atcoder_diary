n = gets.chomp.to_i
array = gets.chomp.split.map(&:to_i)
sorted = array.sort

total = 0
cumu_sum = sorted.map { |v| total += v }

ans = []
array.each do |num|
  larger_index = sorted.bsearch_index { |v| num < v }
  ans << (larger_index.nil? ? 0 : total - cumu_sum[larger_index - 1])
end

puts ans.join ' '
