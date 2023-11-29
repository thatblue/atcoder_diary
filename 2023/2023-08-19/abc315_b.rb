m = gets.chomp.to_i
days = gets.chomp.split.map(&:to_i)
days_of_year = days.sum
middle_day = days_of_year / 2 + 1

cumu_days = 0
days.each_with_index do |days_of_month, i|
  month = i + 1
  if cumu_days + days_of_month >= middle_day
    puts [month, middle_day - cumu_days].join ' '
    exit
  end

  cumu_days += days_of_month
end
