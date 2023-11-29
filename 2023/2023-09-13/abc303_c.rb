DIRECTIONS = { 'U' => { x: 0, y: 1 }, 'D' => { x: 0, y: -1 }, 'L' => { x: -1, y: 0 }, 'R' => { x: 1, y: 0 } }

n, m, h, k = gets.chomp.split.map(&:to_i)
s = gets.chomp.chars

items = {}

m.times do
  item_pos = gets.chomp.split.map(&:to_i)
  items[item_pos] = true
end

pos_x = 0
pos_y = 0
current_hp = h
s.each do |direction|
  pos_x += DIRECTIONS[direction][:x]
  pos_y += DIRECTIONS[direction][:y]
  current_hp -= 1

  if current_hp.negative?
    puts 'No'
    exit
  end

  if current_hp < k && items[[pos_x, pos_y]]
    items.delete([pos_x, pos_y])
    current_hp = k
  end
end

puts 'Yes'
