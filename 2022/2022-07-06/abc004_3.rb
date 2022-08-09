n = gets.chomp.to_i % 30

last_moved_card, moving_position = n.divmod(5)

cards = [1, 2, 3, 4, 5, 6]

if last_moved_card > 0
  cards = cards[last_moved_card..-1] + cards[0..(last_moved_card - 1)]
end

if moving_position > 0
  moving_card = cards.shift
  cards = cards[0..(moving_position - 1)] + [moving_card] + cards[moving_position..-1]
end

print cards.join + "\n"