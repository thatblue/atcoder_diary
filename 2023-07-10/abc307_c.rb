# cf. https://atcoder.jp/contests/abc307/submissions/42920356

def read_sheet
  h, w = gets.chomp.split.map(&:to_i)
  sheet = []
  h.times do
    sheet << gets.chomp.chars.map { |v| v == '#' ? '1' : '0' }.join.to_i(2)
  end

  [h, w, sheet]
end

HA, WA, sheet_a = read_sheet
HB, WB, sheet_b = read_sheet
HX, WX, tmp = read_sheet

sheet_x = Array.new(10, 0)
HX.times do |i|
  sheet_x << (tmp[i].to_s(2) + '0' * (20 - WX)).to_i(2)
end
sheet_x += Array.new(20 - HX, 0)

START_HX = 10
START_WX = 10

(START_HX - HA + 1).upto(19) do |ai|
  (START_WX - WA + 1).upto(19) do |aj|
    (START_HX - HB + 1).upto(19) do |bi|
      (START_WX - WB + 1).upto(19) do |bj|
        combined = Array.new(30, 0)

        HA.times do |i|
          combined[ai + i] |= sheet_a[i] << (30 - (aj + WA))
        end

        HB.times do |i|
          combined[bi + i] |= sheet_b[i] << (30 - (bj + WB))
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
