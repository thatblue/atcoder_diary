n = gets.chomp.to_i

n.upto(999) do |candidate|
  digits = candidate.to_s.chars.map(&:to_i)

  if digits[0] * digits[1] == digits[2]
    puts candidate
    exit
  end
end
