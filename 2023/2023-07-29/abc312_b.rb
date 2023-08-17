n, m = gets.chomp.split.map(&:to_i)

$grid = []
n.times do |i|
  $grid << gets.chomp.chars
end

def is_top_left?()

end

def is_tak_code?(start_i, start_j)
  (start_i..start_i+8).each do |i|
    (start_j..start_j+8).each do |j|
      if i <= start_i + 3 && j <= start_j + 3
        # 左上エリア
        if i < start_i + 3 && j < start_j + 3
          return false if $grid[i][j] == '.'
        else
          return false if $grid[i][j] == '#'
        end
      elsif i >= start_i + 5 && j >= start_j + 5
        # 右下エリア
        if i > start_i + 5 && j > start_j + 5
          return false if $grid[i][j] == '.'
        else
          return false if $grid[i][j] == '#'
        end
      end
    end
  end

  return true
end


ans = []
(0..(n-9)).each do |i|
  (0..(m-9)).each do |j|
    next if $grid[i][j] == '.'

    ans << [i + 1, j + 1] if is_tak_code?(i, j)
  end
end

ans.each do |pos|
  puts pos.join ' '
end
