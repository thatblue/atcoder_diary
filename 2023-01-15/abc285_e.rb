n = gets.chomp.to_i
array = gets.chomp.split.map(&:to_i)
array.unshift(-1)

max_prod = 0

dp = Array.new(n + 1) { Hash.new(0) }
1.upto(n - 1) do |i|
  ("1" * i + "0" * (n - i)).chars.permutation.uniq.each do |j_array|
    j = j_array.to_a.join
    holiday_days = j_array.to_a.map.with_index { |is_holiday, index| is_holiday.eql?("1") ? index + 1 : nil }.to_a.compact

    next_holiday_index = 0
    j_array.each_with_index do |is_holiday, day_index|
      if is_holiday == "1"
        next_holiday_index += 1 if i > 1
        next_holiday_index = 0 if next_holiday_index >= i
        next
      end

      prev_holiday = holiday_days[next_holiday_index]
      next_holiday = holiday_days[next_holiday_index]

      day = day_index + 1

      dp[i][j] += [array[(prev_holiday - day).abs], array[(next_holiday - day).abs]].min
    end
    max_prod = [max_prod, dp[i][j]].max
  end
end

puts max_prod
