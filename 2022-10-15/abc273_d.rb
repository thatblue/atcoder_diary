H, W, r_s, c_s = gets.chomp.split.map(&:to_i)

GRID = Hash.new
GRID.default = true

n = gets.chomp.to_i
n.times do
  r_w, c_w = gets.chomp.split.map(&:to_i)
  GRID[[r_w,c_w]] = false
end

def move(x, y, direction, length)
  new_x, new_y = x, y
  length.times do
    tmp_x, tmp_y = new_x, new_y
    if direction == "L"
      tmp_y -= 1
    elsif direction == "R"
      tmp_y += 1
    elsif direction == "U"
      tmp_x -= 1
    else # direction == "D"
      tmp_x += 1
    end

    unless 0 < tmp_x && tmp_x <= H && 0 < tmp_y && tmp_y <= W
      break
    end

    unless GRID[[tmp_x,tmp_y]]
      break
    end
    # 今回移動出来なければ後続の移動もできないのでbreak

    new_x, new_y = tmp_x, tmp_y
  end

  [new_x, new_y]
end

q = gets.chomp.to_i
x, y = r_s, c_s
q.times do
  direction, length = gets.chomp.split
  length = length.to_i

  x, y = move(x, y, direction, length)

  puts "#{x} #{y}"
end
