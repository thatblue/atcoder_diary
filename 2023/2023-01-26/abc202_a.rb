DICE_SIDES_SUM = 7
puts gets.chomp.split.map {|value| DICE_SIDES_SUM - value.to_i }.sum
