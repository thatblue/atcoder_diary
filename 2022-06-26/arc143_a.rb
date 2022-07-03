a, b, c = gets.split(' ').map!(&:to_i).sort!

if a == b && b == c
  p a
  exit
end

if a == 0
  p b == c ? b : -1
  exit
end

if a + b >= c
  p c
  exit
end

p -1