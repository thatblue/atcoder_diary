n, k = gets.chomp.split.map(&:to_i)

array = gets.chomp.split.map(&:to_i)
chars = Hash.new

max = 0
array.each_with_index do |value, index|
  chars.each_pair do |key, current_chars|
    if current_chars.length == k && !current_chars.include?(value)
      chars.delete(key)
      next
    end

    current_chars[value] += 1
    max = [max, current_chars.sum { |k, v| v }].max
  end

  chars[index] = Hash.new
  chars[index].default = 0
  chars[index][value] = 1
  if max == 0
    max = 1
  end
end

p max
