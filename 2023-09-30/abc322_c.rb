n, m = gets.chomp.split.map(&:to_i)
firework_days = gets.chomp.split.map(&:to_i)

1.upto(n) do |day|
  next_firework_day = firework_days.bsearch { |v| day <= v }
  puts next_firework_day - day
end
