n = gets.chomp.to_i
array = gets.chomp.split.map(&:to_i)

prev = array.shift
ans = [prev]
until array.empty?
  current = array.shift

  if (prev - current).abs > 1
    if prev < current
      ans += (prev + 1..current - 1).to_a
    else
      ans += (current + 1..prev - 1).to_a.reverse
    end
  end

  ans << current
  prev = current
end

puts ans.join ' '
