n, q = gets.chomp.split.map(&:to_i)

heights = gets.chomp.split.map(&:to_i)
inconvenience = 0
(n-1).times do |i|
  inconvenience += (heights[i] - heights[i + 1]).abs
end
imos = Array.new(n, 0)

def diff(l_init, l_diff, r_init, r_diff, new_diff)
  current_l = l_init + l_diff
  current_r = r_init + r_diff

  if current_l < current_r
    # 高くなる
    if new_diff > 0
      return new_diff
    else
      return ((current_l - current_r).abs - new_diff).abs
    end
  else
    # 低くなる
    if new_diff < 0
      return new_diff
    else
      return ((current_l - current_r).abs - new_diff).abs
    end
  end
end

q.times do
  l, r, v = gets.chomp.split.map(&:to_i)
  l_index = l - 1
  r_index = r - 1

  if l_index > 0
    inconvenience += diff(heights[l_index - 1], imos[l_index - 1], heights[l_index], imos[l_index], v)
  end

  if r_index < n - 1
    inconvenience += diff(heights[r_index], imos[r_index], heights[r_index + 1], imos[r_index + 1], -v)
  end

  puts inconvenience

  l_index.upto(r_index) do |index|
    imos[index] += v
  end
end