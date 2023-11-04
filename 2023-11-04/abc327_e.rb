include Math

n = gets.chomp.to_i
performances = gets.chomp.split.map(&:to_i)

def max_perf_and_index(performances)
  max_index = nil
  max_perf = -1

  performances.each_with_index do |perf, index|
    if max_perf < perf
      max_index = index
      max_perf = perf
    end
  end

  [max_index, max_perf]
end

max_index = n
picked_perfs = []
3.times do
  max_index, max_perf = max_perf_and_index(performances[0..max_index - 1])
  picked_perfs.unshift max_perf

  if max_index == 0
    break
  end
end

k = picked_perfs.count
warareru = 0.to_f
waru = 0.to_f
picked_perfs.each_with_index do |perf, index|
  i = index + 1
  warareru += 0.9 ** (k - i) * perf
  waru += 0.9 ** (k - i)
end

puts warareru / waru - 1200 / Math.sqrt(k)
