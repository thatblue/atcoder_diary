n = gets.chomp.to_i
array = gets.chomp.split.map(&:to_i).sort!.uniq

if n == 1
  p array[0] == 1 ? 1 : 0
  exit
end

read_books = 0
duplicates = n - array.length

1.upto(n) do |current|
  latest = array[0]

  if latest.nil? || current < latest
    if duplicates + array.length < 2
      break
    end

    if duplicates == 1
      duplicates = 0
      array.pop
    elsif duplicates >= 2
      duplicates -= 2
    else
      array.pop(2)
    end

    read_books += 1
  else
    array.shift()
    read_books += 1
  end
end

p read_books