n = gets.chomp.to_i
a = gets.split(' ').map!(&:to_i)

points = 0
bases = [false, false, false, false]
a.each { |a_n|
  bases[0] = true
  3.downto(0) {|index|
    if bases[index]
      if index + a_n > 3
        points += 1
      else
        bases[index + a_n] = true
      end
      bases[index] = false
    end
  }
}

p points