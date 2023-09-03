n = gets.chomp.to_i

areas = []
all_sheets = 0
n.times do
  takahashi, aoki, sheets = gets.chomp.split.map(&:to_i)
  kahansu = (takahashi + aoki + 1) / 2
  all_sheets += sheets
  areas << {
    sheets: sheets,
    cost: [0, kahansu - takahashi].max
  }
end

dp = Array.new(n + 1) { Array.new(all_sheets + 1, Float::INFINITY) }
dp[0][0] = 0
areas.each_with_index do |area, index|
  i = index + 1 # i = 選挙区の数
  0.upto(all_sheets) do |j| # j = 獲得できる議席数
    next if dp[i-1][j] == Float::INFINITY # このタイミングであり得ない状況であればスキップ

    # 新しく増えた選挙区を選ばない場合
    dp[i][j] = [dp[i][j], dp[i-1][j]].min
    # 新しく増えた選挙区を選ぶ場合
    dp[i][j + area[:sheets]] = [dp[i][j + area[:sheets]], dp[i-1][j] + area[:cost]].min
  end
end

all_kahansu = (all_sheets + 1) / 2

puts dp[n][all_kahansu..].min
