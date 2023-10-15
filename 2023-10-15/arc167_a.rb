n, m = gets.chomp.split.map(&:to_i)
toasts = gets.chomp.split.map(&:to_i).sort.reverse

two_toasts_plate_count = n - m
one_toast_plate_count = m - two_toasts_plate_count

ans = 0
ans += toasts[0...one_toast_plate_count].map { |v| v ** 2 }.sum if one_toast_plate_count.positive?

if two_toasts_plate_count.positive?
  target_toasts = toasts[one_toast_plate_count..]
  two_toasts_plate_count.times do
    current_max = target_toasts.shift
    current_min = target_toasts.pop

    ans += (current_max + current_min) ** 2
  end
end

puts ans
