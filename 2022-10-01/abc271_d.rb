n, s = gets.chomp.split.map(&:to_i)

cards = []
n.times do
  cards << gets.chomp.split.map(&:to_i)
end

if n == 1
  if cards[0][0] == s
    puts 'Yes'
    puts 'H'
  elsif cards[0][1] == s
    puts 'Yes'
    puts 'T'
  else
    puts 'No'
  end

  exit
end

dp = Array.new(n + 1) { Array.new(s + 1) { Array.new(2, false) } }
dp[0][0][0] = true
dp[0][0][1] = true

1.upto(n) do |i|
  dp[i][0][0] = false
  dp[i][0][1] = false
  1.upto(s) do |j|
    # 表を選んで成立するかどうか
    head_value = cards[i - 1][0]
    dp[i][j][0] = dp[i - 1][j - head_value][0] || dp[i - 1][j - head_value][1]

    # 裏を選んで成立するかどうか
    tail_value = cards[i - 1][1]
    dp[i][j][1] = dp[i - 1][j - tail_value][0] || dp[i - 1][j - tail_value][1]
  end
end

result = dp[n][s][0] || dp[n][s][1]

puts result ? 'Yes' : 'No'

unless result
  exit
end

card_assigns = []
cumu_sum = 0
(n).downto(1) do |i|
  if dp[i][s - cumu_sum][0]
    card_assigns.unshift('H')
    cumu_sum += cards[i - 1][0]
  else
    card_assigns.unshift('T')
    cumu_sum += cards[i - 1][1]
  end
end

puts card_assigns.join
