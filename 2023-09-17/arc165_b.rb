require 'ac-library-rb/priority_queue'

n, k = gets.chomp.split.map(&:to_i)

array = gets.chomp.split.map(&:to_i)

if k == 1
  puts array.join ' '
  exit
end

if n == k
  puts array.sort.join ' '
  exit
end

start_max_index = n - k

latest_decrease_index = nil
prev_value = nil
array[0..start_max_index].each_with_index do |value, i|
  prev_value ||= value
  latest_decrease_index = i if prev_value > value
end

latest_decrease_index ||= 0

ans = []
after_sort_ans = []
sort_queue = AcLibraryRb::PriorityQueue.new { |a, b| a < b }
array.each_with_index do |value, i|
  if i < latest_decrease_index
    ans << value
  elsif i < latest_decrease_index + k
    sort_queue.push(value)
  else
    after_sort_ans << value
  end
end

until sort_queue.empty?
  ans << sort_queue.pop
end

ans += after_sort_ans

puts ans.join ' '
