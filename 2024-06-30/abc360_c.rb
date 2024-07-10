n = gets.chomp.to_i
current_positions = gets.chomp.split.map(&:to_i)
weights = gets.chomp.split.map(&:to_i)

positions = {}
ans = 0
n.times do |i|
  # いま箱の中にものがなければそのまま格納する
  unless positions.key?(current_positions[i])
    positions[current_positions[i]] = weights[i]
    next
  end

  # 箱の中に既に入っているのであれば、軽い方を移動する
  if positions[current_positions[i]] < weights[i]
    # 現在入っている荷物の方が軽いので、移して新しい荷物を現在の箱に残す
    ans += positions[current_positions[i]]
    positions[current_positions[i]] = weights[i]
  else
    # 現在入っている荷物の方が重い
    ans += weights[i]
  end
end

puts ans
