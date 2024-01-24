n, s, m, l = gets.chomp.split.map(&:to_i)

def calc_max(n, v)
  div, mod = n.divmod(v)
  max = div
  max += 1 if mod.positive?

  max
end

s_max = calc_max(n, 6)
m_max = calc_max(n, 8)
l_max = calc_max(n, 12)

ans = Float::INFINITY

(0..s_max).each do |curr_s|
  (0..m_max).each do |curr_m|
    (0..l_max).each do |curr_l|
      next if curr_s * 6 + curr_m * 8 + curr_l * 12 < n

      ans = [ans, s * curr_s + m * curr_m + l * curr_l].min
    end
  end
end

puts ans
