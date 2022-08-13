s = gets.chomp.sub(/a/, '1').sub(/t/, '2').sub(/c/, '3').sub(/o/, '4').sub(/d/, '5').sub(/e/, '6').sub(/r/, '7').chars.map(&:to_i)

op_count = 0
6.times do |i|
  (i + 1).upto(6) do |j|
    if s[i] > s[j]
      s[i], s[j] = s[j], s[i]
      op_count += 1
    end
  end
end

p op_count