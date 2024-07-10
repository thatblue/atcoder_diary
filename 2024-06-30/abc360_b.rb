s, t = gets.chomp.split

s_chars = s.chars
s_length = s.size

1.upto(s_length - 1) do |w|
  1.upto(w) do |c|
    sliced_chars = s_chars.each_slice(w).to_a
    sliced_chars.pop if sliced_chars[-1].length < c
    sliced_chars[-1].fill('', sliced_chars[-1].length..w-1)
    vertical_chars = sliced_chars.transpose

    if vertical_chars[c - 1].join == t
      puts 'Yes'
      exit
    end
  end
end

puts 'No'
