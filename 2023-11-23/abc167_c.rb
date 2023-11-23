n, m, x = gets.chomp.split.map(&:to_i)

max_price = 0
books = []
n.times do |book_index|
  book = gets.chomp.split.map(&:to_i)
  price = book[0]
  books << { :price => book[0], :skills => book[1..] }
  max_price += price
end

search_max = 2**n - 1
ans = max_price + 1
(1..search_max).each do |bit|
  current_price = 0
  algo_skills = Array.new(m, 0)
  n.times do |book_index|
    next if bit[book_index] == 0

    current_price += books[book_index][:price]
    m.times do |algo_index|
      algo_skills[algo_index] += books[book_index][:skills][algo_index]
    end
  end

  next if algo_skills.min < x

  ans = [current_price, ans].min
end

puts ans == max_price + 1 ? -1 : ans
