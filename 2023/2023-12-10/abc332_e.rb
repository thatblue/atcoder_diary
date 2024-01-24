n, d = gets.chomp.split.map(&:to_i)

items = gets.chomp.split.map(&:to_i).sort
@average = items.sum.fdiv(d)

def calc_variance(bags)
  bags_size = bags.size
  bags.map { |v| (v - @average)**2 }.sum.fdiv(bags_size)
end

variance = Float::INFINITY
ok = items.first
ng = items.sum
while (ng - ok) > 1
  center = (ok + ng) / 2
  count = 1
  current_weight = 0
  bags = []
  items.each do |item|
    if current_weight >= center
      count += 1
      bags << current_weight
      current_weight = 0
    end

    current_weight += item
  end

  if current_weight < center
    count -= 1
    last_bag = bags.pop
    bags << last_bag + current_weight
  else
    bags << current_weight
  end

  variance = [calc_variance(bags), variance].min if count == d

  if count >= d
    ok = center
  else
    ng = center
  end
end

puts variance
