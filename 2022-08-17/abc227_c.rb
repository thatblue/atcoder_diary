include Math

n = gets.chomp.to_i

cbrt = Math.cbrt(n).to_i

count = 0
(1..cbrt).each do |a|
  max_b = Math.sqrt(n / a).to_i
  (a..max_b).each do |b|
    count += n / a / b - b + 1
  end
end

p count
