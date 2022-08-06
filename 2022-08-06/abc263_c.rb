n, m = gets.chomp.split.map(&:to_i)

# combinationは順番が保証されていないので、本当は良くない
arrays = (1..m).to_a.combination(n).to_a

arrays.each do |array|
  puts array.join(" ")
end
