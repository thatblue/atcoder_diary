n = gets.chomp.to_i

cumu_sleep = 0
prev_timestamp = 0
cumu_logs = []
gets.chomp.split.map.with_index do |v, i|
  wake_up = i.even?
  timestamp = v.to_i
  prev_activity_time = timestamp - prev_timestamp

  if wake_up
    if i == 0
      cumu_logs << 0
    else
      cumu_logs += (cumu_sleep..(cumu_sleep+prev_activity_time)).to_a
      cumu_sleep += timestamp - prev_timestamp
    end
  else
    cumu_logs += Array.new(prev_activity_time - 1, cumu_sleep)
  end
  prev_timestamp = timestamp
end

q = gets.chomp.to_i
q.times do
  l, r = gets.chomp.split.map(&:to_i)
  cumu_l = l == 0 ? 0 : cumu_logs[l]
  cumu_r = r == 0 ? 0 : cumu_logs[r]
  puts cumu_r - cumu_l
end
