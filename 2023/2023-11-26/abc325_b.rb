n = gets.chomp.to_i
WORK_STARTS_ON = 9
WORK_ENDS_ON = 18
HOURS_OF_DAY = 24

active_staff_counts = Array.new(HOURS_OF_DAY, 0)
n.times do
  staff_count, diff = gets.chomp.split.map(&:to_i)

  start_hour = HOURS_OF_DAY + WORK_STARTS_ON - diff
  end_hour = HOURS_OF_DAY + WORK_ENDS_ON - diff

  start_hour.upto(end_hour - 1) do |work_hour|
    active_staff_counts[work_hour % 24] += staff_count
  end
end

puts active_staff_counts.max
