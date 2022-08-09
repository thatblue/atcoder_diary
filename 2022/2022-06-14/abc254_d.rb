# ref. https://atcoder.jp/contests/abc254/submissions/32314624

require 'prime'

n = gets.chomp.to_i

square_numbers = 0
(1..n).each do |current|
  remain = current.prime_division.each_with_object([]) do |item, result|
    result << item[0] if item[1].odd?
  end.inject(&:*)

  remain ||= 1
  (1..n).each do |sqrt|
    break if remain * sqrt ** 2 > n
    square_numbers += 1
  end
end

p square_numbers
