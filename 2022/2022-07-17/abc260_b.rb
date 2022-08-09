n, x, y, z = gets.chomp.split.map(&:to_i)
a = gets.chomp.split.map(&:to_i)
b = gets.chomp.split.map(&:to_i)

summary = []
(0..n-1).each do |index|
  summary << {"id" => index + 1, "math" => a[index], "english" => b[index], "sum" => a[index] + b[index]}
end

summary.sort! {|a, b| (b["math"] <=> a["math"]) == 0 ? a["id"] <=> b["id"] : b["math"] <=> a["math"]}

passed = summary.shift(x).map { |student| student["id"] }

summary.sort! {|a, b| (b["english"] <=> a["english"]) == 0 ? a["id"] <=> b["id"]: b["english"] <=> a["english"]}

passed += summary.shift(y).map { |student| student["id"] }

summary.sort! {|a, b| (b["sum"] <=> a["sum"]) == 0 ? a["id"] <=> b["id"] : b["sum"] <=> a["sum"]}

passed += summary.shift(z).map { |student| student["id"] }

passed.sort!

passed.each do |id|
  p id
end