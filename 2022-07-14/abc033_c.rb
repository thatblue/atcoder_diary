formulas = gets.chomp.split('+')

replace_count = 0
formulas.each do |formula|
  chars = formula.split('*').map(&:to_i)
  if chars.include?(0)
    next
  end

  replace_count += 1
end

p replace_count