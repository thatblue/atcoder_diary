r, c = gets.chomp.split.map(&:to_i)

current_color = "black"
1.upto(8) do |left|
  right = 15 - left + 1

  if [left, right].include?(r) || [left, right].include?(c)
    puts current_color
    exit
  end

  current_color = current_color == "black" ? "white" : "black"
end
