s = gets.chomp.chars

def alpha_to_num(alpha)
  alpha.ord - "A".ord + 1
end

task_order = nil
s.reverse_each.with_index do |char, index|
  char_order = alpha_to_num(char)
  task_order ||= char_order

  if index > 0
    task_order += char_order * 26 ** index
  end
end

puts task_order
