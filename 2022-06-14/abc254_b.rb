n = gets.chomp.to_i

if n == 1
  p 1
  exit
end

a = []
(0..n - 1).each do |i|
  if i == 0
    a.push([1])
  else
    a.push(Array.new(i + 1))
    (0..i).each do |j|
      if j == 0 || j == i
        a[i][j] = 1
      else
        a[i][j] = a[i-1][j-1] + a[i-1][j]
      end
    end
  end
  (0..i).each do |j|
    print a[i][j]
    print ' '
  end
  print "\n"
end