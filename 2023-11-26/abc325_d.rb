n = gets.chomp.to_i

timeline = Hash.new(0)
end_of_timeline = 0

n.times do
  t, d = gets.chomp.split.map(&:to_i)
  timeline[t] += 1
  timeline[t + d + 1] -= 1
  end_of_timeline = [end_of_timeline, t + d + 1].max
end

events_time = timeline.keys.sort

ans = 0
before_print = 0
after_print = 0
prev_time = 0
events_time.each do |time|
  if timeline[time].positive?
    # 増やす
    before_print += timeline[time]

    print_count = [time - prev_time, before_print].min

    before_print -= print_count
    after_print += print_count
    ans += print_count

    prev_time = time
  else
    # 減らす
    print_count = [time - prev_time, before_print].min
    if print_count.positive?
      before_print -= print_count
      after_print += print_count
      ans += print_count

      prev_time = time
    end

    if after_print < timeline[time].abs
      before_print -= (timeline[time].abs - after_print)
      after_print = 0
    else
      after_print += timeline[time]
    end
  end
end

puts ans
