n = gets.chomp.to_i

RUNNERS = []
n.times do
  RUNNERS << gets.chomp.split.map(&:to_i)
end

RUNNERS.unshift([])

m = gets.chomp.to_i

BAD_PAIRS = Array.new(n + 1) { Array.new(n + 1, false) }
m.times do
  a, b = gets.chomp.split.map(&:to_i)
  BAD_PAIRS[a][b] = true
  BAD_PAIRS[b][a] = true
end

ans = Float::INFINITY
(1..n).to_a.permutation.each do |order|
  current_time = 0
  previous_runner = nil
  bad_order = false
  order.each_with_index do |runner, current_order|
    unless previous_runner.nil?
      if BAD_PAIRS[previous_runner][runner]
        bad_order = true
        break
      end
    end

    current_time += RUNNERS[runner][current_order]

    previous_runner = runner
  end

  if bad_order
    next
  end

  ans = [ans, current_time].min
end

p ans == Float::INFINITY ? -1 : ans
