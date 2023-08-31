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
  logs[timestamp] = { cumu_sleep: cumu_sleep, wake_up: wake_up, prev_sleep_timestamp: prev_sleep_timestamp }
end

q = gets.chomp.to_i

milestones = logs.keys
q.times do
  l, r = gets.chomp.split.map(&:to_i)

  l_index = milestones.bsearch_index { |x| x > l }
  l_index ||= -1
  r_index = milestones.bsearch_index { |x| x >= r }
  r_index ||= -1

  l_timestamp = milestones[l_index]
  r_timestamp = milestones[r_index]

  l_cumu_sleep = logs[l_timestamp][:cumu_sleep]
  l_cumu_sleep -= l - logs[l_timestamp][:prev_sleep_timestamp] if logs[l_timestamp][:wake_up]

  r_cumu_sleep = logs[r_timestamp][:cumu_sleep]
  r_cumu_sleep -= r_timestamp - r if logs[r_timestamp][:wake_up]

  puts r_cumu_sleep - l_cumu_sleep
end
