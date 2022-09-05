gets.chomp.to_i
classes = gets.chomp.split.map(&:to_i).sort

q = gets.chomp.to_i

q.times do
  rate = gets.chomp.to_i

  min_gte_index = classes.bsearch_index { |class_rate| class_rate >= rate }

  if min_gte_index == 0
    diff = (rate - classes[0]).abs
  elsif min_gte_index.nil?
    diff = (rate - classes[-1]).abs
  else
    diff = [(rate - classes[min_gte_index - 1]).abs, (rate - classes[min_gte_index]).abs].min
  end

  p diff
end
