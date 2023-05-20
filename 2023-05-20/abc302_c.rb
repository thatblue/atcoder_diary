n, M = gets.chomp.split.map(&:to_i)

strings = []

n.times do
  strings << gets.chomp
end

def diff_count(a, b)
  count = 0
  M.times do |i|
    count += 1 if a[i] != b[i]
  end

  count
end

strings.permutation.to_a.each do |order|
  previous = nil
  result = true
  order.each do |current|
    if previous.nil?
      previous = current
      next
    end

    if diff_count(previous, current) != 1
      result = false
      break
    end

    previous = current
  end

  if result
    puts 'Yes'
    exit
  end
end

puts 'No'
