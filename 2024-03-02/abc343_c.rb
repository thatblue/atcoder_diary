n = gets.chomp.to_i

cbrt_of_n = Math.cbrt(n).floor

cbrt_of_n.downto(1) do |i|
  pow3_of_i = (i ** 3).to_s

  if pow3_of_i == pow3_of_i.reverse
    puts pow3_of_i
    exit
  end
end
