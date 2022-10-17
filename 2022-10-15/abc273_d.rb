H, W, r_s, c_s = gets.chomp.split.map(&:to_i)

x_walls = Hash.new {|hash, key| hash[key] = []}
y_walls = Hash.new {|hash, key| hash[key] = []}

n = gets.chomp.to_i
n.times do
  r_w, c_w = gets.chomp.split.map(&:to_i)
  x_walls[r_w] << c_w
  y_walls[c_w] << r_w
end

x_walls.each do |_, walls|
  walls.sort!
end

y_walls.each do |_, walls|
  walls.sort!
end

def move(x, y, direction, length, x_wall, y_wall)
  new_x, new_y = x, y

  if direction == "L"
    tmp_y = [1, new_y - length].max
    if x_wall[new_x].length > 0
      # 現在位置(new_y)のすぐ右側にある壁を探す
      next_wall_index = x_wall[new_x].bsearch_index { |pos| pos > new_y }
      if next_wall_index.nil?
        # 現在位置より右の壁がないので、一番右端の壁をチェック
        previous_index = x_wall[new_x].length - 1
        tmp_y = [tmp_y, x_wall[new_x][previous_index] + 1].max
      elsif next_wall_index > 0
        # 進行方向に壁がありそうなら検証
        previous_index = next_wall_index - 1
        tmp_y = [tmp_y, x_wall[new_x][previous_index] + 1].max
      end
      # 現在位置より右の壁が一番最初の壁＝進行方向には壁がないので壁チェック不要
    end
    new_y = tmp_y
  elsif direction == "R"
    tmp_y = [new_y + length, W].min
    # 現在位置(new_y)のすぐ右側にある壁を探す
    wall_pos = x_wall[new_x].bsearch { |pos| pos > new_y }
    unless wall_pos.nil?
      # 進行方向に壁があるなら検証
      tmp_y = [tmp_y, wall_pos - 1].min
    end
    new_y = tmp_y
  elsif direction == "U"
    tmp_x = [1, new_x - length].max
    if y_wall[new_y].length > 0
      next_wall_index = y_wall[new_y].bsearch_index { |pos| pos > new_x }
      if next_wall_index.nil?
        previous_index = y_wall[new_y].length - 1
        tmp_x = [tmp_x, y_wall[new_y][previous_index] + 1].max
      elsif next_wall_index > 0
        previous_index = next_wall_index - 1
        tmp_x = [tmp_x, y_wall[new_y][previous_index] + 1].max
      end
    end
    new_x = tmp_x
  else # direction == "D"
    tmp_x = [new_x + length, H].min
    wall_pos = y_wall[new_y].bsearch { |pos| pos > new_x }
    unless wall_pos.nil?
      tmp_x = [tmp_x, wall_pos - 1].min
    end
    new_x = tmp_x
  end

  [new_x, new_y]
end

q = gets.chomp.to_i
x, y = r_s, c_s
q.times do
  direction, length = gets.chomp.split
  length = length.to_i

  x, y = move(x, y, direction, length, x_walls, y_walls)

  puts "#{x} #{y}"
end
