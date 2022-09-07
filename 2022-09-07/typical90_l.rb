require 'set'

H, W = gets.chomp.split.map(&:to_i)

q = gets.chomp.to_i

def is_movable(row, col, area)
  if row > 0 && area.include?([row-1, col])
    return true
  elsif col > 0 && area.include?([row, col-1])
    return true
  elsif row < H && area.include?([row+1, col])
    return true
  elsif col < W && area.include?([row, col+1])
    return true
  end

  false
end

red_areas = []
q.times do
  query = gets.chomp.split.map(&:to_i)

  if query[0] == 1
    row, col = query[1..2]

    new_red_areas = []
    new_red_area = Set.new([[row, col]])
    red_areas.each do |red_area|
      if is_movable(row, col, red_area)
        new_red_area.merge(red_area)
      else
        new_red_areas << red_area
      end
    end

    new_red_areas << new_red_area
    red_areas = new_red_areas
  elsif query[0] == 2
    a_row, a_col, b_row, b_col = query[1..4]

    detected_common_area = false
    red_areas.each do |red_area|
      if red_area.include?([a_row, a_col]) && red_area.include?([b_row, b_col])
        detected_common_area = true
        break
      end
    end

    puts detected_common_area ? "Yes" : "No"
  end
end
