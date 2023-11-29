n = gets.chomp.to_i

cumu_sleep = 0
prev_sleep_timestamp = 0
logs = {}
gets.chomp.split.map.with_index do |v, i|
  wake_up = i.even?
  timestamp = v.to_i

  if wake_up
    cumu_sleep += timestamp - prev_sleep_timestamp
  else
    prev_sleep_timestamp = timestamp
  end
  logs[timestamp] = { cumu_sleep: cumu_sleep, wake_up: wake_up }
end

q = gets.chomp.to_i

milestones = logs.keys.sort.reverse
q.times do
  l, r = gets.chomp.split.map(&:to_i)

  l_timestamp = milestones.bsearch { |x| x <= l }
  l_log = logs[l_timestamp]
  l_cumu_sleep = l_log[:cumu_sleep]
  l_cumu_sleep += (l - l_timestamp) unless l_log[:wake_up]

  r_timestamp = milestones.bsearch { |x| x <= r }
  r_log = logs[r_timestamp]
  r_cumu_sleep = r_log[:cumu_sleep]
  r_cumu_sleep += r - r_timestamp unless r_log[:wake_up]

  puts r_cumu_sleep - l_cumu_sleep
end
