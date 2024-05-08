# 概ね解説コードの写経
# cf. https://atcoder.jp/contests/abc343/editorial/9435

SUM_OF_CUBES = 3 * 7**3
v1, v2, v3 = gets.chomp.split.map(&:to_i)

# 面積の合計がSUM_OF_CUBESに一致しなければ絶対に成立しない
if v1 + v2 * 2 + v3 * 3 != SUM_OF_CUBES
  puts 'No'
  exit
end

def volume_double(a, b)
  x_length = [0, [a[:x], b[:x]].min + 7 - [a[:x], b[:x]].max].max
  y_length = [0, [a[:y], b[:y]].min + 7 - [a[:y], b[:y]].max].max
  z_length = [0, [a[:z], b[:z]].min + 7 - [a[:z], b[:z]].max].max

  x_length * y_length * z_length
end

def volume_triple(a, b, c)
  x_length = [0, [a[:x], b[:x], c[:x]].min + 7 - [a[:x], b[:x], c[:x]].max].max
  y_length = [0, [a[:y], b[:y], c[:y]].min + 7 - [a[:y], b[:y], c[:y]].max].max
  z_length = [0, [a[:z], b[:z], c[:z]].min + 7 - [a[:z], b[:z], c[:z]].max].max

  x_length * y_length * z_length
end

# aの位置は固定できるので、bとcの座標のみ動かしていく
8.times do |b_x|
  8.times do |b_y|
    8.times do |b_z|
      (-6..7).each do |c_x|
        (-6..7).each do |c_y|
          (-6..7).each do |c_z|
            current_v3 = volume_triple({ x: 0, y: 0, z: 0 }, { x: b_x, y: b_y, z: b_z }, { x: c_x, y: c_y, z: c_z })

            double_ab = volume_double({ x: 0, y: 0, z: 0 }, { x: b_x, y: b_y, z: b_z })
            double_bc = volume_double({ x: b_x, y: b_y, z: b_z }, { x: c_x, y: c_y, z: c_z })
            double_ac = volume_double({ x: 0, y: 0, z: 0 }, { x: c_x, y: c_y, z: c_z })
            current_v2 = double_ab + double_bc + double_ac - current_v3 * 3

            next if current_v2 != v2 || current_v3 != v3

            puts 'Yes'
            puts [0, 0, 0, b_x, b_y, b_z, c_x, c_y, c_z].join ' '
            exit
          end
        end
      end
    end
  end
end

puts 'No'
