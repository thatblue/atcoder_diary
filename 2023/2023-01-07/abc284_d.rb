t = gets.chomp.to_i

t.times do
  n = gets.chomp.to_i

  sqrt = Math.sqrt(n).floor

  p = q = nil
  2.upto(sqrt) do |i|
    div, mod = n.divmod(i)
    next if mod > 0

    div_sqrt = Math.sqrt(div)
    if div_sqrt == div_sqrt.to_i
      p = div_sqrt.to_i
      q = i
    else
      p = i
      q = div / i
    end

    break
  end

  puts "#{p} #{q}"
end
