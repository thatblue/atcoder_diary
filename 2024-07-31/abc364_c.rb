SWEETNESS = 0
SALTY = 1

n, limit_of_sweet, limit_of_salty = gets.chomp.split.map(&:to_i)
sweetness_array = gets.chomp.split.map(&:to_i)
salty_array = gets.chomp.split.map(&:to_i)

tastes = sweetness_array.zip(salty_array)

# 甘い順に並べて限界まで食べてみる
ans_by_more_sweet = 0
sweet = 0
salty = 0
tastes.sort_by { |v| -v[SWEETNESS] }.each do |dish|
  ans_by_more_sweet += 1
  sweet += dish[SWEETNESS]
  salty += dish[SALTY]
  break if sweet > limit_of_sweet || salty > limit_of_salty
end

# しょっぱい順に並べて限界まで食べてみる
ans_by_more_salty = 0
sweet = 0
salty = 0
tastes.sort_by { |v| -v[SALTY] }.each do |dish|
  ans_by_more_salty += 1
  sweet += dish[SWEETNESS]
  salty += dish[SALTY]
  break if sweet > limit_of_sweet || salty > limit_of_salty
end

# より少なかった方を答えとする
puts [ans_by_more_sweet, ans_by_more_salty].min
