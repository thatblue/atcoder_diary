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
HX, WX, tmp = read_sheet

sheet_x = Array.new(10) { Array.new(30, false) }
HX.times do |i|
  sheet_x << Array.new(10, false) + tmp[i] + Array.new(20 - WX, false)
end
sheet_x += Array.new(20 - HX) { Array.new(30, false) }

START_HX = 10
START_WX = 10

def inside_x?(i, j)
  i.between?(START_HX, START_HX + HX - 1) && j.between?(START_WX, START_WX + WX - 1)
end

(START_HX - HA + 1).upto(19) do |ai|
  (START_WX - WA + 1).upto(19) do |aj|
    (START_HX - HB + 1).upto(19) do |bi|
      (START_WX - WB + 1).upto(19) do |bj|
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

        if combined == sheet_x
          puts 'Yes'
          exit
        end
      end
    end
  end
end

puts 'No'
