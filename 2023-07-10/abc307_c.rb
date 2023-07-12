# cf. https://atcoder.jp/contests/abc307/submissions/42920356

def read_sheet
  h, w = gets.chomp.split.map(&:to_i)
  sheet = []
  h.times do
    sheet << gets.chomp.chars.map { |v| v == '#' }
  end

  [h, w, sheet]
end

HA, WA, sheet_a = read_sheet
HB, WB, sheet_b = read_sheet
HX, WX, sheet_x = read_sheet

START_HX = 10
START_WX = 10

def inside_x?(i, j)
  i.between?(START_HX, START_HX + HX - 1) && j.between?(START_WX, START_WX + WX - 1)
end

20.times do |ai|
  20.times do |aj|
    20.times do |bi|
      20.times do |bj|
        combined = Array.new(30) { Array.new(30, false) }

        HA.times do |i|
          WA.times do |j|
            combined[ai + i][aj + j] = true if sheet_a[i][j]
          end
        end

        HB.times do |i|
          WB.times do |j|
            combined[bi + i][bj + j] = true if sheet_b[i][j]
          end
        end

        result = true
        30.times do |i|
          30.times do |j|
            if inside_x?(i, j)
              result &= combined[i][j] == sheet_x[i - START_HX][j - START_WX]
            else
              result &= !combined[i][j]
            end
          end
        end

        if result
          puts 'Yes'
          exit
        end
      end
    end
  end
end

puts 'No'
