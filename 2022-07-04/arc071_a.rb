ORDER_A = "a".ord

n = gets.chomp.to_i

def nest(chars)
  nested = {}
  chars.each do |char|
    nested[char] ||= 0
    nested[char] += 1
  end

  nested
end

common_chars = nil
(1..n).each do
  s = nest(gets.chomp.chars.sort)
  if common_chars == nil
    common_chars = s
    next
  end

  tmp_common_chars = {}

  common_chars.each_pair do |char, length|
    if s[char]
      tmp_common_chars[char] = [length, s[char]].min
    end
  end

  common_chars = tmp_common_chars
end

common_chars.each_pair do |char, length|
  print char * length
end

