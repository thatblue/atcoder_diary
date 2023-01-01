require 'set'

gets.chomp.to_i
array = gets.chomp.split.map(&:to_i)

current_min = 0
values = SortedSet.new
array.each do |value|
  values.add(value)
  if value <= current_min
    current_min.upto(200001) do |v|
      next if values.include? v
      current_min = v
      break
    end
  end
  puts current_min
end
