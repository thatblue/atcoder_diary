include Math

n = gets.chomp.to_i
performances = gets.chomp.split.map(&:to_i)

max_index = nil
max_perf = -1

performances.each_with_index do |perf, index|
  if max_perf < perf
    max_index = index
    max_perf = perf
  end
end

max_rate = -Float::INFINITY
max_contests = 0
(0..max_index).each do |start_index|
  current_perf = 0
  picked = []
  performances[start_index..max_index].each do |perf|
    if current_perf< perf
      current_perf = perf
      picked << perf
    end
  end

  next if max_contests > picked.count

  max_contests = [picked.count, max_contests].max

  k = picked.count
  warareru = 0.to_f
  waru = 0.to_f
  picked.each_with_index do |perf, index|
    i = index + 1
    warareru += 0.9 ** (k - i) * perf
    waru += 0.9 ** (k - i)
  end

  max_rate = [
    warareru / waru - 1200 / Math.sqrt(k),
    max_rate
  ].max
end

puts max_rate
