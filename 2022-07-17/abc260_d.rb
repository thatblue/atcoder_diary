n, k = gets.chomp.split.map(&:to_i)
cards = gets.chomp.split.map(&:to_i)

card_stacks = []
card_eaten_turn = Array.new(n, -1)

cards.each_with_index do |value, index|
  turn_no = index + 1

  stack_index = card_stacks.bsearch_index do |stack|
    stack[0] > value
  end

  if stack_index == nil
    card_stacks << [value]
  else
    card_stacks[stack_index].unshift(value)
  end

  new_card_stacks = []
  card_stacks.each do|stack|
    if stack.length == k
      stack.each do |card|
        card_eaten_turn[card - 1] = turn_no
      end
    else
      new_card_stacks << stack
    end
  end

  card_stacks = new_card_stacks

  card_stacks.sort!
end

card_eaten_turn.each do |turn|
  p turn
end