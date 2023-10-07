require 'ac-library-rb/priority_queue'

n = gets.chomp.to_i

slimes = Hash.new(0)
size_queue = AcLibraryRb::PriorityQueue.new { |a, b| a < b }
size_max = 0
ans = 0
n.times do
  size, count = gets.chomp.split.map(&:to_i)
  size_queue.push(size)
  slimes[size] = count
  size_max = [size_max, size].max
  ans += count
end

loop do
  current_size = size_queue.pop
  break if current_size.nil? || current_size > size_max
  next if slimes[current_size] < 2

  size_2x = current_size * 2
  count_2x = slimes[current_size] / 2

  size_queue.push(size_2x) unless slimes.include?(size_2x)

  slimes[size_2x] += count_2x
  slimes[current_size] = 1
  ans -= count_2x
  size_max = [size_max, size_2x].max
end

puts ans
