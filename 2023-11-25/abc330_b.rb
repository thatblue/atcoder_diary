n, l, r = gets.chomp.split.map(&:to_i)
array = gets.chomp.split.map(&:to_i)

ans = []
array.each do |a_i|
  if a_i < l
    ans << l
  elsif a_i < r
    ans << a_i
  else
    ans << r
  end
end

puts ans.join ' '
