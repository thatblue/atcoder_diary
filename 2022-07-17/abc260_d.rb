n, k = gets.chomp.split.map(&:to_i)
cards = gets.chomp.split.map(&:to_i)

card_eaten_turn = Array.new(n, -1)
card_stacks = []

cards.each_with_index do |card, index|
  target_stack_index = card_stacks.bsearch_index do |stack|
    stack.last > card
  end

  turn_no = index + 1

  if k == 1
    # 常に除去される
    card_eaten_turn[card - 1] = turn_no
    next
  end

  if target_stack_index.nil?
    card_stacks << [card]
  else
    card_stacks[target_stack_index] << card
    if card_stacks[target_stack_index].length == k
      card_stacks[target_stack_index].each do |eaten_card|
        card_eaten_turn[eaten_card - 1] = turn_no
      end
      card_stacks.delete_at(target_stack_index)
    end
  end

  # 処理の性質上、末尾は必ず昇順でソートされるのでsort_by!する必要はない
end

card_eaten_turn.each do |turn|
  p turn
end