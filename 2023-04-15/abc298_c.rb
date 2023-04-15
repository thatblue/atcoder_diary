require 'set'

n = gets.chomp.to_i
q = gets.chomp.to_i

boxes = Array.new(n + 1)
cards = {}

q.times do
  query = gets.chomp.split.map(&:to_i)

  if query[0] == 1
    i = query[1]
    j = query[2]
    boxes[j] ||= {}
    boxes[j].default = 0
    boxes[j][i] += 1

    cards[i] ||= Set.new
    cards[i] << j
  elsif query[0] == 2
    i = query[1]
    current_cards = []
    boxes[i].keys.sort.each do |value|
      current_cards += Array.new(boxes[i][value], value)
    end

    puts current_cards.join(' ')
  else
    i = query[1]
    puts cards[i].to_a.sort.join(' ')
  end
end
