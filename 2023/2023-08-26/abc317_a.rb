n, h, x = gets.chomp.split.map(&:to_i)
portion = gets.chomp.split.map(&:to_i)

portion.each_with_index do |recovery, i|
  if recovery + h >= x
    puts i + 1
    exit
  end
end
