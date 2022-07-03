k, s = gets.chomp.split.map(&:to_i)

combinations = 0
k_min = [k, s].min
(0..k_min).each do |x|
  (0..k_min).each do |y|
    z = s - x - y
    if z > k
      next
    end

    combinations += 1
    if z == 0
      break
    end
  end

  if x > k
    break
  end
end

p combinations