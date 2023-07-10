h_a, w_a = gets.chomp.split.map(&:to_i)
sheet_a = []
h_a.times do
  sheet_a << gets.chomp.chars.map { |v| v == '#' }
end

h_b, w_b = gets.chomp.split.map(&:to_i)
sheet_b = []
h_b.times do
  sheet_b << gets.chomp.chars.map { |v| v == '#' }
end

h_x, w_x = gets.chomp.split.map(&:to_i)
sheet_x = []
h_x.times do
  sheet_x << gets.chomp.chars.map { |v| v == '#' }
end

height = ([h_a, h_b].max - 1) * 2 + h_x
width = ([w_a, w_b].max - 1) * 2 + w_x
h_start = [h_a, h_b].max - 1
h_end = h_start + h_x - 1
w_start = [w_a, w_b].max - 1
w_end = w_start + w_x - 1

offset_h_a = height - h_a
offset_w_a = width - w_a
offset_h_b = height - h_b
offset_w_b = width - w_b

def black?(sheet, h, w, i, j)
  return false unless i.between?(0, h - 1) && j.between?(0, w - 1)

  sheet[i][j]
end

0.upto(offset_h_a) do |i_a|
  0.upto(offset_w_a) do |j_a|
    0.upto(offset_h_b) do |i_b|
      0.upto(offset_w_b) do |j_b|
        success = true

        height.times do |i|
          width.times do |j|
            a_is_black = black?(sheet_a, h_a, w_a, i - i_a, j - j_a)
            b_is_black = black?(sheet_b, h_b, w_b, i - i_b, j - j_b)
            if i.between?(h_start, h_end) && j.between?(w_start, w_end)
              success &= sheet_x[i - h_start][j - w_start] == a_is_black || b_is_black
            else
              success &= !a_is_black && !b_is_black
            end

            break unless success
          end
          break unless success
        end

        if success
          puts 'Yes'
          exit
        end
      end
    end
  end
end

puts 'No'
