def can_one_move(a, b, c, d)
  if (a - c).abs + (b - d).abs <= 3
    return true
  end

  if (a + b) == (c + d) || (a - b) == (c - d)
    return true
  end

  false
end

def can_two_move(a, b, c, d)
  if (a + b + c + d) % 2 == 0
    return true
  end

  if (a - c).abs + (b - d).abs <= 6
    return true
  end

  if ((a + b) - (c + d)).abs <= 3 || ((a - b) - (c - d)).abs <= 3
    return true
  end

  false
end

r_from, c_from = gets.split(' ').map!(&:to_i)
r_to, c_to = gets.split(' ').map!(&:to_i)

if r_from == r_to && c_from == c_to
  p 0
  exit
end

if can_one_move(r_from, c_from, r_to, c_to)
  p 1
  exit
end

if can_two_move(r_from, c_from, r_to, c_to)
  p 2
  exit
end

p 3