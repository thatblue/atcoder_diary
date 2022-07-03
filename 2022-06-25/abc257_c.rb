n = gets.chomp.to_i
s = gets.chomp.chars.map!(&:to_i)
w = gets.split(' ').map!(&:to_i)

children = []
adults = []
persons = [0]
(0..n - 1).each do |index|
  persons << w[index]
  if s[index] == 0
    children << w[index]
  else
    adults << w[index]
  end
end

children.sort!
adults.sort! {|a,b| b <=> a}
persons.sort!
persons.push(10 ** 9 + 1)

x_max = 0
persons.each do | threshold |
  children_count = children.bsearch_index {|x| x >= threshold} || children.count
  adult_count = adults.bsearch_index {|x| x < threshold} || adults.count

  x_max = [x_max, children_count + adult_count].max
end

p x_max