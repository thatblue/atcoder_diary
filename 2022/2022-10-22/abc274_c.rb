n = gets.chomp.to_i
diaries = gets.chomp.split.map(&:to_i)

ameba_generations = Array.new(n * 2 + 2)
ameba_generations[1] = 0

diaries.each_with_index do |parent, i|
  diary_index = i + 1
  parent_gen = ameba_generations[parent]

  ameba_generations[diary_index * 2] = parent_gen + 1
  ameba_generations[diary_index * 2 + 1] = parent_gen + 1
end

puts ameba_generations[1..]