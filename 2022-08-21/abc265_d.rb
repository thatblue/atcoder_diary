n, p, q, r = gets.chomp.split.map(&:to_i)
array = gets.chomp.split.map(&:to_i)

x = 0
while x <= n - 3 do
  x_summary = 0
  y = x + 1
  while y <= n - 2 do
    x_summary += array[y - 1]
    if x_summary > p
      break
    end
    if x_summary < p
      y += 1
      next
    end

    y_summary = 0
    z = y + 1
    while z <= n - 1 do
      y_summary += array[z - 1]
      if y_summary > q
        break
      end
      if y_summary < q
        z += 1
        next
      end

      z_summary = 0
      w = z + 1
      while w <= n do
        z_summary += array[w - 1]
        if z_summary > r
          break
        end
        if z_summary < r
          w += 1
          next
        end

        puts "Yes"
        exit
      end
      z += 1
    end
    y += 1
  end
  x += 1
end

puts "No"