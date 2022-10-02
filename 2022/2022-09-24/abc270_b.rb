x, y, z = gets.chomp.split.map(&:to_i)

if 0 < x
  if y < 0 || x < y
    p x
    exit
  end

  if y < z
    p -1
    exit
  end

  p z < 0 ? z.abs * 2 + x : x
else
  if 0 < y || y < x
    p x.abs
    exit
  end

  if z < y
    p -1
    exit
  end

  p 0 < z ? z.abs * 2 + x.abs : x.abs
end