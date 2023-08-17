n, d = gets.chomp.split.map(&:to_i)

tmp_result = 2**(d + 1) - 1
n.times do
  schedule = gets.chomp.chars.map { |v| v == 'o' ? '1' : '0' }.join.to_i(2)

  tmp_result &= schedule
end

schedule_all = tmp_result.to_s(2).chars.map(&:to_i)

current_continuous = 0
max_continuous = 0
schedule_all.each do |day|
  current_continuous += 1 if day == 1
  current_continuous = 0 if day == 0

  max_continuous = [max_continuous, current_continuous].max
end

puts max_continuous
