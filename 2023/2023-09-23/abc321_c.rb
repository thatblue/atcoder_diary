k = gets.chomp.to_i

if k <= 10
  puts k
  exit
end

current_order = 10
prev_digits = Hash.new {|hash, key| hash[key] = []}
(1..9).each do |top_digit|
  (0..top_digit-1).each do |second_digit|
    current_num = top_digit.to_s + second_digit.to_s
    if k == current_order
      puts current_num
      exit
    end
    prev_digits[top_digit] << current_num
    current_order += 1
  end
end

loop do
  current_digits = Hash.new {|hash, key| hash[key] = []}
  (1..9).each do |top_digit|
    (0..top_digit-1).each do |second_digit|
      prev_digits[second_digit].each do |child_digits|
        current_num = top_digit.to_s + child_digits
        if k == current_order
          puts current_num
          exit
        end
        current_digits[top_digit] << current_num
        current_order += 1
      end
    end
  end
  prev_digits = current_digits
end
