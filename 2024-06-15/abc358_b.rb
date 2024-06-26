N, A = gets.chomp.split.map(&:to_i)
visit_times = gets.chomp.split.map(&:to_i)

time = 0

visit_times.each do |visit_time|
  if time < visit_time
    # 既に空いている
    time = visit_time + A
  elsif time == visit_time
    # ちょうど終わったところ
    time += A
  else
    # まだ前の人がいる
    time += A
  end

  puts time
end
