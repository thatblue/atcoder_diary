H, W = gets.chomp.split.map(&:to_i)

$grid = []
H.times do
  $grid << gets.chomp.chars
end

def in_grid?(i, j)
  i >= 0 && i < H && j >= 0 && j < W
end

def is_char?(char, i, j)
  in_grid?(i, j) && $grid[i][j] == char
end

H.times do |i|
  W.times do |j|
    if $grid[i][j] == 's'
      if is_char?('n', i + 1, j) && is_char?('u', i + 2, j) && is_char?('k', i + 3, j) && is_char?('e', i + 4, j)
        puts "#{i + 1} #{j + 1}"
        puts "#{i + 2} #{j + 1}"
        puts "#{i + 3} #{j + 1}"
        puts "#{i + 4} #{j + 1}"
        puts "#{i + 5} #{j + 1}"
        exit
      elsif is_char?('n', i, j + 1) && is_char?('u', i, j + 2) && is_char?('k', i, j + 3) && is_char?('e', i, j + 4)
        puts "#{i + 1} #{j + 1}"
        puts "#{i + 1} #{j + 2}"
        puts "#{i + 1} #{j + 3}"
        puts "#{i + 1} #{j + 4}"
        puts "#{i + 1} #{j + 5}"
        exit
      elsif is_char?('n', i + 1, j + 1) && is_char?('u', i + 2, j + 2) && is_char?('k', i + 3, j + 3) && is_char?('e', i + 4, j + 4)
        puts "#{i + 1} #{j + 1}"
        puts "#{i + 2} #{j + 2}"
        puts "#{i + 3} #{j + 3}"
        puts "#{i + 4} #{j + 4}"
        puts "#{i + 5} #{j + 5}"
        exit
      elsif is_char?('n', i + 1, j - 1) && is_char?('u', i + 2, j - 2) && is_char?('k', i + 3, j - 3) && is_char?('e', i + 4, j - 4)
        puts "#{i + 1} #{j + 1}"
        puts "#{i + 2} #{j}"
        puts "#{i + 3} #{j - 1}"
        puts "#{i + 4} #{j - 2}"
        puts "#{i + 5} #{j - 3}"
        exit
      end
    elsif $grid[i][j] == 'e'
      if is_char?('k', i + 1, j) && is_char?('u', i + 2, j) && is_char?('n', i + 3, j) && is_char?('s', i + 4, j)
        puts "#{i + 5} #{j + 1}"
        puts "#{i + 4} #{j + 1}"
        puts "#{i + 3} #{j + 1}"
        puts "#{i + 2} #{j + 1}"
        puts "#{i + 1} #{j + 1}"
        exit
      elsif is_char?('k', i, j + 1) && is_char?('u', i, j + 2) && is_char?('n', i, j + 3) && is_char?('s', i, j + 4)
        puts "#{i + 1} #{j + 5}"
        puts "#{i + 1} #{j + 4}"
        puts "#{i + 1} #{j + 3}"
        puts "#{i + 1} #{j + 2}"
        puts "#{i + 1} #{j + 1}"
        exit
      elsif is_char?('k', i + 1, j + 1) && is_char?('u', i + 2, j + 2) && is_char?('n', i + 3, j + 3) && is_char?('s', i + 4, j + 4)
        puts "#{i + 5} #{j + 5}"
        puts "#{i + 4} #{j + 4}"
        puts "#{i + 3} #{j + 3}"
        puts "#{i + 2} #{j + 2}"
        puts "#{i + 1} #{j + 1}"
        exit
      elsif is_char?('k', i + 1, j - 1) && is_char?('u', i + 2, j - 2) && is_char?('n', i + 3, j - 3) && is_char?('s', i + 4, j - 4)
        puts "#{i + 5} #{j - 3}"
        puts "#{i + 4} #{j - 2}"
        puts "#{i + 3} #{j - 1}"
        puts "#{i + 2} #{j}"
        puts "#{i + 1} #{j + 1}"
        exit
      end
    end
  end
end

