n, m = gets.chomp.split.map(&:to_i)

parents = gets.chomp.split.map(&:to_i)

parents.unshift(0, 0)

children = Array.new(n + 1) { Array.new }

parents.each_with_index do |parent, current|
  children[parent] << current if parent > 0
end

insuarances = Hash.new(0)
m.times do
  cont, gen = gets.chomp.split.map(&:to_i)

  insuarances[cont] = [insuarances[cont], gen + 1].max
end

ans = 0
cont_generations = Hash.new(0)
cont_generations[1] = insuarances[1]
current_gen = [1]

until current_gen.empty?
  next_gen = Hash.new
  current_gen.each do |person|
    cont_generations[person] = [cont_generations[person], insuarances[person]].max
    ans += 1 if cont_generations[person].positive?

    children[person].each do |child|
      next_gen[child] = true

      next if cont_generations[person].zero?

      cont_generations[child] = cont_generations[person] - 1
    end
  end

  current_gen = next_gen.keys
end

puts ans
