# O(n)の解法
n, m = gets.chomp.split.map(&:to_i)
firework_days = gets.chomp.split.map(&:to_i)

prev_firework_day = 1
firework_days.each do |firework_day|
  prev_firework_day.upto(firework_day) do |day|
    puts firework_day - day
  end
  prev_firework_day = firework_day + 1
end
