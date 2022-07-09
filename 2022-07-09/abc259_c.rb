def compress(array)
  prev_char = nil

  compressed = []
  array.each do |char|
    if char == prev_char
      last_char = compressed.pop
      compressed << [char, last_char[1] + 1]
    else
      compressed << [char, 1]
      prev_char = char
    end
  end

  compressed
end

s = gets.chomp.chars
t = gets.chomp.chars

if s == t
  puts "Yes"
  exit
end

compressed_s = compress(s)
compressed_t = compress(t)

if compressed_s.length != compressed_t.length
  puts "No"
  exit
end

compressed_t.each_with_index do |value, index|
  if compressed_s[index][0] != value[0]
    puts "No"
    exit
  end

  if compressed_s[index][1] != value[1]
    if compressed_s[index][1] == 1
      # 増やす方が1文字少ない場合は調整不可
      puts "No"
      exit
    end

    if compressed_s[index][1] > value[1]
      # 増やす方の文字が多い場合も調整出来ない
      puts "No"
      exit
    end

  end
end

puts "Yes"
