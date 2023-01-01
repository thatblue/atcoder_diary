$chars = gets.chomp.chars
$length = $chars.count

def search(start_index, parent_chars)
  current_chars = parent_chars.clone
  index = start_index

  while index < $length
    char = $chars[index]

    if char == '('
      index = search(index + 1, current_chars)
      return -1 if index == -1
    elsif char == ')'
      return index + 1
    else
      current_chars[char] += 1
      return -1 if current_chars[char] > 1
      index += 1
    end
  end

  index
end

result = search(0, Hash.new(0))

puts result > -1 ? 'Yes' : 'No'