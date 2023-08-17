# frozen_string_literal: true

_n, x = gets.chomp.split.map(&:to_i)
values = {}
gets.chomp.split.map(&:to_i).each do |value|
  values[value] = true
end

values.each_key do |value|
  if values.key?(value - x) || values.key?(value + x)
    puts 'Yes'
    exit
  end
end

puts 'No'
