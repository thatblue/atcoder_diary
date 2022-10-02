
detected = false
a = nil
b = 10
c = nil
d = 10
1.upto(10) do |current|
  s_i = gets.chomp.chars

  if s_i.include?("#") && !detected
    a = current
    detected = true
    col_detected = false
    s_i.each_with_index do |value, index|
      if value == "#" && !col_detected
        c = index + 1
        col_detected = true
      elsif value =="." && col_detected
        d = index
        break
      end
    end
  elsif detected && !s_i.include?("#")
    b = current - 1
    detected = false
  end
end

puts [a, b].join(" ")
puts [c, d].join(" ")
