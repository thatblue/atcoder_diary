n = gets.chomp.to_i

s = gets.chomp.chars

detected = {}

s.each_with_index do |char, index|
  detected[char] = true

  if detected.length == 3
    puts index + 1
    exit
  end
end
