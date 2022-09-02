n = gets.chomp.to_i

if n % 2 == 1
  exit
end

max = 2 ** (n - 1) - 1

def valid_parentheses?(chars)
  open_parentheses = 0
  chars.each do |char|
    if char == '0'
      open_parentheses += 1
    else char == '1'
    open_parentheses -= 1
    end

    if open_parentheses < 0
      return false
    end
  end

  true
end

1.upto(max) do |current|
  binary = current.to_s(2).rjust(n, '0').chars
  if binary.count('0') != n / 2
    next
  end

  if valid_parentheses?(binary)
    puts binary.map { |bit| bit == '0' ? '(' : ')' }.join
  end
end
