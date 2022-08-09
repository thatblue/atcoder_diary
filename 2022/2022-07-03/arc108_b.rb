n = gets.chomp.to_i

s = gets.chomp.chars

abbr_s = []

(0..n-1).each do |index|
  if index < 2 || s[index] != "x"
    abbr_s << s[index]
    next
  end

  f_candidate = abbr_s[-2]
  o_candidate = abbr_s[-1]

  if f_candidate + o_candidate + s[index] == "fox"
    abbr_s.slice!(-2, 2)
  else
    abbr_s << s[index]
  end
end

p abbr_s.length
