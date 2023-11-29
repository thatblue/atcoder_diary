n, m = gets.chomp.split.map(&:to_i)

pairs = Array.new(n + 1) { Array.new(n + 1, true) }
m.times do
  prev = nil
  gets.chomp.split.map(&:to_i).each do |current|
    if prev.nil?
      prev = current
      next
    end

    pairs[prev][current] = false
    pairs[current][prev] = false
    prev = current
  end
end

ans = 0
(1..n).each do |i|
  (i+1..n).each do |j|
    next if i == j

    ans += 1 if pairs[i][j]
  end
end

puts ans
