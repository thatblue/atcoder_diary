n, m = gets.chomp.split.map(&:to_i)
s = gets.chomp

schedule_continuous_max = 0
logo_tshirts_max = 0
schedule_continuous_current = 0
logo_tshirts_current = 0
n.times do |day|
  if s[day] == '0'
    # 予定がない
    schedule_continuous_current = 0
    logo_tshirts_current = 0
  elsif s[day] == '1'
    # 食事に行く(着るものがあればどっちでもOK)
    schedule_continuous_current += 1
    schedule_continuous_max = [schedule_continuous_current, schedule_continuous_max].max
  else
    # 競プロイベントがある(ロゴTシャツ必須)
    schedule_continuous_current += 1
    logo_tshirts_current += 1
    schedule_continuous_max = [schedule_continuous_current, schedule_continuous_max].max
    logo_tshirts_max = [logo_tshirts_max, logo_tshirts_current].max
  end
end

puts [schedule_continuous_max - m, logo_tshirts_max].max
