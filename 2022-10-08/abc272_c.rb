gets.chomp.to_i
array = gets.chomp.split.map(&:to_i)

odds = []
evens = []
array.each do |num|
  if num.even?
    evens = (evens + [num]).max(2)
  else
    odds = (odds + [num]).max(2)
  end
end

if evens.length < 2 && odds.length < 2
  p -1
  exit
elsif evens.length < 2
  p odds.sum
  exit
elsif odds.length < 2
  p evens.sum
  exit
end

p evens.sum > odds.sum ? evens.sum : odds.sum
