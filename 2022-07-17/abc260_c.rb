n, x, y = gets.chomp.split.map(&:to_i)

red_gems = Array.new(n + 1, 0)
red_gems[n] = 1
blue_gems = Array.new(n + 1, 0)

def operate_a(red_gems, blue_gems, n, x)
  n.downto(2) do |level|
    current_level_red_gems = red_gems[level]
    if current_level_red_gems == 0
      next
    end

    red_gems[level - 1] += current_level_red_gems
    red_gems[level] = 0
    blue_gems[level] = x * current_level_red_gems
    break
  end

  [red_gems, blue_gems]
end

def operate_b(red_gems, blue_gems, n, y)
  n.downto(2) do |level|
    current_level_blue_gems = blue_gems[level]
    if current_level_blue_gems == 0
      next
    end

    red_gems[level - 1] += current_level_blue_gems
    blue_gems[level - 1] = y * current_level_blue_gems
    blue_gems[level] = 0
  end

  [red_gems, blue_gems]
end

loop do
  if red_gems[2..n].sum == 0 && blue_gems[2..n].sum == 0
    break
  end
  red_gems_a = red_gems_b = red_gems
  blue_gems_a = blue_gems_b = blue_gems

  if red_gems[2..n].sum > 0
    red_gems_a, blue_gems_a = operate_a(red_gems, blue_gems, n, x)
  end

  if blue_gems[2..n].sum > 0
    red_gems_b, blue_gems_b = operate_b(red_gems, blue_gems, n, y)
  end

  if (red_gems_a + blue_gems_a).sum > (red_gems_b + blue_gems_b).sum
    red_gems = red_gems_a
    blue_gems = blue_gems_a
  else
    red_gems = red_gems_b
    blue_gems = blue_gems_b
  end
end

p red_gems
p blue_gems

p blue_gems[1]