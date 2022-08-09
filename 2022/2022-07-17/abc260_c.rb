n, x, y = gets.chomp.split.map(&:to_i)

red_gems = Array.new(n + 1, 0)
red_gems[n] = 1
blue_gems = Array.new(n + 1, 0)

n.downto(2) do |current_lv|
  # 赤い宝石に対する処理
  current_red_gems = red_gems[current_lv]
  red_gems[current_lv] = 0
  red_gems[current_lv - 1] += current_red_gems
  blue_gems[current_lv] += current_red_gems * x

  # 青い宝石に対する処理
    current_blue_gems = blue_gems[current_lv]
    blue_gems[current_lv] = 0
    red_gems[current_lv - 1] += current_blue_gems
    blue_gems[current_lv - 1] += current_blue_gems * y
end

p blue_gems[1]