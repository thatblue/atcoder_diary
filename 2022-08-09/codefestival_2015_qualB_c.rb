n, m = gets.chomp.split.map(&:to_i)

capacities = gets.chomp.split.map(&:to_i).sort {|a, b| b <=> a }
reservations = gets.chomp.split.map(&:to_i).sort {|a, b| b <=> a }

if n < m
  # 部屋数より予約数が多い場合は絶対に部屋の割り当てが出来ない
  puts "NO"
  exit
end

reservations.each do |reservation|
  largest_capacity = capacities.shift
  if reservation > largest_capacity
    puts "NO"
    exit
  end
end

puts "YES"