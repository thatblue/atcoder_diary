def offset_position(n, i, j, direction, offset)

  offset_i = i
  offset_j = j

  (1..offset).each do
    if [0, 1, 2].include?(direction)
      offset_i = offset_i - 1 >= 0 ? offset_i - 1 : n - 1
    elsif [5, 6, 7].include?(direction)
      offset_i = offset_i + 1 < n ? offset_i + 1 : 0
    end
    if [0, 3, 5].include?(direction)
      offset_j = offset_j - 1 >= 0 ? offset_j - 1 : n - 1
    elsif [2, 4, 7].include?(direction)
      offset_j = offset_j + 1 < n ? offset_j + 1 : 0
    end
  end

  [offset_i, offset_j]
end

n = gets.chomp.to_i

a = []

start_number = 0
(1..n).each do
  a_i = gets.chomp.chars.map!(&:to_i)
  start_number = [start_number, a_i.max].max
  a << a_i
end

max_values = Array.new(n, 0)

(0..(n-1)).each do|i|
  (0..(n-1)).each do|j|
    if a[i][j] < start_number
      next
    end

    upper_i, left_j = offset_position(n, i, j, 0, 1)
    lower_i, right_j = offset_position(n, i, j, 7, 1)

    # p [i, j, upper_i, left_j, lower_i, right_j]

    second_candidates = []
    second_max = 0
    [
      a[upper_i][left_j], a[upper_i][j], a[upper_i][right_j],
      a[i][left_j], a[i][right_j],
      a[lower_i][left_j], a[lower_i][j], a[lower_i][right_j],
    ].each_with_index do |item, index|
      if second_max < item
        second_max = item
        second_candidates.clear
        second_candidates << index
      elsif second_max == item
        second_candidates << index
      end
    end

    # p [i, j, second_max, second_candidates]

    candidates = []
    second_candidates.each do |direction|
      current = [start_number, second_max]
      (2..n-1).each do |offset|
        offset_i, offset_j = offset_position(n, i, j, direction, offset)
        current << a[offset_i][offset_j]
      end
      candidates << current
    end
    current_max = candidates.max

    max_values = [max_values, current_max].max
  end
end

print max_values.join
