n = gets.chomp.to_i

cups = []

n.times do
  f, s = gets.chomp.split.map(&:to_i)

  cups << { :flavor => f, :yummy => s }
end

cups.sort_by! { |cup| -cup[:yummy] }

best = nil
second_same_flavor = nil
second_another_flavor = nil
cups.each do |cup|
  if best.nil?
    best = cup
    next
  end

  if second_same_flavor.nil? && best[:flavor] == cup[:flavor]
    second_same_flavor = cup
  elsif second_another_flavor.nil? && best[:flavor] != cup[:flavor]
    second_another_flavor = cup
  end

  break if !second_same_flavor.nil? && !second_another_flavor.nil?
end

second_same_yummy = second_same_flavor.nil? ? 0 : second_same_flavor[:yummy] / 2
second_another_yummy = second_another_flavor.nil? ? 0 : second_another_flavor[:yummy]

puts [
  best[:yummy] + second_same_yummy,
  best[:yummy] + second_another_yummy
].max
