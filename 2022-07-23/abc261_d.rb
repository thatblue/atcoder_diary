n, m = gets.chomp.split.map(&:to_i)
x = gets.chomp.split.map(&:to_i)

x.unshift(0)

bonuses = []
total_bonus = 0

m.times do
  count, bonus = gets.chomp.split.map(&:to_i)
  total_bonus += bonus

  bonuses << [count, total_bonus]
end

best_money = 0
m.times do |i|
  # Ci回目のボーナスを狙い続けて成功した場合の総額を出す
  bonus_count, total_bonus = bonuses[i]

  reach_i_times, mod = n.divmod(bonus_count + 1)

  # 基本の報酬の計算
  max_reset_count = (reach_i_times - 1) * (bonus_count + 1)
  total_base_money = 0
  x.each_with_index do |x_i, count|
    if max_reset_count >= count && count % (bonus_count + 1) == 0
      next
    end
    total_base_money += x_i
  end

  # ボーナス部分の計算
  total_bonus_money = (reach_i_times - 1) * total_bonus

  final_bonus_index = bonuses.bsearch_index {|bonus| bonus[0] > bonus_count + mod }
  final_bonus_index ||= -1

  total_bonus_money += bonuses[final_bonus_index][2]

  best_money = [best_money, total_base_money + total_bonus_money].max
end

p best_money
