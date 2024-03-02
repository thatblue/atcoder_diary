SUM_OF_CUBES = 3 * 7**3
@volumes = gets.chomp.split.map(&:to_i)
@volumes.unshift 0

# 面積の合計が一致しなければ絶対に成立しない
if @volumes[1] + @volumes[2] * 2 + @volumes[3] * 3 != SUM_OF_CUBES
  puts 'No'
  exit
end

def find(b, c)
  imos = Array.new(15) { Array.new(15) { Array.new(15, 0) } }
  # 位置関係が決まれば全体的にどこにあるかは本質的な問題ではないので、aの座標は固定して扱う
  imos[0][0][0] = 1
  imos[7][7][7] = -1
  imos[b[:x]][b[:y]][b[:z]] += 1
  imos[b[:x] + 7][b[:y] + 7][b[:z] + 7] -= 1
  imos[c[:x]][c[:y]][c[:z]] += 1
  imos[c[:x] + 7][c[:y] + 7][c[:z] + 7] -= 1

  # x方向への累積和
  z = 0
  while z <= 14
    y = 0
    while y <= 14
      x = 1
      while x <= 14
        imos[x][y][z] += imos[x-1][y][z]
        x += 1
      end
      y += 1
    end
    z += 1
  end

  # y方向への累積和
  z = 0
  while z <= 14
    y = 1
    while y <= 14
      x = 0
      while x <= 14
        imos[x][y][z] += imos[x][y-1][z]
        x += 1
      end
      y += 1
    end
    z += 1
  end


  # z方向への累積和
  z = 1
  while z <= 14
    y = 0
    while y <= 14
      x = 0
      while x <= 14
        imos[x][y][z] += imos[x][y][z-1]
        x += 1
      end
      y += 1
    end
    z += 1
  end

  counts = { 0 => 0, 1 => 0, 2 => 0, 3 => 0 }

  z = 0
  while z <= 13
    y = 0
    while y <= 13
      x = 0
      while x <= 13
        counts[imos[x][y][z]] += 1
        return false if imos[x][y][z].positive? && counts[imos[x][y][z]] > @volumes[imos[x][y][z]]
      end
      y += 1
    end
    z += 1
  end

  true
end

visited = Hash.new { |hash, key| hash[key] = {} }

b_x = 0
while b_x <= 7
  b_y = 0
  while b_y <= 7
    b_z = 0
    while b_z <= 7
      c_x = 0
      while c_x <= 7
        c_y = 0
        while c_y <= 7
          c_z = 0
          while c_z <= 7
            b_id = b_x**7 + b_y * 7 + b_z
            c_id = c_x**7 + c_y * 7 + c_z
            next if visited[c_id][b_id]

            if find({ x: b_x, y: b_y, z: b_z }, { x: c_x, y: c_y, z: c_z })
              puts 'Yes'
              puts ([0, 0, 0] + [b_x, b_y, b_z] + [c_x, c_y, c_z]).join ' '
              exit
            end
            visited[b_id][c_id] = true
            pp visited
            c_z += 1
          end
          c_y += 1
        end
        c_x += 1
      end
      b_z += 1
    end
    b_y += 1
  end
  b_x += 1
end

puts 'No'
